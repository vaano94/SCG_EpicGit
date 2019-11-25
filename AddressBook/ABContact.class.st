"
I represent a contact in an address book with a name, phone numbers, addresses, and emails.
"
Class {
	#name : #ABContact,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName',
		'phoneNumber',
		'address',
		'email',
		'notes'
	],
	#category : #AddressBook
}

{ #category : #adding }
ABContact >> addAddress: anAddress [
	address add: anAddress.
]

{ #category : #adding }
ABContact >> addEmail: anEmail [
	email add: anEmail.
]

{ #category : #adding }
ABContact >> addPhoneNumber: aPhoneNumber [
	phoneNumber add: aPhoneNumber.
]

{ #category : #accessing }
ABContact >> address [
	^ address
]

{ #category : #accessing }
ABContact >> email [
	^ email
]

{ #category : #accessing }
ABContact >> firstName [
	^ firstName
]

{ #category : #accessing }
ABContact >> firstName: aString [
	firstName := aString
]

{ #category : #accessing }
ABContact >> fullName [
	^ firstName, ' ', lastName.
]

{ #category : #'as yet unclassified' }
ABContact >> gtViewAddresses: aView [
	<gtView>
	^ aView columnedList
		title: 'Addresses';
		priority: 1;
		items: [ address ];
		column: 'Type' item: [ :aPhoneNumber | aPhoneNumber type ] width: 200;
		column: 'Address' item: [ :aPhoneNumber | aPhoneNumber fullAddress ]
]

{ #category : #'as yet unclassified' }
ABContact >> gtViewDetails: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 0;
		items: [ {('Name' -> self fullName).
			('Notes' -> notes).} ];
		column: 'Detail' item: [ :anAssociation | anAssociation key ];
		column: 'Value' item: [ :anAssociation | anAssociation value ]
]

{ #category : #'as yet unclassified' }
ABContact >> gtViewEmails: aView [
	<gtView>
	^ aView columnedList
		title: 'Email Addresses';
		priority: 2;
		items: [ email ];
		column: 'Type' item: [ :anEmail | anEmail type ];
		column: 'Email' item: [ :anEmail | anEmail fullEmail ]
]

{ #category : #'as yet unclassified' }
ABContact >> gtViewPhones: aView [
	<gtView>
	^ aView columnedList
		title: 'Phone Numbers';
		priority: 3;
		items: [ phoneNumber ];
		column: 'Type' item: [ :aPhoneNumber | aPhoneNumber type ];
		column: 'Number' item: [ :aPhoneNumber | aPhoneNumber phoneNumber ]
]

{ #category : #initialization }
ABContact >> initialize [
	super initialize.
	phoneNumber := OrderedCollection new.
	address := OrderedCollection new.
	email := OrderedCollection new.
	
]

{ #category : #accessing }
ABContact >> lastName [
	^ lastName
]

{ #category : #accessing }
ABContact >> lastName: aString [
	lastName := aString
]

{ #category : #accessing }
ABContact >> notes [
	^ notes
]

{ #category : #accessing }
ABContact >> notes: aString [
	notes := aString
]

{ #category : #accessing }
ABContact >> phoneNumber [
	^ phoneNumber
]
