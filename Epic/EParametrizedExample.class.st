Class {
	#name : #EParametrizedExample,
	#superclass : #Object,
	#instVars : [
		'exampleMethod'
	],
	#category : #'Epic-Model'
}

{ #category : #'examples - buttons' }
EParametrizedExample >> coloredButton [
	<gtExample>
	| button labelText label |
	button := BlElement new
		background:
			(Color
				r: 63
				g: 81
				b: 181
				range: 255);
		geometry: (BlRectangle cornerRadius: 2);
		relocate: 100 @ 100;
		padding:
			(BlInsets
				top: 8
				right: 16
				bottom: 8
				left: 16);
		layout: BlLinearLayout horizontal;
		effect:
			(BlGaussianShadowEffect
				color: (Color black alpha: 0.3)
				width: 1
				offset: 0 @ 2);
		when: BlClickEvent
			do: [ :anEvent | 
			anEvent consumed: true.
			anEvent target phlow selectObject: 1 ];
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	labelText := 'Run' asRopedText
		foreground: Color white;
		fontSize: 13;
		fontName: 'Helvetica';
		thin.
	label := BlTextElement new.
	label text: labelText.
	button addChild: label.
	^ button
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> createMapFromCompiledMethodList: listOfMethods [
	|dict|
	dict:= Dictionary new.
	listOfMethods do: [ :compiledMethod |
		dict at: (compiledMethod selector asString) put: compiledMethod ].
	^ dict
]

{ #category : #accessing }
EParametrizedExample >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
EParametrizedExample >> exampleMethod: anObject [
	exampleMethod := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> executeExample: anExampleMethod withParams: params [
	"I execute a given example scenario with given compiled methods"

	| parametrizedExample convertedParams result |
	parametrizedExample := anExampleMethod gtParametrizedExample.
	convertedParams := self prepareReturnValuesArrayFor: params.
	parametrizedExample arguments: convertedParams.
	result := parametrizedExample run.
	^ result returnValue
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> extractCompiledMethodsFrom: methodDictionaries byNames: anArrayOfNames [
	"methodDictionaries is an orderedCollection, anArrayOfNames is an Array"
	| compiledMethods |
	compiledMethods := Array new: anArrayOfNames size.
	methodDictionaries
		doWithIndex: [ :elem :index | 
			| methodDictionary m methodName |
			m := ''.
			methodDictionary := methodDictionaries at: index.
			methodName := anArrayOfNames at: index.
			m := methodDictionary at: methodName.
			compiledMethods at: index put: m ].
	^ compiledMethods
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> getGtExamplesAsParametersFor: aParamTest [
	"I return an Array of <gtExample> methods for given parametrized method,
	provided, that compiled method has pragma <given:ofType:in>"

	| pragmas searchParams foundClasses examplesDividedByClasses |
	pragmas := aParamTest pragmas.
	searchParams := pragmas
		select: [ :p | p selector == #given:ofType:in: ].
	foundClasses := OrderedCollection new.
	searchParams
		do:
			[ :e | foundClasses add: (self class environment at: (e argumentNamed: #in)) ].
	examplesDividedByClasses := OrderedCollection new.
	foundClasses
		do: [ :aClass | examplesDividedByClasses add: aClass gtExamples ].
	^ examplesDividedByClasses
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> gtViewParameters2For: aView [
	<gtView>
	| selectorElement |
	selectorElement := EScenarioParametersSelectionElement new
		initializeForParametrizedExample: self.
	^ aView explicit
		title: 'Pick Examples';
		stencil: [ selectorElement ];
		actionButtonIcon: BrGlamorousIcons play
			label: 'Run'
			action: [ :aButton | 
			aButton phlow
				spawnObject:
					(self
						executeExample: self exampleMethod
						withParams: selectorElement selectedExampleMethods) ]
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> prepareReturnValuesArrayFor: aCollectionOfExamples [
	"I accept methods declared with <gtExample> , execute them and return an array with returned values"

	^ aCollectionOfExamples
		collect: [ :anExample | 
			(anExample isMemberOf: GtExample)
				ifTrue: [ anExample run returnValue ]
				ifFalse: [ anExample ].
			]
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> recognizeWidgetElements [
	| pragmas searchParams widgets |
	widgets := OrderedCollection new.
	pragmas := self exampleMethod pragmas.
	searchParams := pragmas
		select: [ :p | p selector == #given:ofType:in: ].
	searchParams
		do: [ :e | 
			| val |
			"determine input"
			val := e argumentNamed: #in.
			val = 'input'
				ifTrue: [ "determine search"
					"determine drag and drop"
					"else determine class"
					widgets
						add:
							(EWidget new
								name: 'input';
								object: 'String') ]
				ifFalse: [ widgets
						add:
							(EWidget new
								name: 'class';
								object: (self class environment at: (e argumentNamed: #in))) ] ].
	^ widgets
]
