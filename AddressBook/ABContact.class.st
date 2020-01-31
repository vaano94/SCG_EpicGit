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
	#category : #'AddressBook-Model'
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
ABContact >> address: anObject [
	address := anObject
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
ABContact >> createdAt [
	^ createdAt
]

{ #category : #accessing }
ABContact >> createdAt: anObject [
	createdAt := anObject
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
		column: 'Number' item: [ :aPhoneNumber | aPhoneNumber toString ]
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

{ #category : #private }
ABContact >> mergeWith: anotherContact [
	| answer main x y str returnValue|

	x := self.
	y := 456.
	str:= 'Contact {1} is more recent: {2} compared to {3}, overwrite and merge it''s details to contact {4}? y/n'.
"	UIManager default request: str.	"
	
	(self createdAt) > (anotherContact createdAt)
		ifTrue: [answer:= UIManager default request: (str format: {self fullName . self createdAt . anotherContact createdAt  . anotherContact fullName}). main:= self]
		ifFalse: [answer:= UIManager default request: (str format: {anotherContact fullName . anotherContact createdAt . self createdAt  . self fullName}). main:= anotherContact]
		.
		
	Transcript show: (('Main is {1} ' format: {main fullName}) , String cr).
			
	 (answer = 'y' & main = self)
		ifTrue: [
				Transcript show: 'Merging self into another contact'.
				anotherContact firstName: self firstName.
				anotherContact lastName: self lastName.
				Transcript show: 'Merging phone number'.
				anotherContact phoneNumber: [ 
					self phoneNumber isEmpty
					ifFalse: self phoneNumber.					 							
					] value.
				anotherContact address: [
					self address isNil isEmpty
					ifTrue: self address.					 							
					] value.
				anotherContact email: [
					self email isNil isEmpty
					ifTrue: self email
					] value.
				anotherContact notes: [ 
					self notes isNil not
					ifTrue: self notes ] value.
				anotherContact company: [
					self company isNil not
					ifTrue: self company] value.
				
				Transcript show: anotherContact fullName.
				returnValue := anotherContact	
			].
		
		"					ifTrue: [ (anotherContact phoneNumber isNil | anotherContact phoneNumber isEmpty ) 
													ifTrue: self phone. 
													]
"
		
	(answer = 'y' & main = anotherContact)
		ifTrue: [Transcript show: 'Merging another contacnt into self'.
				self firstName: anotherContact firstName.
				self lastName: anotherContact lastName.
				Transcript show: 'Merging phoneNumber'.
				self phoneNumber: [ 
					anotherContact phoneNumber isEmpty
					ifFalse: anotherContact phoneNumber.					 							
					] value.
				self address: [
					anotherContact address isEmpty
					ifFalse: anotherContact address.					 							
					] value.
				self email: [
					anotherContact email isEmpty
					ifFalse: anotherContact email
					] value .
				self notes: [ 
					anotherContact notes isNil not
					ifTrue: anotherContact notes ] value.
				self company: [
					anotherContact company isNil not
					ifTrue: anotherContact company] value.
				
				Transcript show: self fullName.
				returnValue = self	
			].		
	^ returnValue			
		
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

{ #category : #accessing }
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
