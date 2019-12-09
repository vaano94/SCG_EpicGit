"
!Actor

An actor is a representation of the person/system who is completed the action in a ${class:name=UseCase}$ or ${class:name=UserStory}$.
"
Class {
	#name : #EActor,
	#superclass : #Object,
	#instVars : [
		'name',
		'specifications'
	],
	#category : #Epic
}

{ #category : #initialization }
EActor >> initialize [
	super initialize.
	name := 'user'.
	specifications := 'No specifications set'.
	
	
]

{ #category : #accessing }
EActor >> name [
	^ name
]

{ #category : #accessing }
EActor >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EActor >> specifications [
	^ specifications
]

{ #category : #accessing }
EActor >> specifications: anObject [
	specifications := anObject
]
