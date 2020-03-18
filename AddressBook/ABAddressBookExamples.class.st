"
This class contains tests.

example := (ABAddressBookExamples >> #exampleAddContact:toAddressBook:) gtParametrizedExample.

example arguments: {
	ABContact johnDoe. ABAddressBook emptyAddressBook }.
	
result := example run.
result returnValue.
"
Class {
	#name : #ABAddressBookExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'examples - AddAddressBook' }
ABAddressBookExamples >> addressBookAddContact [
	<gtExample>
	<label: 'Book with one contact'>
	<description: 'Verify that adding a contact is successful'>
	| addressBook b phn phones adr addresses |
	addressBook := ABAddressBook emptyAddressBook.
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
	addressBook addContact: b.
	self assert: b firstName equals: 'b'.
	^ addressBook
]

{ #category : #'examples - AddAddressBook' }
ABAddressBookExamples >> addressBookAddTwoContactsWithSameName [
	<gtExample>
	<label: 'Book with one contact'>
	<description: 'Verify that adding same contact merges them'>
	| addressBook contactWithSameName email |
	addressBook := self addressBookWithFullTestContact.
	contactWithSameName := ABContactExamples testFullContact.
	email := ABEmail new
		host: 'HOST';
		username: 'USERNAME';
		type: ABEmailType work.
	contactWithSameName addEmail: email.
	self assert: contactWithSameName firstName equals: 'John'.
	addressBook addContact: contactWithSameName.
	^ addressBook
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> addressBookTwoFullTestContacts [
	<gtExample>
	<label: 'Two contacts in a book'>
	<description: 'A book with two fully filled contacts'>
	| addressBook contact phn phones adr addresses email anotherContact |
	addressBook := self emptyAddressBook.
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
	email := ABEmail testEmail.
	contact addEmail: email.
	contact company: 'Test Company'.
	addressBook addContact: contact.
	anotherContact := contact copy.
	anotherContact
		firstName: 'another';
		lastName: 'contact';
		company: 'Completely another company'.
	phn := ABPhoneNumber testPhoneOnlyNines.
	phones := OrderedCollection new.
	phones add: phn.
	anotherContact phoneNumber: phones.
	addressBook addContact: anotherContact.
	^ addressBook
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> addressBookWithFullTestContact [
	<gtExample>
	<label: 'Full contact'>
	<description: 'A book with fully filled contact'>
	| addressBook contact phn phones adr addresses email |
	addressBook := self emptyAddressBook.
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
	addressBook addContact: contact.
	email := ABEmail testEmail.
	contact addEmail: email.
	contact company: 'Test Company'.
	^ addressBook
]

{ #category : #'instance creation examples' }
ABAddressBookExamples >> emptyAddressBook [
	<gtExample>
	<label: 'empty book'>
	<description: 'Book that does not contain anything'>
	<used: #(#(ABAddressBookExamples >> #exampleAddContact:toAddressBook:) 'two')>
	| addressBook |
	addressBook := ABAddressBook emptyAddressBook.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^ addressBook
]

{ #category : #search }
ABAddressBookExamples >> exampleAddContact: aContact toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #aContact ofType: #ABContact in: #ABContactExamples>
	<given: #anAddressBook ofType: #ABAddressBook in: #ABAddressBookExamples>
	<return: #ABAddressBook>
	anAddressBook addContact: aContact.
	^ anAddressBook
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchAddressesWithOneContact [
	<gtExample>
	<label: 'one contact search address'>
	<description: 'Verify that searching addresses within one contact is successful'>
	| book resultOneCompany |
	book := self addressBookWithFullTestContact.
	resultOneCompany := book searchAddresses: 'Test'.
	self assert: resultOneCompany size equals: 1.
	resultOneCompany := book searchAddresses: 'Village'.
	self assert: resultOneCompany size equals: 0.
	resultOneCompany := book searchAddresses: '0'.
	self assert: resultOneCompany size equals: 1.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompany [
	<gtExample>
	<label: 'one contact search company'>
	<description: 'Verify that searching company within one contact is successful'>
	| book anotherContact resultTwoCompanies resultOneCompany |
	book := self addressBookWithFullTestContact.
	anotherContact := ABContact new
		company: 'Test Test';
		firstName: 'zet';
		lastName: 'pips'.
	book addContact: anotherContact.
	resultTwoCompanies := book searchCompanies: 'Test'.
	self assert: resultTwoCompanies size equals: 2.
	resultOneCompany := book searchCompanies: 'Company'.
	self assert: resultOneCompany size equals: 1.
	^ book
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> exampleSearchCompany: aCompany In: aBook [
	<gtParametrizedExample>
	<given: #aCompany ofType: #String in: #input>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples>
	<return: #ABAddressBook>
	| result |
	result := aBook searchCompanies: aCompany.
	^ result
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompanyWithOneContact [
	<gtExample>
	<label: 'one contact search company'>
	<description: 'Verify that searching company within one contact is successful'>
	| book resultOneCompany |
	book := self addressBookWithFullTestContact.
	resultOneCompany := self exampleSearchCompany: 'Company' In: book.
	self assert: resultOneCompany size equals: 1.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchCompanyWithTwoContacts [
	<gtExample>
	<label: 'Two contacts search company'>
	<description: 'Verify that searching company within two contacts is successful'>
	| book resultTwoCompanies resultOneCompany |
	book := self addressBookTwoFullTestContacts.
	resultTwoCompanies := self exampleSearchCompany: 'Company' In: book.
	self assert: resultTwoCompanies size equals: 2.
	resultOneCompany := self exampleSearchCompany: 'another' In: book.
	self assert: resultOneCompany size equals: 1.
	^ book
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> exampleSearchNames: aName in: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples>
	<given: #aName ofType: #String in: #input>
	<return: #ABAddressBook>
	| result |
	result := aBook searchNames: aName.
	^ result
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchNamesWithOneContact [
	<gtExample>
	<label: 'Book One contact search names'>
	<description: 'Verify that searching name with is successful'>
	| book resultOneRecord emptySet |
	book := ABAddressBook addressBookWithFullTestContact.
	resultOneRecord := self exampleSearchNames: 'contact' in: book.
	self assert: resultOneRecord size equals: 0.
	emptySet := self exampleSearchNames: 'notPresent' in: book.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchNamesWithTwoContacts [
	<gtExample>
	<label: 'Two contacts search names'>
	<description: 'Verify that searching name with two contacts is successful'>
	| book resultTwoRecords resultOneRecord |
	book := ABAddressBook addressBookTwoFullTestContacts.
	resultTwoRecords := self exampleSearchNames: 't' in: book.
	self assert: resultTwoRecords size equals: 2.
	resultOneRecord := self exampleSearchNames: 'contact' in: book.
	self assert: resultOneRecord size equals: 1.
	^ book
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> exampleSearchPhones: aPhone in: aBook [
	<gtParametrizedExample>
	<given: #aPhone ofType: #String in: #input>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples>
	<return: #ABAddressBook>
	^ aBook searchPhones: aPhone
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchPhonesWithOneContact [
	<gtExample>
	<label: 'One contact search phone'>
	<description: 'Verify that searching phone with is successful'>	
	| book resultOneRecord emptySet |
	book := ABAddressBook addressBookWithFullTestContact.
	resultOneRecord := self exampleSearchPhones: 123 in: book.
	self assert: resultOneRecord size equals: 1.
	emptySet := self exampleSearchPhones: 9999 in: book.
	self assert: emptySet size equals: 0.
	^ book
]

{ #category : #search }
ABAddressBookExamples >> exampleSearchPhonesWithTwoContacts [
	<gtExample>
	<label: 'Book with two contacts'>
	<description: 'Verify that searching phone in two contacts is successful'>
	| book resultTwoRecords resultOneRecord |
	book := ABAddressBook addressBookTwoFullTestContacts.
	resultTwoRecords := self exampleSearchPhones: 9 in: book.
	self assert: resultTwoRecords size equals: 2.
	resultOneRecord := self exampleSearchPhones: 99999 in: book.
	self assert: resultOneRecord size equals: 1.
	^ book
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> filterSearchByFilter [
	<gtExample>
	<label: 'Filter companies names phones'>
	<description: 'Verify search for companies, names, phones'>
	| filter book a |
	filter := ContactFilter new.
	filter
		withCompanies;
		withNames;
		withPhones.
	book := ABAddressBook addressBookTwoFullTestContacts.
	a := ABContact new.
	a
		firstName: '|';
		lastName: '|'.
	book addContact: a.
	book search: 'a' withFilter: filter.
	^ book
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> getSearchResultForWord: aWord withFilter: filter inBook: aBook [
	<gtParametrizedExample>
	<label: 'Search with given filter'>
	<description: 'Verify search for given filter'>
	| result |
	result := aBook search: aWord withFilter: filter.
	^ result
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> removeContact [
	<gtExample>
	<label: 'Book with removed contact'>
	<description: 'removes contacts from one contact book and then two contact book'>
	| addressBook contact |
	addressBook := self addressBookWithFullTestContact.
	contact := addressBook contacts at: 1.
	addressBook removeContact: contact.
	self assert: addressBook contacts size equals: 0.
	addressBook := self addressBookTwoFullTestContacts.
	contact := addressBook contacts at: 2.
	addressBook removeContact: contact.
	self assert: addressBook contacts size equals: 1.
	^ addressBook
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> searchResultForFilter: filter inBook: aBook word: word [
	<gtExample>
	<gtParametrizedExample>
	<label: 'Search with given filter'>
	<description: 'Verify search for given filter'>
	<given: #filter ofType: #ContactFilter in: #ABFilterExamples>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples>
	<given: #word ofType: #String in: #input>
	<return: #ABAddressBook>
	| result |
	result := aBook search: word withFilter: filter.
	^ result
]
