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
EScenario >> gtListOfExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Examples';
		priority: 2;
		items: [ self exampleMethods asOrderedCollection];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 30;
		column: 'Method' item: [ :anElement | anElement label ]
]

{ #category : #'as yet unclassified' }
EScenario >> gtListOfParametrizedExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Parametrized examples';
		priority: 3;
		items: [ self parametrizedExamples ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 30;
		column: 'Method'
			item: [ :anElement | anElement exampleMethod gtParametrizedExample label ]
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
