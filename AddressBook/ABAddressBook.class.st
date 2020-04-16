"
I represent an address book with a contact list.
"
Class {
	#name : #ABAddressBook,
	#superclass : #Object,
	#instVars : [
		'label',
		'contacts',
		'filter'
	],
	#category : #'AddressBook-Model'
}

{ #category : #'as yet unclassified' }
ABAddressBook class >> addressBookTwoFullTestContacts [
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
		
	email :=	ABEmail testEmail.
	contact addEmail: email.
	contact company: 'Test Company'.
	
	addressBook addContact: contact.
	
	anotherContact := contact copy. 
	anotherContact firstName: 'another'; lastName: 'contact'; company: 'Completely another company'.
	phn:= ABPhoneNumber testPhoneOnlyNines.
	phones := OrderedCollection new.
	phones add: phn.
	anotherContact phoneNumber: phones.
	
	addressBook addContact: anotherContact.
	
	^ addressBook
]

{ #category : #'as yet unclassified' }
ABAddressBook class >> addressBookWithFullTestContact [
	| addressBook contact phn phones adr addresses email |
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
	addressBook addContact: contact.
		
	email :=	ABEmail testEmail.
	contact addEmail: email.
	
	contact company: 'Test Company'.
	
	^ addressBook
]

{ #category : #'instance creation examples' }
ABAddressBook class >> emptyAddressBook [
	| addressBook |
	addressBook := ABAddressBook new.
	^addressBook.
]

{ #category : #adding }
ABAddressBook >> addContact: aContact [
	| tempContact |
	tempContact := aContact.
	self contacts doWithIndex: 
	[:each :i | 
	(each fullName) = (aContact fullName)
		ifTrue: [ tempContact := each mergeWith: aContact.
				contacts at: i put: tempContact .
				^ tempContact.
			 ].
	 ]. 
	^ contacts add: aContact.
]

{ #category : #accessing }
ABAddressBook >> contacts [
	^ contacts
]

{ #category : #'instance creation examples' }
ABAddressBook >> emptyAddressBook [
	<gtExample>
	| addressBook |
	addressBook := ABAddressBook emptyAddressBook.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^addressBook.
]

{ #category : #'gt-extensions' }
ABAddressBook >> gtViewContactsList: aView [
	<gtView>
	^ aView columnedList
		title: 'Contacts';
		priority: 0;
		items: [ contacts ];
		column: 'Name' item: [ :aContact | aContact fullName  ]
]

{ #category : #'gt-extensions' }
ABAddressBook >> gtViewSpotterPreview: aView [
	^ self gtViewContactsList: aView
]

{ #category : #initialization }
ABAddressBook >> initialize [
	super initialize.
	contacts := OrderedCollection new.
]

{ #category : #accessing }
ABAddressBook >> label [
	^ label
]

{ #category : #accessing }
ABAddressBook >> label: anObject [
	label := anObject
]

{ #category : #'as yet unclassified' }
ABAddressBook >> merge: aContact1 and: aContact2 on: aString [
	"a:= UIManager default request: 'Title of the request'"
	
	^nil.
]

{ #category : #removing }
ABAddressBook >> removeContact: contact [
	|copiedCollection|
	copiedCollection := self contacts.
	self contacts do: [ :c | contact = c ifTrue: [ copiedCollection remove: contact ] ].
	^ copiedCollection 
]

{ #category : #'as yet unclassified' }
ABAddressBook >> search: word withFilter: searchFilter [
	|aggregatedResult c|
	aggregatedResult:= Set new.
	
	(searchFilter filters) do: [ :fil | 
		"possible types = Companies, Addresses, Names, Phones"
		
 		c := (self searchByType: fil keyword: word).
		c do: [ :cont | aggregatedResult add: cont ].
	].

	^ aggregatedResult
	
]

{ #category : #'as yet unclassified' }
ABAddressBook >> searchAddresses: word [
	| addresses result wordLC |
	result := Set new.
	wordLC:= word asLowercase.
	contacts do: [ :contact | 
		addresses:= contact address.
		"'streetName streetNumber postalCode city country''"
		addresses do: [ :address | 
			
		((address streetName asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ]  .
	 	
		((address streetNumber asString asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
		
		 ((address postalCode asString asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
	
		 ((address city asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
	
		((address country asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
			]		
		].
	^ result.
]

{ #category : #'as yet unclassified' }
ABAddressBook >> searchByType: type keyword: word [
	|result|
	result :=	 Set new.
	type = 'Companies' ifTrue: [ 
		result addAll: (self searchCompanies: word).
		 ].
	type = 'Names' ifTrue: [ 
		result addAll: (self searchNames: word).
		  ].
	type = 'Phones' ifTrue: [ 
		result addAll: (self searchPhones: word).	
		 ].
	type = 'Addresses' ifTrue: [ 
		result addAll: (self searchAddresses: word).
		 ].
	
	^ result.
]

{ #category : #search }
ABAddressBook >> searchCompanies: word [
	| result |
	result := Set new.
	contacts do: [ :contact | 
		contact company notNil ifTrue: [ 
					((contact company asLowercase) includesSubstring: (word asLowercase)) ifTrue: [ result add: contact ].
			 ].
		].
	^ result.
]

{ #category : #'as yet unclassified' }
ABAddressBook >> searchNames: word [
	| result wordLC|
	result := Set new.
	wordLC:= word asLowercase.
	contacts do: [ :contact | 
		((contact firstName asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
	 	((contact lastName asLowercase) includesSubstring: wordLC) ifTrue: [ result add: contact ].
		].
	^ result.
]

{ #category : #'as yet unclassified' }
ABAddressBook >> searchPhones: word [
	| result |
	result := Set new.
	contacts do: [ :contact | 
		contact phoneNumber do: [ :num | 
					( (num number asString) includesSubstring: (word asString)) ifTrue: [ result add: contact ].
 ] 
		].
	^ result.
]
