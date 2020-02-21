Class {
	#name : #ABContactExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
ABContactExamples >> exampleMergeTwoContacts [
	<gtExample>
	| a b phn phones adr addresses|
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
	
	^ (a mergeWith: b)
]
