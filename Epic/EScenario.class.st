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
		'exampleMethods'
	],
	#category : #'Epic-Model'
}

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

{ #category : #'as yet unclassified' }
EScenario >> exampleWithLabel [
	<gtExample>
^ '[[[label=Evaluate
aBook := GtDocument new.
]]]'
]

{ #category : #ui }
EScenario >> gtDescriptionFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text:
			"'A ${class:name=EScenario}$ represents all methods that cover use story functionality ' ,"
			self exampleWithLabel .
			"'[[[	label=Evaluate
					aBook := GtDocument new.
			]]]'".
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 13 
]

{ #category : #'as yet unclassified' }
EScenario >> gtListOfMethodsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Methods';
		priority: 2;
		items: [ self exampleMethods asOrderedCollection];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 40;
		column: 'Method' item: [ :anElement | '${method:anElement|expanded}$' ] width: 400
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
]
