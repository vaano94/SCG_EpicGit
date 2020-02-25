"
I only return string instances of addresses types.
Available are company, home, mobile, other, pager, work
call me as 'ABAddressType home'
"
Class {
	#name : #ABPhoneType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#classInstVars : [
		'knownType'
	],
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABPhoneType class >> company [
	^ self basicNew initialize;
	type: 'Company'
]

{ #category : #instances }
ABPhoneType class >> home [
	^ self basicNew initialize;
	type: 'Home'
]

{ #category : #accessing }
ABPhoneType class >> knownType [
	^ knownType
]

{ #category : #accessing }
ABPhoneType class >> knownType: anObject [
	knownType := anObject
]

{ #category : #instances }
ABPhoneType class >> mobile [
	^ self basicNew initialize;
	type: 'Mobile'
]

{ #category : #'instance creation' }
ABPhoneType class >> new [
	self error: 'Phone type is a singleton'
]

{ #category : #instances }
ABPhoneType class >> other [
	^ self basicNew initialize;
	type: 'Other'
]

{ #category : #instances }
ABPhoneType class >> pager [
	^ self basicNew initialize;
	type: 'Pager'
]

{ #category : #instances }
ABPhoneType class >> work [
	^ self basicNew initialize;
	type: 'Work'
]

{ #category : #accessing }
ABPhoneType >> type [
	^ type
]

{ #category : #accessing }
ABPhoneType >> type: anObject [
	type := anObject
]
