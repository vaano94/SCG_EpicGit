"
I represent examples associated with an address book.
"
Class {
	#name : #AddressBookExamples,
	#superclass : #Object,
	#category : #AddressBook
}

{ #category : #'as yet unclassified' }
AddressBookExamples >> addressBookWithTwoContacts [
	<gtExample>
	| addressBook |
	addressBook := self emptyAddressBook.
	addressBook
		addContact: self janeDoe;
		addContact: self johnDoe.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 2.
	^addressBook.
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> emptyAddressBook [
	<gtExample>
	| addressBook |
	addressBook := AddressBook new.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^addressBook.
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> janeDoe [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact
		name: 'Jane Doe';
		phoneNumber: 0123456789;
		address: self scgAddress.
		
	^contact.
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> johnDoe [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact
		name: 'John Doe';
		phoneNumber: 1234567890;
		address: self scgAddress.
		
	^contact.
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> scgAddress [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 14;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001.
	self assert:address city equals: 'Bern'.
	^address.
]
