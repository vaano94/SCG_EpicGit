"
I represent an address for a contact
"
Class {
	#name : #ABAddress,
	#superclass : #Object,
	#instVars : [
		'type',
		'streetName',
		'streetNumber',
		'postalCode',
		'city',
		'country'
	],
	#category : #'AddressBook-Model'
}

{ #category : #'tests - instance' }
ABAddress class >> testAddress [
	| address |
	address := ABAddress new.
	address
		streetName: 'Hochschulstrasse';
		streetNumber: 6;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3012;
		type: ABAddressType work.
	^ address
]

{ #category : #accessing }
ABAddress >> city [
	^ city
]

{ #category : #accessing }
ABAddress >> city: aCity [
	city := aCity
]

{ #category : #accessing }
ABAddress >> country [
	^ country
]

{ #category : #accessing }
ABAddress >> country: aCountry [
	country := aCountry
]

{ #category : #accessing }
ABAddress >> fullAddress [
	^ streetName , ' ' , streetNumber asString , ' '
		, postalCode asString , ' ' , city , ' ' , country
]

{ #category : #accessing }
ABAddress >> postalCode [
	^ postalCode
]

{ #category : #accessing }
ABAddress >> postalCode: aNumber [
	postalCode := aNumber
]

{ #category : #accessing }
ABAddress >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: '(';
		nextPutAll: self toString;
		nextPut: $)
]

{ #category : #accessing }
ABAddress >> streetName [
	^ streetName
]

{ #category : #accessing }
ABAddress >> streetName: aString [
	streetName := aString
]

{ #category : #accessing }
ABAddress >> streetNumber [
	^ streetNumber
]

{ #category : #accessing }
ABAddress >> streetNumber: aNumber [
	streetNumber := aNumber
]

{ #category : #accessing }
ABAddress >> toString [
	^ streetName , ' ' , streetNumber asString , ' '
		, postalCode asString , ' ' , city , ' ' , country
]

{ #category : #accessing }
ABAddress >> type [
	^ type
]

{ #category : #accessing }
ABAddress >> type: aType [
	self 
		assert: [ aType isNotNil ] 
		description: 'Cannot set nil types'.
	self 
		assert: [ aType isMemberOf: ABAddressType ] 
		description: 'Can only assign ABAddresType types'.

	type := aType
]

{ #category : #accessing }
ABAddress >> typeName [
	^ type type
]
