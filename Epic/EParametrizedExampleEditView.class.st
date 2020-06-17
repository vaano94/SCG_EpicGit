Class {
	#name : #EParametrizedExampleEditView,
	#superclass : #BlElement,
	#instVars : [
		'parametrizedExample',
		'methodParametersElement',
		'container',
		'widgetsDict'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> actOnExampleDeleted: aChild [
	self methodParametersElement removeChild: aChild.
]

{ #category : #adding }
EParametrizedExampleEditView >> addPragmaToExample: pragmaString [
	|trans|
	trans := (RBAddPragmaTransformation new
		pragma: pragmaString
		inMethod: parametrizedExample exampleMethod method selector asString
		inClass: parametrizedExample exampleMethod methodClass)
		transform.
	trans changes execute.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> collectConsecutivePragmaStrings [
	"exclude gtExample or gtParametrizedExample from pragma list and return string representation of other pragmas"
	^ (self parametrizedExample exampleMethod pragmas 
		select: [ :p | ((p selector =  'gtExample' or: p selector = 'gtParametrizedExample') not ) ])
		collect: [ :p | p asString ].
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
EParametrizedExampleEditView >> createAddParameterButton: aParametrizedExample [
		| cont button |
		cont := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContentLimited .
			c horizontal matchParent. ].
		
		button:= BrButton new
					look: BrGlamorousButtonWithIconLook - BrGlamorousButtonExteriorLook;
					icon: BrGlamorousIcons add asElement;
					action: [ "self inform: 'Clicked add parameter.'."
								self methodParametersElement addChild: self spawnEmptyParameterChoiceContainer ];
					constraintsDo: [ :c | 
						c linear horizontal alignCenter. ].
		cont addChild: button.
		^ cont.			
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> createApplyChangesElement [
      | cont button |
		cont := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContentLimited .
			c horizontal matchParent. ].
		
		button:= BrButton new
					look: BrGlamorousButtonWithLabelLook new;
					label: 'Apply';
					action: [ "self inform: 'Clicked'."
								self refactorExistingMethod.
						  ];
					constraintsDo: [ :c | 
						c linear horizontal alignCenter. ].
		cont addChild: button.
		^ cont.	
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
				
	methodParametersElement := BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].	
	
	pragmas:= aParametrizedExample exampleMethod pragmas select: [ :p | 
			p selector == #given:ofType:in:
				| (p selector == #given:ofType:in:elementType:) ].
   pragmas doWithIndex: [ :p :index | 
		|childContainer parameterWidget removeButton clickHandler insideClass|
		childContainer := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].	
		insideClass := p argumentNamed:#in.
		insideClass = 'self' ifTrue: [
			insideClass := aParametrizedExample exampleMethod methodClass name
		].
		parameterWidget:= EParametrizedExampleParameterWidget new 
			editView: self;
			order: index;
			widgetsDict: self widgetsDict;
			parameterName: (p argumentNamed:#given) ; 
			classname: (p argumentNamed:#ofType);
			insideClass: insideClass;
			widgetType: (p argumentNamed:#elementType);
			build.
			childContainer addChild: parameterWidget.
			
			removeButton:= self getRemoveExampleButton.
			clickHandler := BlEventHandler
				on: BlClickEvent
				do: [
					self actOnExampleDeleted: childContainer
			 	].
				removeButton addEventHandler: clickHandler.
			childContainer addChild: removeButton.
			
		methodParametersElement addChild: childContainer.
		 ].
		
	^ methodParametersElement.	
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
		padding: (BlInsets top: 10 left: 10 bottom: 20 right: 6);
		margin: (BlInsets top: 10 left: 10); 
		text: 'Returns: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 18);
		constraintsDo: [ :c | 
			c minWidth: 100.
			c linear horizontal alignLeft.
			c linear vertical alignCenter.
			c frame vertical alignCenter.
			 ].
	returnClass := (aParametrizedExample exampleMethod pragmas detect: [ :p | p selector = #return: ])  argumentNamed: #return.
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
		 					spotterClassWidget defaultValue: (self class environment at: returnClass); constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c frame vertical alignCenter.
			 ].
						
	childContainer addChild: label.
	childContainer addChild: spotterClassWidget .
	^ childContainer
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> getRemoveExampleButton [
	^ GtInspectorRoundButtonStencil normal asElement
		icon: GtInspectorPlusIconStencil close asElement;
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c
				margin:
					(BlInsets
						top: 2
						left: 0
						bottom: 0
						right: 2).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ];
		action: [ self inform: 'clicked' ].
"	^ BrButton new
		look: BrGlamorousButtonWithIconLook - BrGlamorousButtonExteriorLook;
		icon: BrGlamorousIcons close asElement;
		beTiny;
		label: 'Remove example';
		margin: (BlInsets left: 5);
		action: [ :button | self inform: 'remove triggered' ]
"
]

{ #category : #initialization }
EParametrizedExampleEditView >> initialize [ 
	super initialize.
	self
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ]
]

{ #category : #initialization }
EParametrizedExampleEditView >> initializeForParametrizedExample: aParametrizedExample [
	| scenarioName labelElement descriptionElement parametersElement addParameterButtonElement returnsElement applyChangesElement wDict|
	self parametrizedExample: aParametrizedExample.
	
	aParametrizedExample boundScenario
			ifNil: [ 	
					(parametrizedExample exampleMethod pragmaAt: #label:) 
						ifNil: [ scenarioName:= 'scenario text is not specified' ]
						ifNotNil: [ :pragma |
						scenarioName:= pragma arguments first. 
						 ].
					]
			ifNotNil: [ scenarioName:= aParametrizedExample boundScenario description].
	
	wDict:= SmallDictionary new.
		EScenarioInputWidget subclasses collect: [ :subclass | wDict at: (subclass widgetType) put: subclass ].
	self widgetsDict: wDict.
	
	labelElement:= self createLabelForParametrizedExample: aParametrizedExample.
	self addChild: labelElement.		

	descriptionElement:= self createDescriptionForParametrizedExample: aParametrizedExample.
	self addChild: descriptionElement.
	
	parametersElement:= self createParametersChoiceForParametrizedExample: aParametrizedExample.	
	self methodParametersElement: parametersElement.
	self addChild: parametersElement.
	
	addParameterButtonElement:= self createAddParameterButton: aParametrizedExample.	
	self addChild: addParameterButtonElement.
	
	returnsElement:= self createReturnElementForParametrizedExample: aParametrizedExample.	
	self addChild: returnsElement.
	
	applyChangesElement:= self createApplyChangesElement.	
	self addChild: applyChangesElement.

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
EParametrizedExampleEditView >> methodParametersElement [
	^ methodParametersElement
]

{ #category : #accessing }
EParametrizedExampleEditView >> methodParametersElement: anObject [
	methodParametersElement := anObject
]

{ #category : #accessing }
EParametrizedExampleEditView >> parametrizedExample [
	^ parametrizedExample
]

{ #category : #accessing }
EParametrizedExampleEditView >> parametrizedExample: anObject [
	parametrizedExample := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> refactorDecreaseArguments: parametersNames withPrefix: old_prefix [
	|parametersString changedNameString refactoring|
	parametersString:=''.
	changedNameString:= old_prefix , '_' , parametersString.
	refactoring := RBRemoveParameterRefactoring 
		removeParameter: parametrizedExample exampleMethod selector
		in: parametrizedExample exampleMethod methodClass name
		selector: changedNameString.
	refactoring execute.	
	^ nil
]

{ #category : #accessing }
EParametrizedExampleEditView >> refactorExistingMethod [
	|pragmaStrings labelText descriptionText returnText pragmasConsecutiveStrings parametersNames |
	self inform: 'Inside refactor existing method'.
	pragmaStrings:= OrderedCollection new.
	self methodParametersElement children do: [ :paramElement |
		| str exampleMethodClassName|
		exampleMethodClassName:= self parametrizedExample exampleMethod.		
		str:= ((paramElement children at: 1) composePragmaString: exampleMethodClassName).
		 pragmaStrings add: str].
	labelText:= ((self children at: 1) children at: 2) document editor text asString.
	descriptionText:= ((self children at: 2) children at: 2) document editor text asString.
	returnText:= ((self children at: 5) children at: 2) parameterValue asString.
	
	"self inform: 'label: ', labelText.
	self inform: 'description: ', descriptionText.
	self inform: 'pragmas: ', pragmaStrings asString.
	self inform: 'return: ', returnText."
	
	"collect and remove all pragmas"
	pragmasConsecutiveStrings:= self collectConsecutivePragmaStrings.
	pragmasConsecutiveStrings do: [ :pragmaString |  self removePragmaFromExample: pragmaString ].
	
	"sequentially add new pragmas"
	self addPragmaToExample: ('<label: ''', labelText , '''>').
	self addPragmaToExample: ('<description: ''', labelText , '''>').
	pragmaStrings do: [ :ps | self addPragmaToExample: ps ].
	self addPragmaToExample: ('<return: #', returnText , '>').
	
	self refactorMethodName.
	
	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> refactorIncreaseArguments: parametersNames withPrefix: old_prefix [
	|parametersString changedNameString refactoring|
	parametersString:=''.
	(1 to: (parametersNames size)) do: [ :e |parametersString:= parametersString, (parametersNames at: e) , ':'. ].
	changedNameString:= old_prefix , '_' , parametersString.
	refactoring := RBAddParameterRefactoring 
		addParameterToMethod: parametrizedExample exampleMethod selector
		in: parametrizedExample exampleMethod methodClass name
		newSelector: changedNameString
		initializer: 'self printString'.
"		initializer: 'x:= new Object'."
	refactoring execute.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> refactorMethodName [
	|parametersNames oldMethodArgumentsSize oldPrefix numOfReworkedArgs|
	
	oldPrefix:= (parametrizedExample exampleMethod selector splitOn: '_') at: 1.
	
	parametersNames:= OrderedCollection new. 
	self methodParametersElement children do: [ :child | 
		|parameterWidget| 
			parameterWidget:= child children at: 1.
			parametersNames add: (parameterWidget parameterNameWidget editor text asString).
		].
	oldMethodArgumentsSize:= parametrizedExample exampleMethod argumentNames size.
	
	numOfReworkedArgs:= (parametersNames size) - oldMethodArgumentsSize.
	numOfReworkedArgs > 0 ifTrue: [
			(1 + oldMethodArgumentsSize) to: (parametersNames size) do: [ :index |
				|tmp|
				tmp:= parametersNames at: index.
				"insert 'an' or 'a' symbol if the parameter does not start with it, otherwise, ignore"
				(((tmp asLowercase findString: 'a') = 1) or: ((tmp asLowercase findString: 'an') = 1)) ifFalse: [ 
					tmp at: 1 put: (tmp first asUppercase).
					tmp first isVowel
						ifTrue: [ tmp:= 'an', tmp]
						ifFalse: [ tmp:= 'a' , tmp ].
					parametersNames at: index put: tmp.
					 ].
				 ].
		 ].
	
	parametersNames size > oldMethodArgumentsSize 
		ifTrue: [ self refactorIncreaseArguments: parametersNames withPrefix: oldPrefix ].
	parametersNames size < oldMethodArgumentsSize 	
		ifTrue: [ 
			"figure out deleted argument names"
			self parametrizedExample exampleMethod argumentNames.
			self refactorDecreaseArguments: parametersNames withPrefix: oldPrefix ].
]

{ #category : #removing }
EParametrizedExampleEditView >> removePragmaFromExample: pragmaString [
	|trans|
	trans := (RBRemovePragmaTransformation new
		pragma: pragmaString
		inMethod: parametrizedExample exampleMethod method selector asString
		inClass: parametrizedExample exampleMethod methodClass)
		transform.
	trans changes execute.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleEditView >> spawnEmptyParameterChoiceContainer [
	| childContainer parameterContainerSize emptyParameterWidget removeButton clickHandler |
	childContainer := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.

			c horizontal fitContent ].
	parameterContainerSize := self methodParametersElement children size.
"	self
		inform: 'parameterContainser size : ' , (parameterContainerSize + 1) asString."
	emptyParameterWidget := EParametrizedExampleParameterWidget new
		editView: self;
		insideClass: '';
		order: parameterContainerSize;
		widgetsDict: self widgetsDict;
		build.
	removeButton := self getRemoveExampleButton.
	clickHandler := BlEventHandler
		on: BlClickEvent
		do: [ self actOnExampleDeleted: childContainer ].
	removeButton addEventHandler: clickHandler.
	childContainer addChild: emptyParameterWidget.
	childContainer addChild: removeButton.
	^ childContainer
]

{ #category : #accessing }
EParametrizedExampleEditView >> widgetsDict [
	^ widgetsDict
]

{ #category : #accessing }
EParametrizedExampleEditView >> widgetsDict: anObject [
	widgetsDict := anObject
]
