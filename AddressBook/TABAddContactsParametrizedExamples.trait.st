Trait {
	#name : #TABAddContactsParametrizedExamples,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'examples - parametrized' }
TABAddContactsParametrizedExamples >> exampleAddContact: aContact toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Add a contact to an address book.'>
	<given: #'Contact' ofType: #ABContact in: #self elementType: #search>
	<given: #'Address book' ofType: #ABAddressBook in: #self elementType: #list>
	<return: #ABAddressBook>
	
	anAddressBook addContact: aContact.
	^ anAddressBook
]

{ #category : #'examples - parametrized' }
TABAddContactsParametrizedExamples >> exampleAddContacts: aCollectionOfContacts toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Add contacts to an address book.'>
	<given: #'Contacts' ofType: #ABContact in: #self elementType: #multipleSearch>
	<given: #'Address book' ofType: #ABAddressBook in: #self elementType: #list>
	<return: #ABAddressBook>
	
	aCollectionOfContacts do: [ : aContact | 
		anAddressBook addContact: aContact ].
	^ anAddressBook
]
