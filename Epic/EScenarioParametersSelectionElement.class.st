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
EScenarioParametersSelectionElement >> createScenarioLabelForText: text [
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
EScenarioParametersSelectionElement >> drawnElements [
	^ drawnElements
]

{ #category : #accessing }
EScenarioParametersSelectionElement >> drawnElements: anObject [
	drawnElements := anObject
]

{ #category : #'generate widget' }
EScenarioParametersSelectionElement >> generateElement2For: widget atIndex: index [
	"I accept a widget and return its representation"
	EScenarioInputWidget subclasses 
		detect: [ :aSubclass |
			aSubclass widgetType = widget name ]
		ifFound: [ :aWidgetClass |
			^ aWidgetClass 
				forIndex: index 
				widgetModel: widget
				parametrizedExample: self parametrizedExample ]
		ifNone: [ Error signal: 'Widget not found' ]
]

{ #category : #initialization }
EScenarioParametersSelectionElement >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ]
]

{ #category : #initialization }
EScenarioParametersSelectionElement >> initializeForParametrizedExample: aParametrizedExample [
	| widgetModels  |
	"I receive parametrized example and initialize values for widget view"
	parametrizedExample := aParametrizedExample.
	self drawnElements: OrderedCollection new.

	"an array of widgets(name, object)"
	widgetModels := aParametrizedExample recognizeWidgetElements.
	widgetModels
		doWithIndex: [ :we :index | 
			| element |
			element := self generateElement2For: we atIndex: index.
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
EScenarioParametersSelectionElement >> selectedParameterValues [
	"	^ self children collect: #parameterValue"

	^ self drawnElements collect: [ :child | child parameterValue ]
]

{ #category : #updating }
EScenarioParametersSelectionElement >> updateWidget [
	| container argumentAmount aScrollPane scenarioLabel|
	container := BlElement new
		layout: BlFlowLayout vertical;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		background: Color white.
			
	self parametrizedExample boundScenario
			ifNil: [ 
					(self parametrizedExample exampleMethod pragmaAt: #label:) 
						ifNil: [ self addChild: (self createScenarioLabelForText: 'scenario text is not specified') ] 
						ifNotNil: [ :pragma |
						self addChild: (self createScenarioLabelForText: (pragma arguments first)). 
						 ]]
			ifNotNil: [
					self addChild: (self createScenarioLabelForText: (self parametrizedExample boundScenario description))].
	
	aScrollPane := BlScrollableElement new.
	aScrollPane constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
		
	container addChild: aScrollPane.	
	self drawnElements
		do: [ :de | 
			de margin: (BlInsets all: 10).
			container addChild: de ].
		
	argumentAmount := self parametrizedExample exampleMethod
		gtParametrizedExample numberOfRequieredArguments.
	methodParams := Array new: argumentAmount.
	self addChild: (container asScrollableElement)
]

{ #category : #widgetWrap }
EScenarioParametersSelectionElement >> wrapWidgetWithParameterName: widget [
	| element label |
	element := BlElement new
		layout: (BlLinearLayout vertical cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	label := BrLabel new
		margin: (BlInsets left: 100);
		"look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);"
			look: BrLabelLook new;
		text: widget parameterName.
	element addChild: label.
	element addChild: widget.
	^ element
]
