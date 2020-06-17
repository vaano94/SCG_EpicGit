Class {
	#name : #EParametrizedExample,
	#superclass : #Object,
	#instVars : [
		'exampleMethod',
		'propertyTests',
		'selectorElement',
		'boundScenario',
		'documentView',
		'description',
		'editView'
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
EParametrizedExample >> editView [
	^ editView
]

{ #category : #accessing }
EParametrizedExample >> editView: anObject [
	editView := anObject
]

{ #category : #accessing }
EParametrizedExample >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
EParametrizedExample >> exampleMethod: anObject [
	exampleMethod := anObject
]

{ #category : #accessing }
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
	methodDescription := methodDescription ,  '<return: #', ((self exampleMethod pragmaAt: #return:) argumentAt: 1)  ,'>', String cr.
	
	methodDescription := methodDescription , '| result '.
	1 to: (parameterValues size) do: [:ind | methodDescription:= methodDescription , ' ', ((parameterNames at: ind) copyReplaceAll: ' ' with: '') , ' ' ].
	methodDescription := methodDescription , '|', String cr.
			
	parameterValues doWithIndex: [ :item :index | 
			[ item gtExample ifNotNil: [ "self inform: 'have a gtExample here'."
			methodDescription:= methodDescription , ((parameterNames at: index) copyReplaceAll: ' ' with: ''), ' := '.
			
			
			exampleMethod gtParametrizedExample classLabel = item classLabel 
				ifTrue: [ methodDescription:= methodDescription, ' ', (self selectorElement drawnElements at: index) generateStringSelf. ]
				ifFalse: [ methodDescription:= methodDescription, ' ', (self selectorElement drawnElements at: index) generateString. ].
			
			methodDescription:= methodDescription , '.'.
			methodDescription:= methodDescription , String cr.] 
			] on: Error do: [ 
			|inputElementString|
			"self inform: 'not a gtExample'."
			methodDescription:= methodDescription , ((parameterNames at: index) copyReplaceAll: ' ' with: ''), ' := '.
			"call a trait method inside a widget to generate string representation"
			inputElementString:= (self selectorElement drawnElements at: index) generateString.
			methodDescription:= methodDescription , inputElementString,  '.'.
			methodDescription:= methodDescription , String cr.
			 ]
		
			
		
		 ].
	
	methodDescription:= methodDescription , String cr.
	
	parameterSetSentence:= 'result := ', 'self '.
	(exampleMethod selector substrings: ':') doWithIndex: [ :paramName :index | 
		parameterSetSentence := parameterSetSentence , paramName, ':', ((parameterNames at: index) copyReplaceAll: ' ' with: ''), ' ' ].
	parameterSetSentence:= parameterSetSentence , '.'.
	
	methodDescription:= methodDescription , parameterSetSentence, String cr.
	methodDescription:= methodDescription , '^ result'.
	
	^ methodDescription
]

{ #category : #accessing }
EParametrizedExample >> gtViewEditFor: aView [
	<gtView>
	^ aView explicit
		title: 'Edit';
		priority: 5;
		stencil: [ 
			| container |
	
			editView:= EParametrizedExampleEditView new.
			self editView: editView.
			container := editView initializeForParametrizedExample: self.
			container asScrollableElement.
			 ].
]

{ #category : #accessing }
EParametrizedExample >> gtViewParameters2For: aView [
	<gtView>
	| selElement |
	selElement := EScenarioParametersSelectionElement new
		initializeForParametrizedExample: self.
	selElement addChild: self addGenerateButton.
	self selectorElement: selElement.
	^ aView explicit
		title: 'Pick Examples';
		priority: 1;
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
				ifFalse: [
						| hasNoExamples return |
						hasNoExamples:= true.
						anExample isCollection ifTrue: [ anExample do: 
							[ :element | (element isMemberOf: GtExample)
									ifTrue: [ hasNoExamples:= false. ]
		 					].
						hasNoExamples ifTrue:[ return:= anExample] 
										  ifFalse: [ return := anExample collect: [ :ex| ex run returnValue ]].
	 						].
						return
						].
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
			| val elementType widget ofType |
			widget := EWidget new parameterName: (e argumentNamed: #given).
			"determine input"
			[ elementType := e argumentNamed: #elementType ]
				on: Error
				do: [ elementType := '' ].
			val := e argumentNamed: #in.
			ofType:= e argumentNamed: #ofType.
			(val = 'self') ifTrue: [
				val := self exampleMethod methodClass name ].
			elementType = 'input'
				ifTrue: [ 
					ofType = 'String' ifTrue: [ 
						widgets
						add: (widget
								name: 'StringInput';
								object: 'String') 
						 ].
					ofType = 'File' ifTrue: [ 
						widgets
						add: (widget
								name: 'FileInput';
								object: 'File') 
						 ].
					].
			elementType = 'search'
				ifTrue: [ widgets
						add:
							(widget
								name: 'search';
								returnClass: ofType;
								object: (self class environment at: val)) ].
			elementType = 'multipleSearch'
				ifTrue: [ widgets
						add:
							(widget
								name: 'multipleSearch';
								returnClass: ofType;
								object: (self class environment at: val)) ].
			elementType = 'dropdown'
				ifTrue: [ widgets
						add:
							(widget
								name: 'dropdown';
								returnClass: ofType;
								object: (self class environment at: val)) ].
			elementType = 'list'
				ifTrue: [ widgets
						add:
							(widget
								name: 'list';
								returnClass: ofType;
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
