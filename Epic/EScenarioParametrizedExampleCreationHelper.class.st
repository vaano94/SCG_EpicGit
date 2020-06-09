Class {
	#name : #EScenarioParametrizedExampleCreationHelper,
	#superclass : #BlElement,
	#instVars : [
		'classSelectSpotterWidget',
		'methodNameInput',
		'labelDocumenter',
		'descriptionDocumenter',
		'parameterAmountNumber'
	],
	#category : #'Epic-Model'
}

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
				"s:= (exampleMethod methodClass name), '>>#' , coder selector."
				"self propertyTests add: coder compiledMethod."
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
		]
]

{ #category : #'as yet unclassified' }
EScenarioParametrizedExampleCreationHelper >> generateMethodString [
	| labelTxt descriptionTxt methodDescription methodNameTxt parameterNameArray|
	methodDescription:= ''.
	parameterNameArray:= Array with: 'one' with: 'two' with: 'three' with: 'four' with: 'five'.
	
	labelTxt:= labelDocumenter document text asString trim copyReplaceAll: '''' with: ''''''.
	descriptionTxt:= descriptionDocumenter document text asString trim copyReplaceAll: '''' with: ''''''.
	methodNameTxt:= methodNameInput text asString trim.
	methodDescription := methodDescription , methodNameTxt, '_'.
	
	(1 to: parameterAmountNumber) doWithIndex: [ :e :index | methodDescription:= methodDescription, (parameterNameArray at: index) , ':' , (parameterNameArray at: index), ' ' ].
	
	methodDescription := methodDescription , String cr.
	methodDescription := methodDescription , '<gtExample>', String cr.
	methodDescription := methodDescription , '<gtParametrizedExample>', String cr.
	methodDescription := methodDescription ,  '<label: ''', labelTxt ,'''>', String cr.
	methodDescription := methodDescription ,  '<description: ''', descriptionTxt ,'''>', String cr.
	
	(1 to: parameterAmountNumber) doWithIndex: [ :e :index | 
		methodDescription := methodDescription , '<given:#', (parameterNameArray at: index) ,' ofType:#String in:#'''' elementType:#input>', String cr.]. 
	methodDescription := methodDescription , '<return:#Object>', String cr.
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

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	self addChild: self initializeForLabel.
	self addChild: self initializeForDescription.
	self addChild: self initializeForMethodName.
	self addChild: self initializeForClassSearch.
	self addChild: self initializeForParameterAmount.
	self addChild: self createAddExampleButton.
]

{ #category : #initialization }
EScenarioParametrizedExampleCreationHelper >> initializeForClassSearch [
	|container label documenter aDocument text textElement spotterClassWidget|
	container:= BlElement new 
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Class: '.
	
	spotterClassWidget:= EParametrizedExampleEditViewSelectionSpotterWidget new.
	spotterClassWidget 
		border: (BlBorder paint: (Color green) width: 3);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
"		 					spotterClassWidget defaultValue: (self class environment at: returnClass)\. "
	
	self classSelectSpotterWidget: spotterClassWidget.	
	container addChild: label.		
	container addChild: spotterClassWidget.
	
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
		border: (BlBorder paint: (Color green) width: 3);
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
	|container label documenter aDocument text textElement |
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
		border: (BlBorder paint: (Color green) width: 3);
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
	|container label editorLook aDocument editor textElement |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	label:= self blLabelFor: 'Method Name: '.
	
	editorLook := (BrGlamorousRegularEditorLook new fontSize: 25).
	editor := BrEditor new
		inputFilter: BrTextEditorLetterInputFilter new;
		text: ' ';
		look:	editorLook;	
		border: (BlBorder paint: (Color green) width: 3);
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
	
	editorLook := (BrGlamorousRegularEditorLook new fontSize: 25).
	editor := BrEditor new
		inputFilter: BrTextEditorDigitInputFilter new;
		hExact: 27;
		text: '1';
		look:	editorLook;	
		border: (BlBorder paint: (Color green) width: 3);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	editor editor when: BrTextEditorModifiedEvent do: [ :anEvent | 
		|trimmed number|
		trimmed:= (editor text asString trim).
		trimmed size > 0 ifTrue: [ 
		number:= trimmed asNumber.
		((number > 4) or: (number=0)) ifTrue: [ editor text: '1' ].
		parameterAmountNumber:= number.
		 ].	
		].
		
	container addChild: label.		
	container addChild: editor.
	container addChild: self getHelpButton.
	
	^ container.	
]
