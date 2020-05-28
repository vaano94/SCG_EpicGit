Class {
	#name : #EWidget,
	#superclass : #Object,
	#instVars : [
		'name',
		'object',
		'returnClass',
		'parameterName'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EWidget >> name [
	^ name
]

{ #category : #accessing }
EWidget >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EWidget >> object [
	^ object
]

{ #category : #accessing }
EWidget >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EWidget >> parameterName [
	^ parameterName
]

{ #category : #accessing }
EWidget >> parameterName: anObject [
	parameterName := anObject
]

{ #category : #accessing }
EWidget >> returnClass [
	^ returnClass
]

{ #category : #accessing }
EWidget >> returnClass: anObject [
	returnClass := anObject
]
