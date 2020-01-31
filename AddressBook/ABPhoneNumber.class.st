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
	#category : #'AddressBook-Model'
}

{ #category : #tests }
ABPhoneNumber class >> testPhone [
| phone |
	phone := ABPhoneNumber new.
	phone 
		countryCode: 41;
		number: 12345678;
		type: ABPhoneType home.
	^ phone
]

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

{ #category : #'instance creation examples' }
ABPhoneNumber >> phoneNew [
	<gtExample>
	| phone |
	phone := ABPhoneNumber testPhone.
	self assert: (phone countryCode) equals: 41.
	^phone.
]

{ #category : #accessing }
ABPhoneNumber >> toString [
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
