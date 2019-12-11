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
		'exampleMethod'
	],
	#category : #Epic
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

{ #category : #'as yet unclassified' }
EScenario >> gtViewSource: aView [
	<gtView> 
	self exampleMethod ifNil: [ ^ aView empty ].
	^ self exampleMethod gtSourceFor: aView.
]
