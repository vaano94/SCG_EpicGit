"
I represent scenarios for user stories.
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
	^ exampleMethod gtSourceFor: aView.
]
