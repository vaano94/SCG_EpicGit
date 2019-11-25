"
I represent scenarios for a user story -- related to address books.
"
Class {
	#name : #UserStoryScenario,
	#superclass : #Object,
	#instVars : [
		'description',
		'exampleMethod'
	],
	#category : #AddressBook
}

{ #category : #accessing }
UserStoryScenario >> description [
	^ description
]

{ #category : #accessing }
UserStoryScenario >> description: aString [
	description := aString
]

{ #category : #accessing }
UserStoryScenario >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
UserStoryScenario >> exampleMethod: aMethod [
	exampleMethod := aMethod
]

{ #category : #'as yet unclassified' }
UserStoryScenario >> gtViewSource: aView [
	<gtView> 
	^ exampleMethod gtSourceFor: aView.
]
