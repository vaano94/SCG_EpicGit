Class {
	#name : #ABAddressExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #examples }
ABAddressExamples >> addressWithDetails [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'TestStreet';
		streetNumber: 000;
		city: 'TestCity';
		country: 'TestCountry';
		postalCode: 0000;
		type: ABAddressType home.
	
	self assert: address city equals: 'TestCity'.
	self assert: address type equals: ABAddressType home.
	self assert: address typeName equals: ABAddressType home type.
		
	^ address
]

{ #category : #examples }
ABAddressExamples >> addressWithoutType [
	<gtExample>
	| address |
	address := self emptyAddress.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 13;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001.
	
	self assert: address type equals: nil.
	
	^ address
]

{ #category : #examples }
ABAddressExamples >> emptyAddress [
	<gtExample>
	| address |
	address := ABAddress new.
	self assert: address city equals: nil.
	self assert: address type equals: nil.
	^ address
]
