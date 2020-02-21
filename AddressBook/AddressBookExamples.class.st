Class {
	#name : #AddressBookExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchAddressesWithOneContact [
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

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchCompany [
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

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchCompanyWithOneContact [
	<gtExample>
	| book resultOneCompany|
	book:= ABAddressBook addressBookWithFullTestContact.
	resultOneCompany:= book searchCompanies: 'Company'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchCompanyWithTwoContacts [
	<gtExample>
	| book resultTwoCompanies resultOneCompany|
	book:= ABAddressBook addressBookTwoFullTestContacts.

	resultTwoCompanies := book searchCompanies: 'Company'.
	self assert: resultTwoCompanies size equals: 2.

	resultOneCompany:= book searchCompanies: 'another'.
	self assert: resultOneCompany size equals: 1.

	^ book
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchNamesWithOneContact [
	<gtExample>
	| book resultOneRecord emptySet|
	
	book := ABAddressBook addressBookWithFullTestContact.
	
	resultOneRecord := book searchNames: 'contact'.
	self assert: resultOneRecord size equals: 0.
	
	emptySet := book searchNames: 'notPresent'.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #'as yet unclassified' }
AddressBookExamples >> exampleSearchNamesWithTwoContacts [
	<gtExample>
	| book resultTwoRecords resultOneRecord |
	
	book := ABAddressBook addressBookTwoFullTestContacts.
	
	resultTwoRecords := book searchNames: 't'.
	self assert: resultTwoRecords size equals: 2.
	
	resultOneRecord := book searchNames: 'contact'.
	self assert: resultOneRecord size equals: 1.
	^ book
]
