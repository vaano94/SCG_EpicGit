"
I represent a phone number. I have a country code and a number and a type -- home, mobile, work.
"
Class {
	#name : #ABPhoneNumber,
	#superclass : #Object,
	#instVars : [
		'type',
		'countryCode',
		'number'
	],
	#category : #AddressBook
}

{ #category : #accessing }
ABPhoneNumber >> countryCode [
	^ countryCode
]

{ #category : #accessing }
ABPhoneNumber >> countryCode: aNumber [
	countryCode := aNumber
]

{ #category : #accessing }
ABPhoneNumber >> number [
	^ number 
]

{ #category : #accessing }
ABPhoneNumber >> number: aNumber [
	number := aNumber
]

{ #category : #accessing }
ABPhoneNumber >> phoneNumber [
	^ '+', countryCode asString, ' ', number asString
]

{ #category : #accessing }
ABPhoneNumber >> type [
	^ type
]

{ #category : #accessing }
ABPhoneNumber >> type: aType [
	type := aType
]
