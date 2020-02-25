Class {
	#name : #ScenarioExamples,
	#superclass : #Object,
	#category : #'Epic-AddressBook'
}

{ #category : #'examples - AddAddressBook' }
ScenarioExamples >> addressBookAddAddressSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := ABAddressBook emptyAddressBook.
	contact := ABContact janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: ABAddress testAddress.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]
