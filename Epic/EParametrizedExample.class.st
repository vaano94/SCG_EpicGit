Class {
	#name : #EParametrizedExample,
	#superclass : #Object,
	#instVars : [
		'exampleMethod'
	],
	#category : #'Epic-Model'
}

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
	parametrizedExample arguments: convertedParams asArray.
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
						withParams: selectorElement selectedParameterValues) ]
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
		select: [ :p | 
			p selector == #given:ofType:in:
				| (p selector == #given:ofType:in:elementType:) ].
	searchParams
		do: [ :e | 
			| val elementType |
			"determine input"
			elementType := e argumentNamed: #elementType.
			val := e argumentNamed: #in.
			val = 'input'
				ifTrue: [ "determine search"
					"determine drag and drop"
					"else determine class"
					widgets
						add:
							(EWidget new
								name: 'input';
								object: 'String';
								parameterName: (e argumentNamed: #given)) ]
				ifFalse: [ elementType = 'dropdown'
						ifTrue: [ widgets
								add:
									(EWidget new
										name: 'classDropdown';
										object: (self class environment at: (e argumentNamed: #in));
										parameterName: (e argumentNamed: #given)) ]
						ifFalse: [ widgets
								add:
									(EWidget new
										name: 'class';
										object: (self class environment at: (e argumentNamed: #in));
										parameterName: (e argumentNamed: #given)) ] ] ].
	^ widgets
]
