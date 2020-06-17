Class {
	#name : #EParametrizedExampleParameterWidget,
	#superclass : #BlElement,
	#instVars : [
		'editView',
		'order',
		'widgetsDict',
		'parameterName',
		'classname',
		'insideClass',
		'widgetType',
		'parameterNameWidget',
		'inClassWidget',
		'exampleInWidget',
		'widgetTypeWidget'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> actOnExampleDeleted: aChild [
	self editView methodParametersElement removeChild: aChild.
]

{ #category : #building }
EParametrizedExampleParameterWidget >> build [
	|removeButton clickHandler parentContainer firstLineContainer secondLineContainer|
	
	parentContainer:= BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContentLimited .
			c horizontal matchParent. ].
	
	firstLineContainer:= self defaultHorizontalLayoutElementForChoice.
	parameterName 
		ifNil: [ firstLineContainer addChild: (self editorForParameter: ''). ] 
		ifNotNil: [ firstLineContainer addChild: (self editorForParameter: parameterName) ]. 
	classname 
		ifNil: [ firstLineContainer addChild: (self searchWidgetForClass: '') ] 
		ifNotNil: [ firstLineContainer addChild: (self searchWidgetForClass: classname) ].
	parentContainer addChild: firstLineContainer.
	
	secondLineContainer:= self defaultHorizontalLayoutElementForChoice.
	insideClass	
		ifNil: [secondLineContainer addChild: (self searchWidgetForInside: '')] 
		ifNotNil: [ secondLineContainer addChild: (self searchWidgetForInside: insideClass) ].	
	widgetType 
		ifNil: [secondLineContainer addChild: (self choiceWidgetForParameter: '')] 
		ifNotNil: [ secondLineContainer addChild: (self choiceWidgetForParameter: widgetType) ].
	parentContainer addChild: secondLineContainer.	
	self addChild: parentContainer.
]

{ #category : #'parameter widgets' }
EParametrizedExampleParameterWidget >> choiceWidgetForParameter: param [
	| exampleList initialButtonElement toggleButtonLabel dropDownLook childContainer label buttonInstance |
	childContainer := self defaultHorizontalLayoutElementForChoice.
	label := self labelWith: 'Widget: '.
	toggleButtonLabel = ''.
	exampleList := BrSimpleList new.
	exampleList
		stencil: [ :anExample :index | 
			BrLabel new
				text: anExample asRopedText;
				look: (BrLabelLook new fontSize: 16);
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 6);
				when: BlClickEvent
					do: [ :anEvent | exampleList selectOne: index ] ];
		when: BrSelectionChanged
			do: [ :anEvent | 
			anEvent
				selectedDo: [ :anInterval | 
					| widget |
					widget := exampleList items at: anInterval first.
					toggleButtonLabel := widget.
					widgetType := widget ] ];
		fitContent;
		margin:
			(BlInsets
				left: 0;
				right: 0);
		border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5).
	exampleList items: self widgetsDict keys.
	buttonInstance := self toggleButton: param.
	initialButtonElement := buttonInstance
		look:
			BrGlamorousButtonWithLabelAndIconLook
				+
					(dropDownLook := BrGlamorousWithDropdownLook
						handle: [ (self toggleButton: param)
								look: BrGlamorousButtonWithLabelAndIconLook - BrGlamorousButtonExteriorLook;
								yourself ]
						content: [ exampleList ]);
		margin: (BlInsets all: 8).
	exampleList
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination builder return build;
				action: [ initialButtonElement label: toggleButtonLabel.
					dropDownLook hide ]).
	widgetTypeWidget := initialButtonElement.
	childContainer
		addChildren:
			{label.
			initialButtonElement}.
	^ childContainer
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> classname [
	^ classname
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> classname: anObject [
	classname := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> composePragmaString [
	|pragmaString exampleMethodClassName parameterNameWithArticle |
	pragmaString:= '<given: #''{1}'' ofType: #{2} in: #{3} elementType: #{4}>'.
	"<given: #book ofType: #ABAddressBook in: #ABAddressBookExamples	elementType: #dropdown>"
	exampleMethodClassName:= editView parametrizedExample exampleMethod classBinding value.
	parameterNameWithArticle := ((parameterNameWidget editor text value asString) copyReplaceAll: ' ' with: '').
	
	(((parameterNameWithArticle asLowercase findString: 'a') = 1) or: ((parameterNameWithArticle asLowercase findString: 'an') = 1)) ifFalse: [ 
	parameterNameWithArticle at: 1 put: (parameterNameWithArticle first asUppercase).
	parameterNameWithArticle first isVowel 
		ifTrue: [ parameterNameWithArticle:= 'an', parameterNameWithArticle]  
		ifFalse: [ parameterNameWithArticle:= 'a' , parameterNameWithArticle ].
		].
	pragmaString:= pragmaString format: {
		parameterNameWithArticle . 
		(inClassWidget parameterValue asString) . 
		(exampleInWidget parameterValue asString) .
	 	(widgetTypeWidget label asString)
	}.
	self inform: pragmaString.
	^ pragmaString.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> composePragmaString: exampleMethodClassName [
	|pragmaString parameterNameWithArticle |
	pragmaString:= '<given: #''{1}'' ofType: #{2} in: #{3} elementType: #{4}>'.
	"<given: #book ofType: #ABAddressBook in: #ABAddressBookExamples	elementType: #dropdown>"
	"exampleMethodClassName:= editView parametrizedExample exampleMethod classBinding value."
	parameterNameWithArticle := ((parameterNameWidget editor text value asString) copyReplaceAll: ' ' with: '').
	
	(((parameterNameWithArticle asLowercase findString: 'a') = 1) or: ((parameterNameWithArticle asLowercase findString: 'an') = 1)) ifFalse: [ 
	parameterNameWithArticle at: 1 put: (parameterNameWithArticle first asUppercase).
	parameterNameWithArticle first isVowel 
		ifTrue: [ parameterNameWithArticle:= 'an', parameterNameWithArticle]  
		ifFalse: [ parameterNameWithArticle:= 'a' , parameterNameWithArticle ].
		].
	pragmaString:= pragmaString format: {
		parameterNameWithArticle . 
		(inClassWidget parameterValue asString) . 
		(exampleInWidget parameterValue asString) .
	 	(widgetTypeWidget label asString)
	}.
	self inform: pragmaString.
	^ pragmaString.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> defaultHorizontalLayoutElementForChoice [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		padding:
			(BlInsets top: 3 left: 3 bottom: 3 right: 3);
		background: Color white;
		layout: (BlLinearLayout horizontal cellSpacing: 3);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> editView [
	^ editView
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> editView: anObject [
	editView := anObject
]

{ #category : #'parameter widgets' }
EParametrizedExampleParameterWidget >> editorForParameter: parameter [
	|editor label childContainer|
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	
	label:= self labelWith: 'Parameter: '.
	editor:= self editorWithEmptyText.
	editor text: parameter.
	parameterNameWidget:= editor.
	
	childContainer addChildren: { label. editor }.
	^ childContainer
]

{ #category : #'parameter widgets' }
EParametrizedExampleParameterWidget >> editorWithEmptyText [
	^ BrEditor new
	constraintsDo: [ :c | 
			c minWidth: 100.
			c padding: (BlInsets all: 10).
			c linear horizontal alignLeft.
			c vertical fitContent.
			c horizontal fitContent.
			c linear weight: 0.3 ];
	geometry: (BlRectangle cornerRadius: 6);	
	look: (BrGlamorousRegularEditorLook new
			glamorousCodeFont;
			fontSize: 16);	
		hFitContent;
		vExact: 35;			
	inputFilter: BrTextEditorAlphaNumericInputFilter new;
				text: '';
				padding: (BlInsets all: 6);
				constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
	border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5)
]

{ #category : #initialization }
EParametrizedExampleParameterWidget >> initialize [
	super initialize.
	self
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		border: (BlBorder paint: (Color gray) width: 0.5);
		constraintsDo: [ :c | 
			c vertical fitContentLimited .
			c horizontal matchParent. ].
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> insideClass [
	^ insideClass
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> insideClass: anObject [
	insideClass := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> labelWith: aText [
^ BrLabel new
		padding: (BlInsets right: 0);
		text: aText;
		look: (BrGlamorousLabelLook new glamorousRegularFont fontSize: 14);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
			c linear vertical alignCenter. ].
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> order [
	^ order
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> order: anObject [
	order := anObject
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> parameterName [
	^ parameterName
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> parameterName: anObject [
	parameterName := anObject
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> parameterNameWidget [
	^ parameterNameWidget
]

{ #category : #'parameter widgets' }
EParametrizedExampleParameterWidget >> searchWidgetForClass: className [
	| childContainer label spotterClassWidget |
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	label:= self labelWith: 'Class: '.
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
	className ifNotNil: [ 
			className ifNotEmpty: [  
					spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
		 			spotterClassWidget defaultValue: (self class environment at: className). ].
	 			 ]. 
	inClassWidget:= spotterClassWidget.
	childContainer addChild: label.
	childContainer addChild: spotterClassWidget .
	^ childContainer
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> searchWidgetForInside: className [
	| childContainer label spotterClassWidget |
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	label:= self labelWith: 'Examples in: '.
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
	className ifNotNil: [ 
			className ifNotEmpty: [  
					spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
		 			spotterClassWidget defaultValue: (self class environment at: className). ].
	 			 ]. 
	exampleInWidget:= spotterClassWidget.					
	childContainer addChild: label.
	childContainer addChild: spotterClassWidget .
	^ childContainer
]

{ #category : #'as yet unclassified' }
EParametrizedExampleParameterWidget >> toggleButton: param [
	^ BrButton new
		label:
			(param
				ifNotNil: [ param ]
				ifNil: [ 'Choose an element' ]);
		look: (BrGlamorousRegularEditorLook new
			glamorousCodeFont;
			fontSize: 20);	
		icon:
			(BlElement new
				size: 10 @ 10;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((10 / 3) rounded @ 10)});
				background: Color lightGray;
				margin: (BlInsets left: 10);
				constraintsDo: [ :c | c linear vertical alignCenter ]).
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> widgetType [
	^ widgetType
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> widgetType: anObject [
	widgetType := anObject
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> widgetsDict [
	^ widgetsDict
]

{ #category : #accessing }
EParametrizedExampleParameterWidget >> widgetsDict: anObject [
	widgetsDict := anObject
]
