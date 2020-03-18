Class {
	#name : #ABAddressExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #examples }
ABAddressExamples >> addressWithDetails [
	<gtExample>
	<label: 'filled Test Address'>
	<description: 'Address with filled Details'>
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
	<label: 'Test Address no type'>
	<description: 'Address type is set to nil'>
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
	<label: 'empty Test Address'>
	<description: 'Empty Address'>
	| address |
	address := ABAddress new.
	self assert: address city equals: nil.
	self assert: address type equals: nil.
	^ address
]
