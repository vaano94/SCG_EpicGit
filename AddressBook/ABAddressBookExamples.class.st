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
	| addressBook b phn phones adr addresses email |
	addressBook := ABAddressBook emptyAddressBook.
	b := ABContact new.
	b
		firstName: 'Ivan';
		lastName: 'Kravchenko'.
	phn := ABPhoneNumber testPhoneIvan.
	phones := OrderedCollection new.
	phones add: phn.
	b phoneNumber: phones.
	adr := ABAddress testAddress.
	addresses := OrderedCollection new.
	addresses add: adr.
	b address: addresses.
	addressBook addContact: b.
	email:= ABEmail testEmail.
	b addEmail: email. 
	self assert: b firstName equals: 'Ivan'.
	^ addressBook
]

{ #category : #'examples - AddAddressBook' }
ABAddressBookExamples >> addressBookAddTwoContactsWithSameName [
	<gtExample>
	<label: 'Book add same name results in one contact example'>
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
	<return: #ABAddressBook>
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
	<label: 'Book with john doe'>
	<description: 'A book with fully filled contact'>
	<return: #ABAddressBook>
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
	<label: 'Add a given contact to an address book'>
	<description: 'Add a given contact to an address book'>
	<given: #aContact ofType: #ABContact in: #ABContactExamples
	elementType: #dropdown>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #search>
	<return: #ABAddressBook>
	anAddressBook addContact: aContact.
	^ anAddressBook
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> exampleSearchAddress: aWord in: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #aWord ofType: #String in:#'' elementType:#input>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #list>
	<return: #ABContact>
	<label: 'Parametrized search of an address in an address book'>
	<description: 'Searches for a contact which address includes provided input. In case of multiple contacts, returns all of them. Ignores using case.'>
	| result |
	result := aBook searchAddresses: aWord.
	^ result
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
ABAddressBookExamples >> exampleSearchCompany: aCompany in: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #aCompany ofType: #String in:#'' elementType:#input>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #search>
	<return: #ABAddressBook>
	<label: 'Parametrized search of a company in an address book'>
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
	resultOneCompany := self exampleSearchCompany: 'Company' in: book.
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
	resultTwoCompanies := self exampleSearchCompany: 'Company' in: book.
	self assert: resultTwoCompanies size equals: 2.
	resultOneCompany := self exampleSearchCompany: 'another' in: book.
	self assert: resultOneCompany size equals: 1.
	^ book
]

{ #category : #accessing }
ABAddressBookExamples >> exampleSearchNames: aName in: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #name ofType: #String in: #'' elementType: #input>
	<given: #book ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #dropdown>
	<return: #ABAddressBook>
	<label: 'Parametrized search of a name in an address book'>
	<description: 'User enters any symbol in a search field. The given book of any size then uses given search filter for names and returns a set of unique contacts. Returns zero-size set when no results will be found.'>
	| result |
	result := aBook searchNames: aName.
	^ result
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> exampleSearchNames: aName inMany: books [
	<gtParametrizedExample>
	<gtExample>
	<given: #aName ofType: #String in:#'' elementType:#input>
	<given: #books ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #multipleSearch>
	<return: #ABAddressBook>
	<label: 'Parametrized search of a name in many address books'>
	| result |
	result := IdentitySet new.
	books do: [ :book | result addAll: (book searchNames: aName) ].
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

{ #category : #accessing }
ABAddressBookExamples >> exampleSearchPhones: aPhone in: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #'Phone number' ofType: #String in: #'' elementType:#input>
	<given: #'Address book' ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #dropdown>
	<return: #ABAddressBook>
	<label: 'Parametrized search of a phone in an address book'>
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

{ #category : #removing }
ABAddressBookExamples >> removeContact [
	<gtParametrizedExample>
	<gtExample>
	<return: #ABAddressBook>
	<label: 'Book with one deleted contact'>
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

{ #category : #removing }
ABAddressBookExamples >> removeContact: aContact fromBook: aBook [
	<gtParametrizedExample>
	<gtExample>
	<given: #contact ofType: #ABContact in: #ABContactExamples elementType: #dropdown>
	<given: #'address Book' ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #search>
	<return: #ABAddressBook>
	<label: 'Parametrized removal of a contact in address book'>
	aBook removeContact: aContact.
	^ aBook
]

{ #category : #'as yet unclassified' }
ABAddressBookExamples >> searchResultForFilter: filter inBook: aBook word: word [
	<gtExample>
	<gtParametrizedExample>
	<label: 'Search with given filter'>
	<description: 'Verify search for given filter'>
	<given: #filter ofType: #ContactFilter in: #ABFilterExamples elementType: #dropdown>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples elementType: #dropdown>
	<given: #word ofType: #String in: #input>
	<return: #ABAddressBook>
	| result |
	result := aBook search: word withFilter: filter.
	^ result
]

{ #category : #tests }
ABAddressBookExamples >> testExampleAddContactToAddressBook [
	<gtExample>
  ^ (ABAddressBookExamples new addressBookWithFullTestContact) addContact: (ABMyContactsAddressBookExamples new berangariaMartinContact)
]
