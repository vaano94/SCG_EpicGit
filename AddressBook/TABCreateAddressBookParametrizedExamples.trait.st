Trait {
	#name : #TABCreateAddressBookParametrizedExamples,
	#category : #'AddressBook-Scenarios'
}

{ #category : #accessing }
TABCreateAddressBookParametrizedExamples classSide >> label [
	^ self class name
]

{ #category : #'examples - parametrized' }
TABCreateAddressBookParametrizedExamples >> exampleAddressBookLabeled: aLabel withContacts: aCollectionOfContacts [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create address book.'>
	<given: #'Label' ofType: #String in: '' elementType: #input>
	<given: #'Contacts' ofType: #ABContact in: #self elementType: #multipleSearch>
	<return: #ABAddressBook>
	| addressBook |
	addressBook := ABAddressBook new.
	aCollectionOfContacts do: [ : aContact | 
		addressBook addContact: aContact ].
	^ addressBook
]
