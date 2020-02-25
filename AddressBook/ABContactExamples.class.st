Class {
	#name : #ABContactExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
ABContactExamples >> contactAddSameMailTypes [
	<gtExample>
	| contact email secondEmail |
	contact:= ABContact testFullContact.
	email:= ABEmail testEmail.
	contact addEmail: email.
	secondEmail := ABEmail new.
	secondEmail type: ABEmailType home.
	self should: [	contact addEmail: secondEmail ] raise: Error.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> contactBookEditCompany [
	<gtExample>
	| contact |
	contact := ABContact testFullContact.
	contact company: 'Bern City'.
	self assert: contact company equals: 'Bern City'.
	
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> contactBookEditContactAddress [
	<gtExample>
	| addressBook contact address |
"	addressBook := ABAddressBook addressBookWithFullTestContact."
	contact := ABContact testFullContact.
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
	
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> contactEditEmail [
	<gtExample>
	| contact email anotherEmail |
	contact := ABContact testFullContact.
	email := contact email at: 1.
	
	"Change email username"
	email username: 'jdoe2'.
	
	self assert: email username equals: 'jdoe2'.
	self assert: email extension equals: 'com'.
	self assert: email host equals: 'gmail'.
	self assert: email type equals: 'Home'.
	
	"Change email collection size"
	anotherEmail:= ABEmail new.
	anotherEmail type: ABEmailType work.
	contact addEmail: anotherEmail.
	self assert: contact email size equals: 2.
	
	"Change email to have different host"
	email host: 'aol'.
	email extension: 'com'.
	self assert: email username equals: 'jdoe2'.
	self assert: email host equals: 'aol'.
	self assert: email extension equals: 'com'.	
			
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> contactEditNote [
	<gtExample>
	| contact |
	contact := ABContact testFullContact.
	
	contact notes: 'mentor at Bern City'.
	self assert: contact notes equals: 'mentor at Bern City'.
	
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> contactEditPhone [
	<gtExample>
	| contact phone anotherPhone|
	contact := ABContact testFullContact.
	phone := contact phoneNumber at: 1.
	
	phone number: 5552345678.
	
	self assert: phone number equals: 5552345678.
	self assert: phone countryCode equals: 41.
	self assert: phone type equals: 'Work'.
	
   anotherPhone:=	ABPhoneNumber testPhone.
	anotherPhone type: ABPhoneType home.
	contact addPhoneNumber: anotherPhone.
	self assert: contact phoneNumber size equals: 2.
			
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> contactMergeTwoContacts [
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

{ #category : #'as yet unclassified' }
ABContactExamples >> exampleSamePhoneTypes [
	<gtExample>
	|contact phone anotherPhone|
	contact := ABContact testFullContact.
	
   anotherPhone:=	ABPhoneNumber testPhone.
	self should: [contact addPhoneNumber: anotherPhone] raise: Error.
	^ contact
]
