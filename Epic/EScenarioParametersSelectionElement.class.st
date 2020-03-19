Class {
	#name : #EScenarioParametersSelectionElement,
	#superclass : #BlElement,
	#instVars : [
		'methodDictionaries',
		'parametrizedExample',
		'methodParams',
		'drawnElements'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EScenarioParametersSelectionElement >> createAListOfMethods: methodDictionary inDisplay: in [
	| aList |
	aList := BrSimpleList new.
	aList
		stencil: [ :anExample :index | 
			BlTextElement new
				text: anExample label asRopedText;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent
					do: [ :anEvent | 
					anEvent consumed: true.
					aList selectOne: index.
					self
						inform: 'Selected: ' , index asString , ' in: ' , in asString.
					self inform: 'Target ' , anEvent target text asString.
					self methodParams at: in put: anExample.
					self inform: methodParams ] ];
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		margin:
			(BlInsets
				left: 20;
				right: 20);
		border: (BlBorder paint: Color lightGray width: 2);
		display: methodDictionary values.
	^ aList
]

{ #category : #'as yet unclassified' }
EScenarioParametersSelectionElement >> createAnInputField: index [
	| editor in |
	editor := BrEditor new
		text: 'haba';
		look: BrEditorLook;
		border: (BlBorder paint: Color red);
		hExact: 100;
		vExact: 50.
	editor
		in: [ :e | 
			e editor
				when: BrTextEditorInsertedEvent
				do: [ self inform: 'Target ' , e editor text.
					self methodParams at: index put: e editor text asString ] ].
	^ editor
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> drawnElements [
	^ drawnElements
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> drawnElements: anObject [
	drawnElements := anObject
]

{ #category : #'as yet unclassified' }
EScenarioParametersSelectionElement >> generateElementFor: widget atIndex: index [
	"I accept a widget and return its representation"

	| widgetName widgetObject result |
	widgetName := widget name.
	widgetName = 'input'
		ifTrue: [ result := self createAnInputField: index ].
	widgetName = 'class'
		ifTrue: [ | gtExamplesForClass compiledMethodMap methodDictionary |
			gtExamplesForClass := widget object gtExamples.
			methodDictionary := self parametrizedExample
				createMapFromCompiledMethodList: gtExamplesForClass.
			result := self
				createAListOfMethods: methodDictionary
				inDisplay: index ].
	^ result
]

{ #category : #initialization }
EScenarioParametersSelectionElement >> initialize [
	super initialize.
	self
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ]
]

{ #category : #initialization }
EScenarioParametersSelectionElement >> initializeForParametrizedExample: aParametrizedExample [
	| examplesArray widgetElements displayElements |
	"I receive parametrized example and initialize values for widget view"
	parametrizedExample := aParametrizedExample.
	self drawnElements: OrderedCollection new.

	"an array of widgets(name, object)"
	widgetElements := aParametrizedExample recognizeWidgetElements.
	widgetElements
		doWithIndex: [ :we :index | 
			| element |
			element := self generateElementFor: we atIndex: index.
			drawnElements add: element ].
	self updateWidget
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> methodDictionaries [
	^ methodDictionaries
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> methodDictionaries: anObject [
	methodDictionaries := anObject
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> methodParams [
	 ^ methodParams
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> methodParams: anObject [
	methodParams := anObject
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> parametrizedExample [
	^ parametrizedExample
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> parametrizedExample: anObject [
	parametrizedExample := anObject
]

{ #category : #'as yet unclassified' }
EScenarioParametersSelectionElement >> selectedExampleMethods [
	^ methodParams
]

{ #category : #'as yet unclassified' }
EScenarioParametersSelectionElement >> selectedValues [
	"..."
]

{ #category : #updating }
EScenarioParametersSelectionElement >> updateWidget [
	| container element argumentAmount |
	
	container := BlElement new
		layout: BlFlowLayout horizontal;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		background: Color white.
	self drawnElements do: [ :de | de margin: (BlInsets all: 10). container addChild: de ].
	argumentAmount := self parametrizedExample exampleMethod
		gtParametrizedExample numberOfRequieredArguments.
	methodParams := Array new: argumentAmount.
	(1 to: argumentAmount)
		do: [ :in | 
			| aList |
			"aList := BrSimpleList new.
			aList
				stencil: [ :anExample :index | 
					BlTextElement new
						text: anExample label asRopedText;
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 5);
						when: BlClickEvent
							do: [ :anEvent | 
							anEvent consumed: true.
							aList selectOne: index.
							self
								inform: 'Selected: ' , index asString , ' in: ' , in asString.
							self inform: 'Target ' , anEvent target text asString.
							methodParams at: in put: anExample.
							self inform: methodParams ] ];
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				margin:
					(BlInsets
						left: 20;
						right: 20);
				border: (BlBorder paint: Color lightGray width: 2);
				display: (methodDictionaries at: in) values."
			"aList := self
				createAListOfMethods: (methodDictionaries at: in)
				inDisplay: in.
			container addChild: aList"
			 ].
	self addChild: container
]
