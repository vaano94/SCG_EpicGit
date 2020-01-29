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
	#category : #AddressBook
}

{ #category : #'tests - instance' }
ABAddress class >> testAddress [
	| address |
	address := ABAddress new.
	address
		streetName: 'TestStreet';
		streetNumber: 000;
		city: 'TestCity';
		country: 'TestCountry';
		postalCode: 0000;
		type: ABAddressType home.
	^ address
]

{ #category : #'instance creation examples' }
ABAddress >> addressBadAddress [
	<gtExample>
	| address |
	address := self new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 13;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001;
		type: 'Home'.
	self assert:address city equals: 'Bern'.
	^address.
]

{ #category : #'instance creation examples' }
ABAddress >> addressBadType [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 14;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001;
		type: 'Work'.
	self assert:address city equals: 'Bern'.
	^address.
]

{ #category : #'instance creation examples' }
ABAddress >> addressNew [
	<gtExample>
	| address |
	address := self class testAddress.
	self assert:address city equals: 'TestCity'.
	^address.
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
	type := aType
]
