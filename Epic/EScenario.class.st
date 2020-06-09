"
!Scenario
I represent scenarios for ${class:name=EUserStory}$.
I am test cases that cover every possibile outcome of a ${class:name=EUserStory}$.
"
Class {
	#name : #EScenario,
	#superclass : #Object,
	#instVars : [
		'description',
		'exampleMethod',
		'exampleMethods',
		'parametrizedExamples'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
EScenario >> addParametrizedExample: anExample [
	anExample boundScenario: self.
	self parametrizedExamples add: anExample.
]

{ #category : #'as yet unclassified' }
EScenario >> createAddExampleButton [
		^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'New parameterized example';
		action: [ :button |
			| coder saveAction block|
			coder := GtMethodCoder 
				forClass: String 
				source: 'empty'.
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
EScenario >> description [
	^ description
]

{ #category : #accessing }
EScenario >> description: aString [
	description := aString
]

{ #category : #accessing }
EScenario >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
EScenario >> exampleMethod: aMethod [
	exampleMethod := aMethod
]

{ #category : #accessing }
EScenario >> exampleMethods [
	^ exampleMethods
]

{ #category : #accessing }
EScenario >> exampleMethods: list [
	list do: [ :item | self exampleMethods add: item ].
]

{ #category : #accessing }
EScenario >> gtListOfExamplesFor: aView [
	<gtView>
	^ aView forward
		title: 'Examples';
		priority: 1;
		object: [ GtExampleGroup withAll: self exampleMethods asArray ];
		view: #gtExamplesFor:
	
]

{ #category : #'as yet unclassified' }
EScenario >> gtListOfParametrizedExamplesFor: aView [
	<gtView>
	|phlowList listElement viewElement container|
	container:= BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	phlowList := GtPhlowColumnedListView new
		items: [ self parametrizedExamples ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 30;
		column: 'Method'
			item: [ :anElement | anElement exampleMethod gtParametrizedExample label ].
	listElement:= phlowList asElementDo: [:e| 
		e constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		e addChild: self createAddExampleButton].
	
	container addChild: listElement.
	
	viewElement:= aView explicit
		title: 'Parametrized examples';
		priority: 3;
		stencil: [ container ].
	^ viewElement		
]

{ #category : #'as yet unclassified' }
EScenario >> gtViewSource: aView [
	<gtView> 
	self exampleMethod ifNil: [ ^ aView empty ].
	^ self exampleMethod gtCoderSourceFor: aView.
]

{ #category : #initialization }
EScenario >> initialize [
	exampleMethods := Set new.
	parametrizedExamples := OrderedCollection new.
]

{ #category : #accessing }
EScenario >> parametrizedExamples [
	^ parametrizedExamples
]
