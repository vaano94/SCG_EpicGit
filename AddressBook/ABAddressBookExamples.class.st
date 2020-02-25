Class {
	#name : #ABAddressBookExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'examples - AddAddressBook' }
ABAddressBookExamples >> addressBookAddContact [
	<gtExample>
	| addressBook b phn phones adr addresses |
	addressBook := ABAddressBook emptyAddressBook.
	b := ABContact new.
	b  firstName: 'b';
		lastName: 'b'.
	phn := ABPhoneNumber testPhone.
	phones := OrderedCollection new.
	phones add: phn.
	b phoneNumber: phones.
	adr := ABAddress testAddress.
	addresses := OrderedCollection new.
	addresses add: adr.
	b address: addresses.
	
	addressBook
		addContact: b.
	
	self assert: b firstName equals: 'b'.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
ABAddressBookExamples >> addressBookAddTwoContactsWithSameName [
	<gtExample>
	| addressBook contactWithSameName email|
	addressBook := ABAddressBook addressBookWithFullTestContact.
	
	contactWithSameName := ABContact testFullContact.
	email := ABEmail new. email host: 'HOST'; username: 'USERNAME'.
	contactWithSameName addEmail: email. 
	self assert: contactWithSameName firstName equals: 'test'.
	
	addressBook addContact: contactWithSameName.
	
	^addressBook.
]

{ #category : #'instance creation examples' }
ABAddressBookExamples >> emptyAddressBook [
	<gtExample>
	| addressBook |
	addressBook := ABAddressBook emptyAddressBook.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^addressBook.
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchAddressesWithOneContact [
	<gtExample>
	| book resultOneCompany |
	book:= ABAddressBook addressBookWithFullTestContact.

	resultOneCompany:= book searchAddresses: 'Test'.
	self assert: resultOneCompany size equals: 1.

	resultOneCompany:= book searchAddresses: 'Village'.
	self assert: resultOneCompany size equals: 0.
	
	resultOneCompany:= book searchAddresses: '0'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompany [
	<gtExample>
	| book anotherContact resultTwoCompanies resultOneCompany|
	book:= ABAddressBook addressBookWithFullTestContact.

	anotherContact:= ABContact new
		company: 'Test Test';
		firstName: 'zet'; 
		lastName: 'pips'.
	book addContact: anotherContact.

	resultTwoCompanies := book searchCompanies: 'Test'.
	self assert: resultTwoCompanies size equals: 2.

	resultOneCompany:= book searchCompanies: 'Company'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompanyWithOneContact [
	<gtExample>
	| book resultOneCompany|
	book:= ABAddressBook addressBookWithFullTestContact.
	resultOneCompany:= book searchCompanies: 'Company'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompanyWithTwoContacts [
	<gtExample>
	| book resultTwoCompanies resultOneCompany|
	book:= ABAddressBook addressBookTwoFullTestContacts.

	resultTwoCompanies := book searchCompanies: 'Company'.
	self assert: resultTwoCompanies size equals: 2.

	resultOneCompany:= book searchCompanies: 'another'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchNamesWithOneContact [
	<gtExample>
	| book resultOneRecord emptySet|
	
	book := ABAddressBook addressBookWithFullTestContact.
	
	resultOneRecord := book searchNames: 'contact'.
	self assert: resultOneRecord size equals: 0.
	
	emptySet := book searchNames: 'notPresent'.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchNamesWithTwoContacts [
	<gtExample>
	| book resultTwoRecords resultOneRecord |
	
	book := ABAddressBook addressBookTwoFullTestContacts.
	
	resultTwoRecords := book searchNames: 't'.
	self assert: resultTwoRecords size equals: 2.
	
	resultOneRecord := book searchNames: 'contact'.
	self assert: resultOneRecord size equals: 1.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchPhoneWithOneContact [
	<gtExample>
	| book resultOneRecord emptySet|
	
	book := ABAddressBook addressBookWithFullTestContact.
	
	resultOneRecord := book searchPhones: 1.
	self assert: resultOneRecord size equals: 1.
	
	emptySet := book searchPhones: 9.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchPhonesWithOneContact [
	<gtExample>
	| book resultOneRecord emptySet|
	
	book := ABAddressBook addressBookWithFullTestContact.
	
	resultOneRecord := book searchPhones: 123.
	self assert: resultOneRecord size equals: 1.
	
	emptySet := book searchPhones: 9999.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchPhonesWithTwoContacts [
	<gtExample>
	| book resultTwoRecords resultOneRecord |
	
	book := ABAddressBook addressBookTwoFullTestContacts.
	
	resultTwoRecords := book searchPhones: 9.
	self assert: resultTwoRecords size equals: 2.
	
	resultOneRecord := book searchPhones: 99999.
	self assert: resultOneRecord size equals: 1.
	^ book
]
