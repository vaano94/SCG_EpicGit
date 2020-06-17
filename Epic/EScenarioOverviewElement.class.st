Class {
	#name : #EScenarioOverviewElement,
	#superclass : #BlElement,
	#instVars : [
		'scenario',
		'descDocumenter',
		'simpleExDocumenter'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
EScenarioOverviewElement >> addSaveButton [
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Save';
		action: [ :button |
			self scenario descriptionText: self descDocumenter editor text asString.
			self scenario simpleExampleText: self simpleExDocumenter editor text asString.
			self inform: self descDocumenter editor text asString.
		 ];
		margin: (BlInsets top: 10 left: 10 bottom: 10 right: 0);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
		]
		
]

{ #category : #'as yet unclassified' }
EScenarioOverviewElement >> blLabelFor: text [
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
EScenarioOverviewElement >> descDocumenter [
	^ descDocumenter
]

{ #category : #accessing }
EScenarioOverviewElement >> descDocumenter: anObject [
	descDocumenter := anObject
]

{ #category : #'as yet unclassified' }
EScenarioOverviewElement >> emptyDocumenter [
	|aDocument|
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	^ aDocument.
]

{ #category : #'as yet unclassified' }
EScenarioOverviewElement >> generateExamplesTextForDocumenter [
	|txt|
	txt:= ''.
	self scenario exampleMethods do: [ :e |
		txt:= txt, '${example:', e method name , '|previewHeight=150|codeExpanded=false|codeHeight=80}$', String cr].
	^ txt.
]

{ #category : #'as yet unclassified' }
EScenarioOverviewElement >> generateParameterizedExamplesTextForDocumenter [
	|txt|
	txt:= ''.
	self scenario parametrizedExamples do: [ :e |
		"${method:GtDocumentExamples>>#referencedMethod|expanded}$"
		txt:= txt, '${method:', e exampleMethod name , '|expanded}$', String cr].
	^ txt.
]

{ #category : #initialization }
EScenarioOverviewElement >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
]

{ #category : #initialization }
EScenarioOverviewElement >> initializeDocumenterView: text [
	|container aDocument textElement|
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: text.
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 0 left: 15 bottom: 0 right: 15);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	container addChild: (textElement).
	^ container.	
	
]

{ #category : #initialization }
EScenarioOverviewElement >> initializeDocumenterView: text forDocumenter: docu [
	|container aDocument textElement tempText|
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	tempText:= text.
	text ifNotNil: [] ifNil: [ tempText := '' ].
	docu text: tempText.
	textElement := docu asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 0 left: 15 bottom: 0 right: 15);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	container addChild: (textElement).
	^ container.	
	
]

{ #category : #initialization }
EScenarioOverviewElement >> initializeExamplesTab [
	|container aDocument textElement label|
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	
	label:= self blLabelFor: 'Examples:'.
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: self generateExamplesTextForDocumenter.
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 0 left: 15 bottom: 0 right: 15);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	container addChild: label.	
	container addChild: (textElement).
	^ container.	
	
]

{ #category : #initialization }
EScenarioOverviewElement >> initializeForScenario: scen [
	|descriptionTextDocumenter simpleExampleDocumenter|
	self scenario: scen.
	descriptionTextDocumenter:= self emptyDocumenter.
	self descDocumenter: descriptionTextDocumenter.
	self addChild: (self blLabelFor: 'Description:').
	self addChild: (self initializeDocumenterView: (scen descriptionText) forDocumenter: descriptionTextDocumenter).
	
	simpleExampleDocumenter:= self emptyDocumenter.
	self simpleExDocumenter: simpleExampleDocumenter.
	self addChild: (self blLabelFor: 'SimpleExample:').
	self addChild: (self initializeDocumenterView: (scen simpleExampleText) forDocumenter: simpleExampleDocumenter).
	
	self addChild: self initializeExamplesTab.
	self addChild: self initializeParameterizedExamplesTab.
	self addChild: self addSaveButton.
	
]

{ #category : #initialization }
EScenarioOverviewElement >> initializeParameterizedExamplesTab [
	|container aDocument textElement label|
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	
	label:= self blLabelFor: 'Parametrized Examples:'.
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: self generateParameterizedExamplesTextForDocumenter.
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 0 left: 15 bottom: 0 right: 15);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	container addChild: label.	
	container addChild: (textElement).
	^ container.	
	
]

{ #category : #accessing }
EScenarioOverviewElement >> scenario [
	^ scenario
]

{ #category : #accessing }
EScenarioOverviewElement >> scenario: anObject [
	scenario := anObject
]

{ #category : #accessing }
EScenarioOverviewElement >> simpleExDocumenter [
	^ simpleExDocumenter
]

{ #category : #accessing }
EScenarioOverviewElement >> simpleExDocumenter: anObject [
	simpleExDocumenter := anObject
]
