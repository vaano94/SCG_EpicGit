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
		background: (Color r: 63 g: 81 b: 181 range: 255);
		geometry: (BlRectangle cornerRadius: 2);
		relocate: 100@100;
		padding: (BlInsets top: 8 right: 16 bottom: 8 left: 16);
		layout: BlLinearLayout horizontal;
		effect: (BlGaussianShadowEffect color: (Color black alpha: 0.3) width: 1 offset: 0@2);
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
EParametrizedExample >> getGtExamplesAsParametersFor: aParamTest [
	"I return an Array of <gtExample> methods for given parametrized method,
	provided, that compiled method has pragma <given:ofType:in>"
	|pragmas searchParams foundClasses examplesDividedByClasses|
	pragmas := (aParamTest) pragmas.
	searchParams:= pragmas select: [ :p | p selector == #given:ofType:in: ].

	foundClasses:= OrderedCollection new.
	searchParams do: [ :e | 
		foundClasses add: (self class environment at: (e argumentNamed: #in)).
	 ].

	examplesDividedByClasses:= OrderedCollection new.

	foundClasses do: [ :c |
	|methods classesExamples|
	methods:= c allMethods.
	classesExamples:= OrderedCollection new.
	methods do: 
		[ :m | 
		|methodExamples|
		methodExamples := OrderedCollection new.
		m pragmas do: [ :p | p selector == #gtExample ifTrue: [ classesExamples add: m ]
			].
		].
	
	examplesDividedByClasses add: classesExamples.
	].
	
^ examplesDividedByClasses

]

{ #category : #'as yet unclassified' }
EParametrizedExample >> gtListOfExamplesFor: aView [
	<gtView>
	^ aView textEditor
	title: 'Met';
	priority: 0;
	text: [ 'ExampleMethod: ', exampleMethod name ]
]

{ #category : #'as yet unclassified' }
EParametrizedExample >> gtViewParametersFor: scenario [
	<gtView>
	| ex examplesArray methodDictionaries el lists aList |
	ex := EParametrizedExample new.
	examplesArray := ex
		getGtExamplesAsParametersFor: ABAddressBookExamples >> #exampleAddContact:toAddressBook:.
	methodDictionaries := OrderedCollection new.
	examplesArray
		do: [ :e | 
			| dict |
			dict := ex createMapFromCompiledMethodList: e.
			methodDictionaries add: dict ].
	methodDictionaries.
	el := BlElement new
		layout: BlFlowLayout horizontal;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		background: Color white.
	lists := OrderedCollection new.
	(1 to: 2)
		do: [ :in | 
			aList := BrSimpleList new.
			aList
				stencil: [ :each :index | 
					BlTextElement new
						text: each asRopedText;
						constraintsDo: [ :c | 
							c horizontal exact: 100.
							c vertical exact: 15 ];
						padding: (BlInsets all: 5);
						when: BlClickEvent
							do: [ :anEvent | 
							anEvent consumed: true.
							aList selectOne: index ] ];
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				margin:
					(BlInsets
						left: 20;
						right: 20);
				display: (methodDictionaries at: in) keys.
			lists add: aList ].
	el addChild: (lists at: 1).
	el addChild: (lists at: 2).
	el addChild: ex coloredButton.
	el
]
