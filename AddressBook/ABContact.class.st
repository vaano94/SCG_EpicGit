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
		'notes',
		'company',
		'createdAt'
	],
	#category : #AddressBook
}

{ #category : #'examples - contacts' }
ABContact class >> janeDoe [
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContact class >> janeSmith [
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Smith'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContact class >> johnDoe [
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Doe'.
	^ contact
]

{ #category : #'examples - contacts' }
ABContact class >> johnSmith [
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Smith'.
	^ contact
]

{ #category : #tests }
ABContact class >> test [
	| contact |
	contact := ABContact new.
	contact firstName: 'Test'.
	contact lastName: 'Test'.
	^ contact
]

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
ABContact >> company [
	^ company
]

{ #category : #accessing }
ABContact >> company: aString [
	company := aString
]

{ #category : #accessing }
ABContact >> email [
	^ email
]

{ #category : #accessing }
ABContact >> email: emailList [
	email := emailList
]

{ #category : #'as yet unclassified' }
ABContact >> emptyStringOnNilValue: value [
	value ifNil: [^ 'null' ].
	value ifEmpty: [^ ''].
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
		column: 'Email' item: [ :anEmail | anEmail toString ]
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
	createdAt := DateAndTime now
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

{ #category : #accessing }
ABContact >> phoneNumber: phone [
	phoneNumber:= phone
]

{ #category : #printing }
ABContact >> toString [
	^ 'FirstName: ' , firstName , String cr , 
	'LastName: ' , lastName	, String cr,
	'PhoneNumber: ' , phoneNumber, String cr,
	'Address: ', address, String cr,
	'Email: ' , email, String cr, 
	'Notes: ' , (self emptyStringOnNilValue: notes), String cr,
	'Company: ' , (self emptyStringOnNilValue: company), String cr,
	'CreatedAt ', createdAt asStringOrText 
	
	"
	emptyStringOnNilValue: notes
					ifTrue: [ Transcript show: 'woop' ] value
					ifFalse: [ Transcript show: 'poop' ] value
	,
	 
	isEmptyOrNil ifTrue: [ notes = 'woop' ] ,
		, 'PhoneNumber ' , phoneNumber , 'Address ' , address , 'Email: '
		, email , 'Notes: ' , notes , 'Company: ' , company , 'CreatedAt: '
		, createdAt asString
		
	"
]
