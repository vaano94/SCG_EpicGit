"
I provide types for Email addresses.
"
Class {
	#name : #ABEmailType,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'type'
	],
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABEmailType class >> home [
	^ type ifNil: [
		type := self basicNew 
			initialize;
			name: 'Home' ]
]

{ #category : #'instance creation' }
ABEmailType class >> new [
	self error: 'Email type is a singleton'
]

{ #category : #instances }
ABEmailType class >> other [
	^ self basicNew 
		initialize;
		name: 'Other'
]

{ #category : #instances }
ABEmailType class >> work [
	^ self basicNew 
		initialize;
		name: 'Work'
]

{ #category : #comparing }
ABEmailType >> = anotherObject [	
	^ self class = anotherObject class and: [
		self name = anotherObject name ]
]

{ #category : #accessing }
ABEmailType >> name [
	^ name
]

{ #category : #accessing }
ABEmailType >> name: aString [
	name := aString
]

{ #category : #'as yet unclassified' }
ABEmailType >> printOn: aStream [
	aStream 
		nextPutAll: 'Email type (';
		nextPutAll: self name;
		nextPutAll: ')'
]
