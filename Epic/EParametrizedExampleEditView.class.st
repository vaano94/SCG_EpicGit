Class {
	#name : #EParametrizedExampleEditView,
	#superclass : #BlElement,
	#instVars : [
		'parametrizedExample',
		'container',
		'widgetsDict'
	],
	#category : #'Epic-Model'
}

{ #category : #'parameter widgets' }
EParametrizedExampleEditView >> choiceWidgetForParameter: param [
	| exampleList initialButtonElement toggleButtonLabel dropDownLook childContainer label buttonInstance | 
	
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	label:= self labelWith: 'Widget: '.
	
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
					do:
						[ :anEvent | exampleList selectOne: index ] ];
		when: BrSelectionChanged
			do: [ :anEvent | 
			anEvent
				selectedDo: [ :anInterval | 
					| widget |
					widget := exampleList items at: anInterval first.
					toggleButtonLabel := widget ] ];
		fitContent;
		margin:
			(BlInsets
				left: 0;
				right: 0);
		border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5).

	exampleList display: self widgetsDict keys.
	
	buttonInstance := (self toggleButton: param).
				
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
				action: [ 
					initialButtonElement label: toggleButtonLabel.
					dropDownLook hide ]).
				
				
	childContainer addChildren: { label. initialButtonElement }.
	^ childContainer
]

{ #category : #accessing }
EParametrizedExampleEditView >> container [
	^ container
]

{ #category : #accessing }
EParametrizedExampleEditView >> container: anObject [
	container := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> createDescriptionForParametrizedExample: aParametrizedExample [
	| label aDocument text textElement|
	
	text:= aParametrizedExample exampleMethod gtParametrizedExample description.
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
"		border: (BlBorder paint: (Color blue) width: 3);"
		constraintsDo: [ :c | 
			c vertical fitContentLimited .
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	"text:= aParametrizedExample description example."
	aDocument text: (text asString asRopedText).
	textElement := aDocument asElementWithoutSaveAction
		vFitContent;
		hMatchParent.
"	textElement	border: (BlBorder paint: (Color green) width: 3)."
		
	label  := BrLabel new
		padding: (BlInsets top: 0 left: 10 bottom: 0 right: 6);
		margin: (BlInsets top: 10 left: 10); 
		text: 'Description: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 18);
		constraintsDo: [ :c | 
			c minWidth: 80.
			c linear horizontal alignLeft.
			c linear vertical alignTop. ].
	container addChild: label.
	container addChild: textElement.	
	^ container
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> createLabelForParametrizedExample: aParametrizedExample [
	| label aDocument text textElement|
	
	text:= aParametrizedExample exampleMethod gtParametrizedExample label.
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
"		border: (BlBorder paint: (Color blue) width: 3);"
		constraintsDo: [ :c | 
			c vertical fitContent .
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: (text asString asRopedText).
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
"	textElement	border: (BlBorder paint: (Color green) width: 3)."	
	label := BrLabel new
		padding: (BlInsets top: 0 left: 10 bottom: 10 right: 6);
		margin: (BlInsets top: 10 left: 10); 
		text: 'Label: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 18);
		constraintsDo: [ :c | 
			c minWidth: 50.
			c linear horizontal alignLeft.
			c linear vertical alignTop. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> createParametersChoiceForParametrizedExample: aParametrizedExample [
	| label aDocument textElement pragmas |
				
	container := BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].	
	
	pragmas:= aParametrizedExample exampleMethod pragmas select: [ :p | 
			p selector == #given:ofType:in:
				| (p selector == #given:ofType:in:elementType:) ].
   pragmas doWithIndex: [ :p :index | 
		|childContainer editorWidget widgetChoiceWidget spotterClassWidget|
		childContainer := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].	
			 
			childContainer addChild: (self editorForParameter: (p argumentNamed:#given)). 
			childContainer addChild: (self searchWidgetForClass: (p argumentNamed:#ofType)).
			childContainer addChild: (self choiceWidgetForParameter: (p argumentNamed:#elementType)).
			
		container addChild: childContainer.
		 ].
	
			
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Parameters: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
		
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> createReturnElementForParametrizedExample: aParametrizedExample [
	| label childContainer spotterClassWidget returnClass|
	
	childContainer := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent .
			c horizontal matchParent ].
			
	label := BrLabel new
		padding: (BlInsets top: 10 left: 10 bottom: 0 right: 6);
		margin: (BlInsets top: 10 left: 10); 
		text: 'Returns: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 18);
		constraintsDo: [ :c | 
			c minWidth: 100.
			c linear horizontal alignLeft.
			c linear vertical alignTop. ].
	returnClass := (aParametrizedExample exampleMethod pragmas detect: [ :p | p selector = #return: ] ) argumentNamed: #return.
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
		 					spotterClassWidget defaultValue: (self class environment at: returnClass). 
						
	childContainer addChild: label.
	childContainer addChild: spotterClassWidget .
	^ childContainer
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> defaultHorizontalLayoutElementForChoice [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		padding:
			(BlInsets top: 5 left: 10 bottom: 5 right: 5);
		background: Color white;
		layout: (BlLinearLayout horizontal cellSpacing: 8);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
]

{ #category : #'parameter widgets' }
EParametrizedExampleEditView >> editorForParameter: parameter [
	|editor label childContainer|
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	
	label:= self labelWith: 'Parameter: '.
	editor:= self editorWithEmptyText.
	editor text: parameter.
	
	childContainer addChildren: { label. editor }.
	^ childContainer
]

{ #category : #'parameter widgets' }
EParametrizedExampleEditView >> editorWithEmptyText [
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
EParametrizedExampleEditView >> initialize [ 
	super initialize.
	
	self
		layout: BlLinearLayout vertical ;
		"padding: (BlInsets all: 6);"
		border: (BlBorder paint: (Color red ) width: 3);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ]
]

{ #category : #initialization }
EParametrizedExampleEditView >> initializeForParametrizedExample: aParametrizedExample [
	| scenarioName labelElement descriptionElement parametersElement returnsElement wDict|
	self parametrizedExample: aParametrizedExample.
	
	aParametrizedExample boundScenario
			ifNil: [ 	scenarioName:= 'scenario text is not specified'] 
			ifNotNil: [ scenarioName:= aParametrizedExample boundScenario description].
	
	wDict:= SmallDictionary new.
		EScenarioInputWidget subclasses collect: [ :subclass | wDict at: (subclass widgetType) put: subclass ].
	self widgetsDict: wDict.
	
	labelElement:= self createLabelForParametrizedExample: aParametrizedExample.
	self addChild: labelElement.		

	descriptionElement:= self createDescriptionForParametrizedExample: aParametrizedExample.
	self addChild: descriptionElement.
	
	parametersElement:= self createParametersChoiceForParametrizedExample: aParametrizedExample.	
	self addChild: parametersElement.
	
	returnsElement:= self createReturnElementForParametrizedExample: aParametrizedExample.	
	self addChild: returnsElement.

	^ self
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> labelWith: aText [
^ BrLabel new
		padding: (BlInsets right: 0);
		text: aText;
		look: (BrGlamorousLabelLook new glamorousRegularFont fontSize: 14);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
			c linear vertical alignCenter. ].
]

{ #category : #accessing }
EParametrizedExampleEditView >> parametrizedExample [
	^ parametrizedExample
]

{ #category : #accessing }
EParametrizedExampleEditView >> parametrizedExample: anObject [
	parametrizedExample := anObject
]

{ #category : #'parameter widgets' }
EParametrizedExampleEditView >> searchWidgetForClass: className [
	| childContainer label spotterClassWidget |
	childContainer:= self defaultHorizontalLayoutElementForChoice.
	label:= self labelWith: 'Class: '.
	className ifNotNil: [ spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
							self inform: 'oppa'.
		 					spotterClassWidget defaultValue: (self class environment at: className). ]
	 			 ifNil: [ spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new ]. 
						
	childContainer addChild: label.
	childContainer addChild: spotterClassWidget .
	^ childContainer
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> toggleButton: param [
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
EParametrizedExampleEditView >> widgetsDict [
	^ widgetsDict
]

{ #category : #accessing }
EParametrizedExampleEditView >> widgetsDict: anObject [
	widgetsDict := anObject
]
