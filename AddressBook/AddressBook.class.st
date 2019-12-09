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

{ #category : #'as yet unclassified' }
AddressBook >> merge: left and: right [

	^nil.
]

{ #category : #'as yet unclassified' }
AddressBook >> merge: aContact1 and: aContact2 on: aString [

	^nil.
]

{ #category : #removing }
AddressBook >> removeAddress: aContact address:AnAddress [

	^nil.
]

{ #category : #removing }
AddressBook >> removeCompany: aContact [
	aContact company: ''.
	^aContact.
]

{ #category : #removing }
AddressBook >> removeEmail: aContact emailAddress:anEmail [

	^nil.
]

{ #category : #removing }
AddressBook >> removeNote: aContact [
	aContact notes: ''.
	^aContact.
]

{ #category : #removing }
AddressBook >> removePhone: aContact phone:aPhoneNumber [

	^nil.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchAddress: anAddress [
	^ true.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchCompany: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchEmail: anEmail [
	^ true.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchFirstName: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchLastName: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
AddressBook >> searchPhone: aPhoneNumber [
	^ true.
]
