Class {
	#name : #EScenarioParametrizedExampleCreationHelper,
	#superclass : #BlElement,
	#instVars : [
		'classSelectSpotterWidget',
		'spotterReturnClassWidget',
		'methodNameInput',
		'labelDocumenter',
		'descriptionDocumenter',
		'parameterAmountNumber',
		'methodParametersElement',
		'widgetDict'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> actOnExampleDeleted: aChild [
	self methodParametersElement removeChild: aChild.
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> blLabelFor: text [
^ BrLabel new
		text: text;
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5);
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize; fontSize: 20); 
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignLeft ].
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> classSelectSpotterWidget [
	^ classSelectSpotterWidget
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> classSelectSpotterWidget: anObject [
	classSelectSpotterWidget := anObject
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> createAddExampleButton [
		^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Generate parametrized example definition';
		action: [ :button |
			| coder saveAction block|
			coder := GtMethodCoder 
				forClass: classSelectSpotterWidget parameterValue
				source: self generateMethodString.
			coder expanded: true.
			block:= [
				|s|
				coder save.
				coder compile. 
				].
			saveAction:= (coder addOns mainActions detect: [:act | act asString = 'a GtCoderAction(Save)']).
			saveAction action: block.

			button phlow spawnObject: coder ];
		border: (BlBorder paint: (Color green) width: 3);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
		].
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> createAddParameterButton [
		| cont button |
		^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Add parameter';
		action: [ self methodParametersElement addChild: self spawnEmptyParameterChoiceContainer ];
		border: (BlBorder paint: (Color green) width: 3);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
		].
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> createEmptyParametersElement [
	|paramElement|
		paramElement := BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].	
		self methodParametersElement: paramElement.
	^ paramElement.	
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> generateMethodString [
	| labelTxt descriptionTxt methodDescription methodNameTxt parameterNameArray|
	methodDescription:= ''.
	
	labelTxt:= labelDocumenter document text asString trim copyReplaceAll: '''' with: ''''''.
	descriptionTxt:= descriptionDocumenter document text asString trim copyReplaceAll: '''' with: ''''''.
	methodNameTxt:= methodNameInput text asString trim.
	methodDescription := methodDescription , methodNameTxt, '_'.
	
	(1 to: methodParametersElement children size) doWithIndex: [ :e :index | | parameterName |
		parameterName:= ((methodParametersElement children at: 1) children at:1) parameterNameWidget text asString.
		methodDescription:= methodDescription, parameterName , ':' , parameterName, ' ' ].
	
	methodDescription := methodDescription , String cr.
	methodDescription := methodDescription , '<gtExample>', String cr.
	methodDescription := methodDescription , '<gtParametrizedExample>', String cr.
	methodDescription := methodDescription ,  '<label: ''', labelTxt ,'''>', String cr.
	methodDescription := methodDescription ,  '<description: ''', descriptionTxt ,'''>', String cr.
	
	self methodParametersElement children do: [ :paramElement |
		| str |
		str:= (paramElement children at: 1) composePragmaString: classSelectSpotterWidget parameterValue asString.
		methodDescription:= methodDescription, str, String cr.
		].
	
	methodDescription := methodDescription , '<return:#', spotterReturnClassWidget parameterValue asString, '>', String cr.
	methodDescription := methodDescription ,  '"This method lacks implementation. Consider providing the right invocation call"', String cr.
	methodDescription := methodDescription ,  '|result |' , String cr.
	methodDescription := methodDescription ,  'result:= Object new.' , String cr.
	methodDescription := methodDescription ,  '^ result ' , String cr.
	
	^ methodDescription
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> getHelpButton [
^ ((BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons help asElement;
		label: 'We do not recommend to use more than four parameters in methods')
		border: (BlBorder paint: (Color green) width: 3);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		look:
			BrGlamorousButtonWithIconLook)	
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> getRemoveExampleButton [
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
			c ignored vertical alignTop ].
		"action: [ self inform: 'clicked' ]."
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent. ].
	
	self initializeWidgetDict.
	
	self addChild: self initializeForLabel.
	self addChild: self initializeForDescription.
	self addChild: self initializeForMethodName.
	self addChild: self initializeForClassSearch.
"	self addChild: self initializeForParameterAmount."
	self addChild: self createEmptyParametersElement.
	self addChild: self createAddParameterButton.
	self addChild: self createAddExampleButton.
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForClassSearch [
	|container saveLabel returnLabel returnClassSpotter spotterClassWidget|
	container:= BlElement new 
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	saveLabel:= self blLabelFor: 'Save in class: '.
	
	returnLabel:= self blLabelFor: 'Return Class: '.
	
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
	spotterClassWidget 
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 7).
		
	returnClassSpotter:= EParametrizedExampleEditViewSelectionSpotterWidget new.
	returnClassSpotter
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 7).	
	
	self classSelectSpotterWidget: spotterClassWidget.
	self spotterReturnClassWidget: returnClassSpotter.
	
	container addChild: saveLabel.		
	container addChild: spotterClassWidget.
	
	container addChild: returnLabel.		
	container addChild: spotterReturnClassWidget.
	
	^ container.	
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForDescription [
	|container label documenter aDocument text textElement |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Description: '.
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: ('I represent a detailed and thorough behaviour').
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	
	descriptionDocumenter:= textElement.
		
	container addChild: label.		
	container addChild: textElement.		
	
	^ container.	
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForLabel [
	|container label aDocument textElement |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Label: '.
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: ('I represent a brief description of a method').
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	
	labelDocumenter:= textElement.
		
	container addChild: label.		
	container addChild: textElement.		
	
	^ container.	
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForMethodName [
	|container label editorLook editor |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Method Name: '.
	
	editorLook := (BrGlamorousRegularEditorLook new fontSize: 22).
	editor := BrEditor new
		inputFilter: BrTextEditorLetterInputFilter new;
		text: ' ';
		look:	editorLook;	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	
	methodNameInput:= editor.
		
	container addChild: label.		
	container addChild: editor.		
	
	^ container.	
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForParameterAmount [
	|container label editorLook editor aDocument textElement |
	container:= BlElement new 
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Parameter Amount: '.
	
	editorLook := (BrGlamorousRegularEditorLook new fontSize: 22).
	editor := BrEditor new
		inputFilter: BrTextEditorDigitInputFilter new;
		hExact: 22;
		text: '1';
		look:	editorLook;	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 1);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
		parameterAmountNumber:= 1.
	editor editor when: BrTextEditorModifiedEvent do: [ :anEvent | 
		|trimmed number|
		trimmed:= (editor text asString trim).
		trimmed isEmpty ifTrue: [ 
		number:= trimmed asNumber.
		((number > 4) or: (number = 0)) ifTrue: [ editor text: '1' ].
		parameterAmountNumber:= number.
		 ].	
		].
		
	container addChild: label.		
	container addChild: editor.
	container addChild: self getHelpButton.
	
	^ container.	
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeWidgetDict [
	|wDict|
	wDict:= SmallDictionary new.
	EScenarioInputWidget subclasses collect: [ :subclass | wDict at: (subclass widgetType) put: subclass ].
	self widgetDict: wDict.
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> methodParametersElement [
	^ methodParametersElement
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> methodParametersElement: anObject [
	methodParametersElement := anObject
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> spawnEmptyParameterChoiceContainer [
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
		widgetsDict: self widgetDict;
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
EScenarioParametrizedExampleCreationHelper >> spotterReturnClassWidget [
	^ spotterReturnClassWidget
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> spotterReturnClassWidget: anObject [
	spotterReturnClassWidget := anObject
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> widgetDict [
	^ widgetDict
]

{ #category : #accessing }
EScenarioParametrizedExampleCreationHelper >> widgetDict: anObject [
	widgetDict := anObject
]
