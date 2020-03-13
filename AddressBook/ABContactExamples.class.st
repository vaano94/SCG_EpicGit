Class {
	#name : #ABContactExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'examples - contacts' }
ABContactExamples class >> janeDoeClass [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContactExamples class >> janeSmith [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Smith'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContactExamples class >> johnDoe [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContactExamples class >> johnSmith [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Smith'.
	^ contact
]

{ #category : #tests }
ABContactExamples class >> test [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Test'.
	contact lastName: 'Test'.
	^ contact
]

{ #category : #tests }
ABContactExamples class >> testFullContact [
	| contact phn phones adr addresses emailInstance |
	contact := ABContact new.
	contact
		firstName: 'test';
		lastName: 'test'.
	phn := ABPhoneNumber testPhone.
	phones := OrderedCollection new.
	phones add: phn.
	contact phoneNumber: phones.
	adr := ABAddress testAddress.
	addresses := OrderedCollection new.
	addresses add: adr.
	contact address: addresses.
	
	emailInstance :=	ABEmail testEmail.
	contact email add: emailInstance.
	
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> addSameAddressTypes [
	<gtExample>
	| contact address |
	contact:= ABContact testFullContact.
	
	address := ABAddress testAddress.
	self should: [	contact addAddress: address ] raise: Error.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> addSameMailTypes [
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

{ #category : #'as yet unclassified' }
ABContactExamples >> addSamePhoneTypes [
	<gtExample>
	|contact anotherPhone|
	contact := ABContact testFullContact.
	
   anotherPhone:=	ABPhoneNumber testPhone.
	self should: [ contact addPhoneNumber: anotherPhone] raise: Error.
	^ contact
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editAddress [
	<gtExample>
	| contact address |
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
ABContactExamples >> editCompany [
	<gtExample>
	| contact |
	contact := ABContact testFullContact.
	contact company: 'Bern City'.
	self assert: contact company equals: 'Bern City'.
	
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editEmail [
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
ABContactExamples >> editNote [
	<gtExample>
	| contact |
	contact := ABContact testFullContact.
	
	contact notes: 'mentor at Bern City'.
	self assert: contact notes equals: 'mentor at Bern City'.
	
	^contact.
]

{ #category : #'examples - EditAddressBook' }
ABContactExamples >> editPhone [
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
ABContactExamples >> exampleTwoLists [
|ex examplesArray el lists aList |
ex:= EParametrizedExample new.
examplesArray:= ex getGtExamplesAsParametersFor: (ABAddressBookExamples >> #exampleAddContact:toAddressBook:).


el:= BlElement new 
	layout: BlFlowLayout horizontal;
	margin: (BlInsets all: 5);
	constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent  ];
	background: Color white.

lists:= OrderedCollection new.
(1 to: 2) do: [ :in |
	aList := BrSimpleList new.
	aList
		stencil: [ :each :index |
			BlTextElement new
				text: each asRopedText;
				constraintsDo: [ :c | 
					c horizontal exact: 100.
					c vertical exact: 15 ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					anEvent consumed: true.
					aList selectOne: index ] ];
		constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];	
		margin: (BlInsets left: 20; right: 20);
		display: (examplesArray at: in).
		lists add: aList.
	 ].
el addChild: (lists at: 2).
el addChild: (lists at: 1).
el
]

{ #category : #'as yet unclassified' }
ABContactExamples >> janeDoeInstance [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'as yet unclassified' }
ABContactExamples >> mergeTwoContacts [
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
