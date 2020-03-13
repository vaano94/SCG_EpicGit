"
I only return string instances of addresses types.
Available are home, other, work
call me as 'ABAddressType home'
"
Class {
	#name : #ABAddressType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABAddressType class >> home [
	^ self basicNew 
		initialize;
		type: 'Home'
]

{ #category : #'instance creation' }
ABAddressType class >> new [
	self error: 'Address type is a singleton'
]

{ #category : #instances }
ABAddressType class >> other [
	^ self basicNew 
		initialize;
		type: 'Other'
]

{ #category : #instances }
ABAddressType class >> work [
	^ self basicNew initialize;
	type: 'Work'
]

{ #category : #comparing }
ABAddressType >> = anObject [
	^ self type = anObject type.
]

{ #category : #comparing }
ABAddressType >> equals: anObject [
	^ self type = (anObject type).
]

{ #category : #accessing }
ABAddressType >> type [
	^ type
]

{ #category : #accessing }
ABAddressType >> type: anObject [
	type := anObject
]
