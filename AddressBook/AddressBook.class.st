"
I represent an address book with a contact list.
"
Class {
	#name : #AddressBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #AddressBook
}

{ #category : #adding }
AddressBook >> addContact: aContact [
	^ contacts add: aContact.
]

{ #category : #accessing }
AddressBook >> contacts [
	^ contacts
]

{ #category : #'as yet unclassified' }
AddressBook >> gtViewContactsList: aView [
	<gtView>
	^ aView columnedList
		title: 'Contacts';
		priority: 0;
		items: [ contacts ];
		column: 'Name' item: [ :aContact | aContact fullName  ]
]

{ #category : #initialization }
AddressBook >> initialize [
	super initialize.
	contacts := OrderedCollection new.
]
