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

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddAddressFailAddress [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := ABContact janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: ABAddress addressNew.
	contact addAddress: ABAddress addressBadAddress.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddAddressFailType [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := ABContact janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: self addressNew.
	contact addAddress: self addressBadType.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddAddressSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: self addressNew.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddCompanySuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact company: 'UniBe'.
	
	self assert: contact company equals: 'UniBe'.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddEmailFailAddress [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addEmail: self emailNew.
	contact addEmail: self emailBadAddress.
	
	self assert: contact email isNotEmpty.
	self assert: contact email size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddEmailFailType [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addEmail: self emailNew.
	contact addEmail: self emailBadType.
	
	self assert: contact email isNotEmpty.
	self assert: contact email size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddEmailSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addEmail: self emailNew.
	
	self assert: contact email isNotEmpty.
	self assert: contact email size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddFirstNameSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	contact firstName: ''.
	addressBook
		addContact: contact.
	
	contact firstName: 'Jane'.
	
	self assert: contact firstName equals: 'Jane'.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddLastNameSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	contact lastName: ''.
	addressBook
		addContact: contact.
	
	contact lastName: 'Doe'.
	
	self assert: contact lastName equals: 'Doe'.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddNewFailure [
	<gtExample>
	| addressBook |
	addressBook := self addressBookAddNewSuccess.
	addressBook
		addContact: self janeDoe.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddNewSuccess [
	<gtExample>
	| addressBook |
	addressBook := self emptyAddressBook.
	addressBook
		addContact: self janeDoe.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddNoteSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact notes: 'coworker at SCG'.
	
	self assert: contact notes equals: 'coworker at SCG'.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddPhoneFailNumber [
	<gtExample>
	| contact addressBook |
	contact := self janeDoe.
	addressBook := self emptyAddressBook.
	addressBook addContact: contact.
	
	contact addPhoneNumber: self phoneNew.
	contact addPhoneNumber: self phoneBadNumber.
	
	self assert: contact phoneNumber isNotEmpty.
	self assert: contact phoneNumber size equals: 1.
	
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddPhoneFailType [
	<gtExample>
	| contact addressBook |
	contact := self janeDoe.
	addressBook := self emptyAddressBook.
	addressBook addContact: contact.
	
	contact addPhoneNumber: self phoneNew.
	contact addPhoneNumber: self phoneBadType.
	
	self assert: contact phoneNumber isNotEmpty.
	self assert: contact phoneNumber size equals: 1.
	
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
AddressBook >> addressBookAddPhoneSuccess [
	<gtExample>
	| addressBook contact|
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	contact addPhoneNumber: self phoneNew.
	
	self assert: contact phoneNumber isNotEmpty.
	self assert: contact phoneNumber size equals: 1.
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookEditAddress [
	<gtExample>
	| addressBook contact address |
	addressBook := self addressBookAddAddressSuccess.
	contact := addressBook contacts at: 1.
	address := contact address at: 1.
	
	address streetName: 'Langasse'.
	
	self assert: address streetName equals: 'Langasse'.
	self assert: address streetNumber equals: 14.
	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address postalCode equals: 3001.
	self assert: address type equals: 'Home'.
	
	contact addAddress: self addressBadAddress.
	self assert: contact address size equals: 2.
	
	"Change street number -- success"
	address streetNumber: 13.
	self assert: address streetNumber equals: 13.
	
	"Try to edit address to have a duplicate street name -- failure"
	address streetName: 'Schuzenmattstrasse'.
	self assert: address streetName equals: 'Langasse'.
	
	"Change city -- success"
	address city: 'Zurich'.
	self assert: address city equals: 'Zurich'.
	
	"Change country -- success"
	address country: 'Germany'.
	self assert: address country equals: 'Germany'.
	
	"Change postal code -- success"
	address postalCode: 3011.
	self assert: address postalCode equals: 3011.
	
	"Change street name -- success"
	address streetName: 'Schuzenmattstrasse'.
	self assert: address streetName equals: 'Schuzenmattstrasse'.
	
	"Try to edit address to have duplicate type -- failure"
	address type: 'Work'.
	self assert: address type equals: 'Home'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookEditCompany [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddCompanySuccess.
	contact := addressBook contacts at: 1.
	
	contact company: 'Bern City'.
	self assert: contact company equals: 'Bern City'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookEditEmail [
	<gtExample>
	| addressBook contact email |
	addressBook := self addressBookAddEmailSuccess.
	contact := addressBook contacts at: 1.
	email := contact email at: 1.
	
	email username: 'jdoe2'.
	
	self assert: email username equals: 'jdoe2'.
	self assert: email extension equals: 'com'.
	self assert: email website equals: 'gmail'.
	self assert: email type equals: 'Home'.
	
	contact addEmail: self emailBadAddress.
	self assert: contact email size equals: 2.
	
	"Try to edit email to have a duplicate address -- failure"
	email username: 'jdoe'.
	self assert: email username equals: 'jdoe2'.
	
	"Try to edit email to have duplicate type -- failure"
	email type: 'Work'.
	self assert: email type equals: 'Home'.
	
	"Try to edit email to have different extension and same username -- success"
	email extension: 'net'.
	email username: 'jdoe'.
	self assert: email username equals: 'jdoe'.
	self assert: email website equals: 'gmail'.
	self assert: email extension equals: 'net'.
	
	"Try to edit extension for duplicate -- failure"
	email extension: 'com'.
	self assert: email username equals: 'jdoe'.
	self assert: email website equals: 'gmail'.
	self assert: email extension equals: 'net'.
	
	"Try to edit email to have different website and same username -- success"
	email website: 'aol'.
	email extension: 'com'.
	self assert: email username equals: 'jdoe'.
	self assert: email website equals: 'aol'.
	self assert: email extension equals: 'com'.
	
	"Try to edit website for duplicate -- failure"
	email website: 'gmail'.
	self assert: email username equals: 'jdoe'.
	self assert: email website equals: 'aol'.
	self assert: email extension equals: 'com'.
			
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookEditNote [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNoteSuccess.
	contact := addressBook contacts at: 1.
	
	contact notes: 'mentor at Bern City'.
	self assert: contact notes equals: 'mentor at Bern City'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookEditPhone [
	<gtExample>
	| addressBook contact phone |
	addressBook := self addressBookAddPhoneSuccess.
	contact := addressBook contacts at: 1.
	phone := contact phoneNumber at: 1.
	
	phone number: 5552345678.
	
	self assert: phone number equals: 5552345678.
	self assert: phone countryCode equals: 1.
	self assert: phone type equals: 'Home'.
	
	contact addPhoneNumber: self phoneBadNumber.
	self assert: contact phoneNumber size equals: 2.
	
	"Try to edit phone number to have a duplicate number -- failure"
	phone number: 5551234567.
	self assert: phone number equals: 5552345678.
	
	"Try to edit phone number to have duplicate type -- failure"
	phone type: 'Work'.
	self assert: phone type equals: 'Home'.
			
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookFirstNameFailDuplicate [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := self johnDoe.
	
	addressBook addContact: contact.
	self assert: addressBook contacts size equals: 2.
	
	contact firstName: 'Jane'.
	self assert: addressBook contacts size equals: 2.
	self assert: contact firstName equals: 'John'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookFirstNameSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := self johnDoe.
	
	addressBook addContact: contact.
	self assert: addressBook contacts size equals: 2.
	
	contact firstName: 'Johnny'.
	self assert: addressBook contacts size equals: 2.
	self assert: contact firstName equals: 'Johnny'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookLastNameFailDuplicate [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := self janeSmith.
	
	addressBook addContact: contact.
	self assert: addressBook contacts size equals: 2.
	
	contact lastName: 'Doe'.
	self assert: addressBook contacts size equals: 2.
	self assert: contact lastName equals: 'Smith'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
AddressBook >> addressBookLastNameSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := self janeSmith.
	
	addressBook addContact: contact.
	self assert: addressBook contacts size equals: 2.
	
	contact lastName: 'Owens'.
	self assert: addressBook contacts size equals: 2.
	self assert: contact lastName equals: 'Owens'.
	
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeContacts [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddNewSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self johnSmith.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeDifferentAddress [
	<gtExample>
	| addressBook contact1 contact2 testContact merged|
	addressBook := self addressBookAddAddressSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addAddress: self addressBadAddress.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'address'.
	self assert: addressBook contacts size equals: 1.
	testContact := addressBook contacts at: 1.
	merged := testContact address at: 1.
	self assert: merged equals: self addressNew. 
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeDifferentEmail [
	<gtExample>
	| addressBook contact1 contact2 testContact merged|
	addressBook := self addressBookAddEmailSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addEmail: self emailBadAddress.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'email'.
	self assert: addressBook contacts size equals: 1.
	
	testContact := addressBook contacts at: 1.
	merged := testContact email at: 1.
	self assert: merged equals: self emailNew. 
	
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeDifferentFirstName [
	<gtExample>
	| addressBook contact1 contact2 testContact merged|
	addressBook := self addressBookAddNewSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self johnSmith.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'first name'.
	self assert: addressBook contacts size equals: 1.
	
	testContact := addressBook contacts at: 1.
	merged := testContact firstName.
	self assert: merged equals: 'Jane'. 
	
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeDifferentLastName [
	<gtExample>
	| addressBook contact1 contact2 testContact merged|
	addressBook := self addressBookAddNewSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self johnSmith.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'last name'.
	self assert: addressBook contacts size equals: 1.
	
	testContact := addressBook contacts at: 1.
	merged := testContact firstName.
	self assert: merged equals: 'Doe'. 
	
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeDifferentPhone [
	<gtExample>
	| addressBook contact1 contact2 testContact merged|
	addressBook := self addressBookAddPhoneSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addPhoneNumber: self phoneBadNumber.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'phone'.
	self assert: addressBook contacts size equals: 1.
	testContact := addressBook contacts at: 1.
	merged := testContact phoneNumber at: 1.
	self assert: merged equals: self phoneNew. 
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeSameAddress [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddAddressSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addAddress: self addressNew.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'address'.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeSameEmail [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddEmailSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addEmail: self emailNew.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'email'.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeSameFirstName [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddNewSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'firstName'.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeSameLastName [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddNewSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self johnDoe.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'last name'.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - MergeAddressBook' }
AddressBook >> addressBookMergeSamePhone [
	<gtExample>
	| addressBook contact1 contact2|
	addressBook := self addressBookAddPhoneSuccess.
	contact1 := addressBook contacts at: 1.
	contact2 := self janeSmith.
	contact2 addPhoneNumber: self phoneNew.
	
	addressBook addContact: contact2.
	self assert: addressBook contacts size equals: 2.
	
	addressBook merge: contact1 and: contact2 on: 'phone number'.
	self assert: addressBook contacts size equals: 1.
	^addressBook.
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveAddressFailure [
	<gtExample>
	| addressBook contact address |
	addressBook := self addressBookAddAddressSuccess.
	contact := addressBook contacts at: 1.
	address := self addressBadAddress.
	
	addressBook removeAddress: contact address: address.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveAddressSuccess [
	<gtExample>
	| addressBook contact address |
	addressBook := self addressBookAddAddressSuccess.
	contact := addressBook contacts at: 1.
	address := contact address at: 1.
	
	addressBook removeAddress: contact address: address.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact address isEmpty.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveCompany [
	<gtExample>
	| addressBook contact  |
	addressBook := self addressBookAddCompanySuccess.
	contact := addressBook contacts at: 1.
	addressBook removeCompany: contact.
	
	self assert: contact company equals: ''.
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveContactFailure [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := self johnDoe.
	
	addressBook removeContact: contact.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveContactSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNewSuccess.
	contact := addressBook contacts at: 1.
	
	addressBook removeContact: contact.
	
	self assert: addressBook contacts isEmpty.
	self assert: addressBook contacts size equals: 0.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveEmailFailure [
	<gtExample>
	| addressBook contact email |
	addressBook := self addressBookAddEmailSuccess.
	contact := addressBook contacts at: 1.
	email := self emailBadAddress.
	
	addressBook removeEmail: contact emailAddress: email.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact email isNotEmpty.
	self assert: contact email size equals: 1.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveEmailSuccess [
	<gtExample>
	| addressBook contact email |
	addressBook := self addressBookAddEmailSuccess.
	contact := addressBook contacts at: 1.
	email := contact email at: 1.
	
	addressBook removeEmail: contact emailAddress: email.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact email isEmpty.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemoveNote [
	<gtExample>
	| addressBook contact  |
	addressBook := self addressBookAddNoteSuccess.
	contact := addressBook contacts at: 1.
	addressBook removeNote: contact.
	
	self assert: contact notes equals: ''.
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemovePhoneFailure [
	<gtExample>
	| addressBook contact phone |
	addressBook := self addressBookAddPhoneSuccess.
	contact := addressBook contacts at: 1.
	phone := self phoneBadNumber.
	
	addressBook removePhone: contact phone: phone.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact phoneNumber isNotEmpty.
	
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
AddressBook >> addressBookRemovePhoneSuccess [
	<gtExample>
	| addressBook contact phone |
	addressBook := self addressBookAddPhoneSuccess.
	contact := addressBook contacts at: 1.
	phone := contact phoneNumber at: 1.
	
	addressBook removePhone: contact phone: phone.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 1.
	self assert: contact phoneNumber isEmpty.
	
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchAddressFail [
	<gtExample>
	| addressBook ret address |
	addressBook := self addressBookAddAddressSuccess.
	address := self addressBadAddress.
	ret := addressBook searchAddress: address.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchAddressSuccess [
	<gtExample>
	| addressBook ret address contact |
	addressBook := self addressBookAddAddressSuccess.
	contact := addressBook contacts at: 1.
	address := contact address at: 1.
	ret := addressBook searchAddress: address.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchCompanyFail [
	<gtExample>
	| addressBook ret company |
	addressBook := self addressBookAddCompanySuccess.
	company := 'Wells Fargo'.
	ret := addressBook searchCompany: company.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchCompanySuccess [
	<gtExample>
	| addressBook ret company |
	addressBook := self addressBookAddCompanySuccess.
	company := 'UniBe'.
	ret := addressBook searchCompany: company.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchEmailFail [
	<gtExample>
	| addressBook ret email |
	addressBook := self addressBookAddEmailSuccess.
	email := self emailBadAddress.
	ret := addressBook searchEmail: email.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchEmailSuccess [
	<gtExample>
	| addressBook ret email contact |
	addressBook := self addressBookAddEmailSuccess.
	contact := addressBook contacts at: 1.
	email := contact email at: 1.
	ret := addressBook searchEmail: email.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchFirstNameFail [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchFirstName: 'John'.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchFirstNameSuccess [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchFirstName: 'Jane'.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchLastNameFail [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchLastName: 'Smith'.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchLastNameSuccess [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchLastName: 'Doe'.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchPhoneFail [
	<gtExample>
	| addressBook ret phone |
	addressBook := self addressBookAddPhoneSuccess.
	phone := self phoneBadNumber.
	ret := addressBook searchPhone: phone.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
AddressBook >> addressBookSearchPhoneSuccess [
	<gtExample>
	| addressBook ret phone contact |
	addressBook := self addressBookAddPhoneSuccess.
	contact := addressBook contacts at: 1.
	phone := contact phoneNumber at: 1.
	ret := addressBook searchPhone: phone.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - contacts' }
AddressBook >> addressBookWithTwoContacts [
	<gtExample>
	| addressBook |
	addressBook := self emptyAddressBook.
	addressBook
		addContact: self janeDoe;
		addContact: self johnDoe.
	
	self assert: addressBook contacts isNotEmpty.
	self assert: addressBook contacts size equals: 2.
	^addressBook.
]

{ #category : #accessing }
AddressBook >> contacts [
	^ contacts
]

{ #category : #'instance creation examples' }
AddressBook >> emptyAddressBook [
	<gtExample>
	| addressBook |
	addressBook := AddressBook new.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^addressBook.
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
