Class {
	#name : #ABContactExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #tests }
ABContactExamples class >> testFullContact [
	| contact phn phones adr addresses emailInstance |
	contact := ABContact new.
	contact
		firstName: 'John';
		lastName: 'Doe'.
	phn := ABPhoneNumber testPhone.
	phones := OrderedCollection new.
	phones add: phn.
	contact phoneNumber: phones.
	adr := ABAddress testAddress.
	addresses := OrderedCollection new.
	addresses add: adr.
	contact address: addresses.
	emailInstance := ABEmail testEmail.
	contact email add: emailInstance.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> addSameAddressTypes [
	<gtExample>
	<label: 'Contact with one address type'>
	<description: 'Verify that adding same address type raises error'>
	| contact address |
	contact := ABContactExamples testFullContact.
	address := ABAddress testAddress.
	self should: [ contact addAddress: address ] raise: Error.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> addSameMailTypes [
	<gtExample>
	<label: 'Contact with one email type'>
	<description: 'Verify that adding same email type raises error'>
	| contact email secondEmail |
	contact := ABContactExamples testFullContact.
	email := ABEmail testEmail.
	contact addEmail: email.
	secondEmail := ABEmail new.
	secondEmail type: ABEmailType home.
	self should: [ contact addEmail: secondEmail ] raise: Error.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> addSamePhoneTypes [
	<gtExample>
	<label: 'Contact with one phone type'>
	<description: 'Verify that adding same phone type raises error'>
	<return:#ABContact>
	| contact anotherPhone |
	contact := ABContactExamples testFullContact.
	anotherPhone := ABPhoneNumber testPhone.
	self should: [ contact addPhoneNumber: anotherPhone ] raise: Error.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editAddress [
	<gtExample>
	<label: 'John Doe with edited address'>
	<description: 'Verify sussessful editing of contact address details'>
	| contact address |
	contact := ABContactExamples testFullContact.
	address := contact address at: 1.
	address streetNumber: 13.
	self assert: address streetNumber equals: 13.

	"Change street name"
	address streetName: 'Schuzenmattstrasse'.
	self assert: address streetName equals: 'Schuzenmattstrasse'.

	"Change city"
	address city: 'Zurich'.
	self assert: address city equals: 'Zurich'.

	"Change country"
	address country: 'Germany'.
	self assert: address country equals: 'Germany'.

	"Change postal code"
	address postalCode: 3011.
	self assert: address postalCode equals: 3011.

	"Change address"
	address type: ABAddressType home.
	self assert: address type equals: ABAddressType home type.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editCompany [
	<gtExample>
	<label: 'John Doe with company changed'>
	<description: 'Verify that changing company is successful'>
	| contact |
	contact := ABContactExamples testFullContact.
	contact company: 'Bern Company'.
	self assert: contact company equals: 'Bern Company'.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editEmail [
	<gtExample>
	<label: 'John Doe with email changed'>
	<description: 'Verify that changing the email of a contact works'>
	| contact email anotherEmail |
	contact := ABContactExamples testFullContact.
	email := contact email at: 1.

	"Change email username"
	email username: 'jdoe2'.
	self assert: email username equals: 'jdoe2'.
	self assert: email extension equals: 'com'.
	self assert: email host equals: 'gmail'.
	self assert: email type equals: 'Home'.

	"Change email collection size"
	anotherEmail := ABEmail new.
	anotherEmail type: ABEmailType work.
	contact addEmail: anotherEmail.
	self assert: contact email size equals: 2.

	"Change email to have different host"
	email host: 'aol'.
	email extension: 'com'.
	self assert: email username equals: 'jdoe2'.
	self assert: email host equals: 'aol'.
	self assert: email extension equals: 'com'.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editNote [
	<gtExample>
	<label: 'John Doe changed notes'>
	<description: 'Verify that changing the notes of a contact works'>
	| contact |
	contact := ABContactExamples testFullContact.
	contact notes: 'mentor at Bern City'.
	self assert: contact notes equals: 'mentor at Bern City'.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editPhone [
	<gtExample>
	<label: 'John Doe with phone changed'>
	<description: 'Verify that changing the phone of a contact works'>
	| contact phone anotherPhone |
	contact := ABContactExamples testFullContact.
	phone := contact phoneNumber at: 1.
	phone number: 5552345678.
	self assert: phone number equals: 5552345678.
	self assert: phone countryCode equals: 41.
	self assert: phone type equals: 'Work'.
	anotherPhone := ABPhoneNumber testPhone.
	anotherPhone type: ABPhoneType home.
	contact addPhoneNumber: anotherPhone.
	self assert: contact phoneNumber size equals: 2.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> janeDoeInstance [
	<gtExample>
	<label: 'Empty John Doe'>
	<description: 'Contact only with first and last names'>
	<return: #ABContact>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> janeDoeInstanceNotExample [
	<label: 'Empty John Doe'>
	<description: 'Contact only with first and last names'>
	<return: #ABContact>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> mergeTwoContacts [
	<gtExample>
	<label: 'Merged contact'>
	<description: 'Verify that merging two contacts one into other works'>
	| a b phn phones adr addresses |
	a := ABContact new.
	a
		firstName: 'a';
		lastName: 'a'.
	(Delay forMilliseconds: 1000) wait.
	b := ABContact new.
	b
		firstName: 'b';
		lastName: 'b'.
	phn := ABPhoneNumber testPhone.
	phones := OrderedCollection new.
	phones add: phn.
	b phoneNumber: phones.
	adr := ABAddress testAddress.
	addresses := OrderedCollection new.
	addresses add: adr.
	b address: addresses.
	^ a mergeWith: b
]
