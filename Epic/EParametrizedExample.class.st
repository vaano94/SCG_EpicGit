Class {
	#name : #EParametrizedExample,
	#superclass : #Object,
	#instVars : [
		'exampleMethod',
		'propertyTests',
		'selectorElement',
		'boundScenario',
		'documentView',
		'description'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
EParametrizedExample >> addGenerateButton [
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Generate';
		action: [ :button |
			| coder saveAction block|
			coder := GtMethodCoder 
				forClass: exampleMethod methodClass 
				source: self generateMethodString.
			coder expanded: true.
			block:= [
				|s|
				coder save.
				self inform: 'SAVED'.
				coder compile. 
				"s:= (exampleMethod methodClass name), '>>#' , coder selector."
				self propertyTests add: coder compiledMethod.
				].
			saveAction:= (coder addOns mainActions detect: [:act | act asString = 'a GtCoderAction(Save)']).
			saveAction action: block.

			button phlow spawnObject: coder ];
		margin: (BlInsets top: 10 left: 10 bottom: 10 right: 0);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
		]
		
]

{ #category : #accessing }
EParametrizedExample >> boundScenario [
	^ boundScenario
]

{ #category : #accessing }
EParametrizedExample >> boundScenario: anExample [
	boundScenario := anExample.
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
EParametrizedExample >> description [
	^ description
]

{ #category : #accessing }
EParametrizedExample >> description: anObject [
	description := anObject
]

{ #category : #accessing }
EParametrizedExample >> documentView [
	^ documentView
]

{ #category : #accessing }
EParametrizedExample >> documentView: anObject [
	documentView := anObject
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
EParametrizedExample >> generateMethod [
	|methodDescription|
	methodDescription:= self generateMethodString.
	exampleMethod methodClass compile: methodDescription.
	^ methodDescription
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> generateMethodString [
	|parameterNames parameterValues methodDescription parameterSetSentence generatedMethodName|
	methodDescription:= ''.
	parameterValues:= selectorElement selectedParameterValues.
	
	parameterNames:= (exampleMethod pragmas
		select: [ :p | 
			p selector == #given:ofType:in:
				| (p selector == #given:ofType:in:elementType:) ])
		collect: [ :e | e argumentNamed: #given ].
	
	"generating method name from parameters labels (string values) and parametrized method name"
	generatedMethodName:= ''.
	(exampleMethod selector substrings: ':') doWithIndex: [ :paramName :index | 
		generatedMethodName:= generatedMethodName, paramName.
		[((parameterValues at: index) gtExample) ifNotNil: [ 
			generatedMethodName:= generatedMethodName , (parameterValues at: index) label
			].  
		] on: Error do: [ 
			generatedMethodName:= generatedMethodName , '_CHANGE_ME_' 
			].	
		].
	generatedMethodName:= generatedMethodName copyReplaceAll: ' ' with: ''.
	
	methodDescription:= methodDescription , generatedMethodName, String cr.
	methodDescription := methodDescription , '<gtExample>', String cr.
	methodDescription := methodDescription ,  '<label: ''Generated example for ', generatedMethodName ,'''>', String cr.
	
	methodDescription := methodDescription , '| result '.
	1 to: (parameterValues size) do: [:ind | methodDescription:= methodDescription , ' ', (parameterNames at: ind) , ' ' ].
	methodDescription := methodDescription , '|', String cr.
			
	parameterValues doWithIndex: [ :item :index | 
			[ item gtExample ifNotNil: [ self inform: 'have a gtExample here'.
			methodDescription:= methodDescription , (parameterNames at: index), ' := '.
			
			exampleMethod gtParametrizedExample classLabel = item classLabel 
				ifTrue: [ methodDescription:= methodDescription , 'self' ]
				ifFalse: [ methodDescription:= methodDescription , item classLabel ].
			methodDescription:= methodDescription , ' new '.
			methodDescription:= methodDescription , item method selector.
			methodDescription:= methodDescription , '.'.
			methodDescription:= methodDescription , String cr.] 
			] on: Error do: [ 
			
			self inform: 'not a gtExample'.
			methodDescription:= methodDescription , (parameterNames at: index), ' := '.
			methodDescription:= methodDescription , ((parameterValues at: index) printString).
			methodDescription:= methodDescription , ' as: '.
			methodDescription:= methodDescription , ((parameterValues at: index) class asString).
			methodDescription:= methodDescription , '.'.
			methodDescription:= methodDescription , String cr.
			 ]
		
			
		
		 ].
	
	methodDescription:= methodDescription , String cr.
	
	parameterSetSentence:= 'result := ', 'self new '.
	(exampleMethod selector substrings: ':') doWithIndex: [ :paramName :index | 
		parameterSetSentence := parameterSetSentence , paramName, ':', (parameterNames at: index), ' ' ].
	parameterSetSentence:= parameterSetSentence , '.'.
	
	methodDescription:= methodDescription , parameterSetSentence, String cr.
	methodDescription:= methodDescription , '^ result'.
	
	^ methodDescription
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
EParametrizedExample >> gtViewDocumentFor: aView [
	<gtView>
	| container docView |
	
	docView:= EParametrizedExampleDocumentView new.
	self documentView: docView.
	container := docView initializeForParametrizedExample: self.
	
	^ aView explicit
		title: 'Description';
		stencil: [ container ].
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> gtViewParameters2For: aView [
	<gtView>
	| selElement |
	selElement := EScenarioParametersSelectionElement new
		initializeForParametrizedExample: self.
	selElement addChild: self addGenerateButton.
	self selectorElement: selElement.
	^ aView explicit
		title: 'Pick Examples';
		stencil: [ selElement ];
		actionButtonIcon: BrGlamorousIcons play
			label: 'Run'
			action: [ :aButton | 
			aButton phlow
				spawnObject:
					(self
						executeExample: self exampleMethod
						withParams: selElement selectedParameterValues) ]
]

{ #category : #initialization }
EParametrizedExample >> initialize [
	propertyTests:= OrderedCollection new.
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

{ #category : #accessing }
EParametrizedExample >> propertyTests [
	^ propertyTests
]

{ #category : #accessing }
EParametrizedExample >> propertyTests: anObject [
	propertyTests := anObject
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
			| val elementType widget |
			widget := EWidget new parameterName: (e argumentNamed: #given).
			"determine input"
			[ elementType := e argumentNamed: #elementType ]
				on: Error
				do: [ elementType := '' ].
			val := e argumentNamed: #in.
			val = 'input'
				ifTrue: [ "determine search"
					"determine drag and drop"
					"else determine class"
					widgets
						add:
							(widget
								name: 'input';
								object: 'String') ].
			elementType = 'search'
				ifTrue: [ widgets
						add:
							(widget
								name: 'search';
								object: (self class environment at: val)) ].
			elementType = 'multipleSearch'
				ifTrue: [ widgets
						add:
							(widget
								name: 'multipleSearch';
								object: (self class environment at: val)) ].
			elementType = 'dropdown'
				ifTrue: [ widgets
						add:
							(widget
								name: 'dropdown';
								object: (self class environment at: val)) ].
			elementType = 'list'
				ifTrue: [ widgets
						add:
							(widget
								name: 'list';
								object: (self class environment at: val)) ] ].
	^ widgets
]

{ #category : #accessing }
EParametrizedExample >> selectorElement [
	^ selectorElement
]

{ #category : #accessing }
EParametrizedExample >> selectorElement: anObject [
	selectorElement := anObject
]
