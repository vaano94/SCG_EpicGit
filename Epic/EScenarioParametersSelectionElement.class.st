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

{ #category : #'generate widget' }
EScenarioParametersSelectionElement >> generateElementFor: widget atIndex: index [
	"I accept a widget and return its representation"

	| widgetName result |
	widgetName := widget name.
	widgetName = 'input'
		ifTrue: [ result := EScenarioTextInputWidget new
				parameterIndex: index;
				parameterName: widget parameterName ].
	widgetName = 'class'
		ifTrue: [ | gtExamplesForClass methodDictionary |
			gtExamplesForClass := widget object gtExamples.
			methodDictionary := self parametrizedExample
				createMapFromCompiledMethodList: gtExamplesForClass.
			result := EScenarioSelectionWidget new
				parameterIndex: index;
				parameterName: widget parameterName;
				examples: methodDictionary values ].
	widgetName = 'classDropdown'
		ifTrue: [ | gtExamplesForClass methodDictionary |
			gtExamplesForClass := widget object gtExamples.
			methodDictionary := self parametrizedExample
				createMapFromCompiledMethodList: gtExamplesForClass.
			result := EScenarioSelectionDropdownWidget new
				parameterIndex: index;
				parameterName: widget parameterName;
				examples: methodDictionary values ].
	widgetName = 'search'
		ifTrue: [ | gtExamplesForClass methodDictionary |
			gtExamplesForClass := widget object gtExamples.
			methodDictionary := self parametrizedExample
				createMapFromCompiledMethodList: gtExamplesForClass.
			result := EScenarioSelectionSpotterWidget new
				parameterIndex: index;
				parameterName: widget parameterName;
				examples: methodDictionary values ].
	widgetName = 'multipleSearch'
		ifTrue: [ | gtExamplesForClass methodDictionary |
			gtExamplesForClass := widget object gtExamples.
			methodDictionary := self parametrizedExample
				createMapFromCompiledMethodList: gtExamplesForClass.
			result := EScenarioSelectionSpotterMultipleSelectionWidget new
				parameterIndex: index;
				parameterName: widget parameterName;
				examples: methodDictionary values ].
	^ result
]

{ #category : #initialization }
EScenarioParametersSelectionElement >> initialize [
	super initialize.
	self
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ]
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
	| container argumentAmount |
	container := BlElement new
		layout: BlFlowLayout vertical;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		background: Color white.
	self drawnElements
		do: [ :de | 
			de margin: (BlInsets all: 10).
			container addChild: de ].
	argumentAmount := self parametrizedExample exampleMethod
		gtParametrizedExample numberOfRequieredArguments.
	methodParams := Array new: argumentAmount.
	self addChild: container
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
