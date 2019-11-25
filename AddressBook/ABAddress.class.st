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

{ #category : #'as yet unclassified' }
ABAddress >> fullAddress [
	^ streetName, ' ', streetNumber asString, ' ', postalCode asString, ' ', city, ' ', country
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
ABAddress >> type [
	^ type
]

{ #category : #accessing }
ABAddress >> type: aType [
	type := aType
]
