"
!Epic Examples

This class holds example epics for the Address Book.
Each ${class:name=Epic}$ has ${class:name=EUseCase}$ that have ${class:name=EUserStory}$ that have ${class:name=EScenario}$ to serve as test cases.
"
Class {
	#name : #EpicExamples,
	#superclass : #Object,
	#category : #AddressBook
}

{ #category : #'examples - contacts' }
EpicExamples >> addressBadAddress [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 13;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001;
		type: 'Home'.
	self assert:address city equals: 'Bern'.
	^address.
]

{ #category : #'examples - contacts' }
EpicExamples >> addressBadType [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 14;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001;
		type: 'Work'.
	self assert:address city equals: 'Bern'.
	^address.
]

{ #category : #'examples - AddAddressBook' }
EpicExamples >> addressBookAddAddressFailAddress [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: self addressNew.
	contact addAddress: self addressBadAddress.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
EpicExamples >> addressBookAddAddressFailType [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := self janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: self addressNew.
	contact addAddress: self addressBadType.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - AddAddressBook' }
EpicExamples >> addressBookAddAddressSuccess [
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
EpicExamples >> addressBookAddCompanySuccess [
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
EpicExamples >> addressBookAddEmailFailAddress [
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
EpicExamples >> addressBookAddEmailFailType [
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
EpicExamples >> addressBookAddEmailSuccess [
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
EpicExamples >> addressBookAddFirstNameSuccess [
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
EpicExamples >> addressBookAddLastNameSuccess [
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
EpicExamples >> addressBookAddNewFailure [
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
EpicExamples >> addressBookAddNewSuccess [
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
EpicExamples >> addressBookAddNoteSuccess [
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
EpicExamples >> addressBookAddPhoneFailNumber [
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
EpicExamples >> addressBookAddPhoneFailType [
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
EpicExamples >> addressBookAddPhoneSuccess [
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
EpicExamples >> addressBookEditAddress [
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
EpicExamples >> addressBookEditCompany [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddCompanySuccess.
	contact := addressBook contacts at: 1.
	
	contact company: 'Bern City'.
	self assert: contact company equals: 'Bern City'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
EpicExamples >> addressBookEditEmail [
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
EpicExamples >> addressBookEditNote [
	<gtExample>
	| addressBook contact |
	addressBook := self addressBookAddNoteSuccess.
	contact := addressBook contacts at: 1.
	
	contact notes: 'mentor at Bern City'.
	self assert: contact notes equals: 'mentor at Bern City'.
	
	^addressBook.
]

{ #category : #'examples - EditAddressBook' }
EpicExamples >> addressBookEditPhone [
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
EpicExamples >> addressBookFirstNameFailDuplicate [
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
EpicExamples >> addressBookFirstNameSuccess [
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
EpicExamples >> addressBookLastNameFailDuplicate [
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
EpicExamples >> addressBookLastNameSuccess [
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
EpicExamples >> addressBookMergeContacts [
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
EpicExamples >> addressBookMergeDifferentAddress [
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
EpicExamples >> addressBookMergeDifferentEmail [
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
EpicExamples >> addressBookMergeDifferentFirstName [
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
EpicExamples >> addressBookMergeDifferentLastName [
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
EpicExamples >> addressBookMergeDifferentPhone [
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
EpicExamples >> addressBookMergeSameAddress [
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
EpicExamples >> addressBookMergeSameEmail [
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
EpicExamples >> addressBookMergeSameFirstName [
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
EpicExamples >> addressBookMergeSameLastName [
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
EpicExamples >> addressBookMergeSamePhone [
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
EpicExamples >> addressBookRemoveAddressFailure [
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
EpicExamples >> addressBookRemoveAddressSuccess [
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
EpicExamples >> addressBookRemoveCompany [
	<gtExample>
	| addressBook contact  |
	addressBook := self addressBookAddCompanySuccess.
	contact := addressBook contacts at: 1.
	addressBook removeCompany: contact.
	
	self assert: contact company equals: ''.
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
EpicExamples >> addressBookRemoveContactFailure [
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
EpicExamples >> addressBookRemoveContactSuccess [
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
EpicExamples >> addressBookRemoveEmailFailure [
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
EpicExamples >> addressBookRemoveEmailSuccess [
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
EpicExamples >> addressBookRemoveNote [
	<gtExample>
	| addressBook contact  |
	addressBook := self addressBookAddNoteSuccess.
	contact := addressBook contacts at: 1.
	addressBook removeNote: contact.
	
	self assert: contact notes equals: ''.
	^addressBook.
	
]

{ #category : #'examples - RemoveAddressBook' }
EpicExamples >> addressBookRemovePhoneFailure [
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
EpicExamples >> addressBookRemovePhoneSuccess [
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
EpicExamples >> addressBookSearchAddressFail [
	<gtExample>
	| addressBook ret address |
	addressBook := self addressBookAddAddressSuccess.
	address := self addressBadAddress.
	ret := addressBook searchAddress: address.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchAddressSuccess [
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
EpicExamples >> addressBookSearchCompanyFail [
	<gtExample>
	| addressBook ret company |
	addressBook := self addressBookAddCompanySuccess.
	company := 'Wells Fargo'.
	ret := addressBook searchCompany: company.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchCompanySuccess [
	<gtExample>
	| addressBook ret company |
	addressBook := self addressBookAddCompanySuccess.
	company := 'UniBe'.
	ret := addressBook searchCompany: company.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchEmailFail [
	<gtExample>
	| addressBook ret email |
	addressBook := self addressBookAddEmailSuccess.
	email := self emailBadAddress.
	ret := addressBook searchEmail: email.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchEmailSuccess [
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
EpicExamples >> addressBookSearchFirstNameFail [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchFirstName: 'John'.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchFirstNameSuccess [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchFirstName: 'Jane'.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchLastNameFail [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchLastName: 'Smith'.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchLastNameSuccess [
	<gtExample>
	| addressBook ret |
	addressBook := self addressBookAddNewSuccess.
	ret := addressBook searchLastName: 'Doe'.
	self assert: ret equals: true.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchPhoneFail [
	<gtExample>
	| addressBook ret phone |
	addressBook := self addressBookAddPhoneSuccess.
	phone := self phoneBadNumber.
	ret := addressBook searchPhone: phone.
	self assert: ret equals: false.
	^addressBook.
	
]

{ #category : #'examples - SearchAddressBook' }
EpicExamples >> addressBookSearchPhoneSuccess [
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
EpicExamples >> addressBookWithTwoContacts [
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

{ #category : #'examples - contacts' }
EpicExamples >> addressNew [
	<gtExample>
	| address |
	address := ABAddress new.
	address
		streetName: 'Schuzenmattstrasse';
		streetNumber: 14;
		city: 'Bern';
		country: 'Switzerland';
		postalCode: 3001;
		type: 'Home'.
	self assert:address city equals: 'Bern'.
	^address.
]

{ #category : #'examples - contacts' }
EpicExamples >> emailBadAddress [
	<gtExample>
	| email |
	email := ABEmail new.
	email 
		extension: 'com';
		type: 'Work';
		username: 'jdoe';
		website: 'gmail'.

	self assert:email website equals: 'gmail'.
	^email.
]

{ #category : #'examples - contacts' }
EpicExamples >> emailBadType [
	<gtExample>
	| email |
	email := ABEmail new.
	email 
		extension: 'com';
		type: 'Home';
		username: 'jdoe1';
		website: 'gmail'.

	self assert:email website equals: 'gmail'.
	^email.
]

{ #category : #'examples - contacts' }
EpicExamples >> emailNew [
	<gtExample>
	| email |
	email := ABEmail new.
	email 
		extension: 'com';
		type: 'Home';
		username: 'jdoe';
		website: 'gmail'.

	self assert:email website equals: 'gmail'.
	^email.
]

{ #category : #'examples - contacts' }
EpicExamples >> emptyAddressBook [
	<gtExample>
	| addressBook |
	addressBook := AddressBook new.
	self assert: addressBook contacts isNotNil.
	self assert: addressBook contacts isEmpty.
	^addressBook.
]

{ #category : #'examples - epic' }
EpicExamples >> epicManageAddressBook [
	<gtExample>
	| epic |
	epic := Epic new.
	epic title: 'Manage address book'.
	epic addUseCase: self useCaseAddNewContact.
	epic addUseCase: self useCaseEditContact.
	epic addUseCase: self useCaseRemoveContact.
	epic addUseCase: self useCaseViewContact.
	^ epic 
]

{ #category : #'examples - epic' }
EpicExamples >> epicMergeContacts [
	<gtExample>
	| epic |
	epic := Epic new.
	epic title: 'Merge contacts in address book'.
	epic addUseCase: self useCaseMergeExistingContacts.
	^ epic 
]

{ #category : #'examples - epic' }
EpicExamples >> epicSearchAddressBook [
	<gtExample>
	| epic |
	epic := Epic new.
	epic title: 'Search address book'.
	epic addUseCase: self useCaseSearchContact.
	epic addUseCase: self useCaseViewResults.
	^ epic 
]

{ #category : #initialization }
EpicExamples >> initialize [
	super initialize.
]

{ #category : #'examples - contacts' }
EpicExamples >> janeDoe [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Doe'.		
	^contact.
]

{ #category : #'examples - contacts' }
EpicExamples >> janeSmith [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'Jane'.
	contact lastName: 'Smith'.		
	^contact.
]

{ #category : #'examples - contacts' }
EpicExamples >> johnDoe [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Doe'.	
		
	^contact.
]

{ #category : #'examples - contacts' }
EpicExamples >> johnSmith [
	<gtExample>
	| contact |
	contact := ABContact new.
	contact firstName: 'John'.
	contact lastName: 'Smith'.	
		
	^contact.
]

{ #category : #'examples - contacts' }
EpicExamples >> phoneBadNumber [
	<gtExample>
	| phone |
	phone := ABPhoneNumber new.
	phone 
		countryCode: 1;
		number: 5551234567;
		type: 'Work'.

	self assert:phone countryCode equals: 1.
	^phone.
]

{ #category : #'examples - contacts' }
EpicExamples >> phoneBadType [
	<gtExample>
	| phone |
	phone := ABPhoneNumber new.
	phone 
		countryCode: 1;
		number: 5552345678;
		type: 'Home'.

	self assert:phone countryCode equals: 1.
	^phone.
]

{ #category : #'examples - contacts' }
EpicExamples >> phoneNew [
	<gtExample>
	| phone |
	phone := ABPhoneNumber new.
	phone 
		countryCode: 1;
		number: 5551234567;
		type: 'Home'.

	self assert:phone countryCode equals: 1.
	^phone.
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressFailDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate address to a contact'.
	scenario exampleMethod: self addressBookAddAddressFailAddress.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressFailDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type address to a contact'.
	scenario exampleMethod: self addressBookAddAddressFailType.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new address to a contact'.
	scenario exampleMethod: self addressBookAddAddressSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioCompanySuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a company to a contact'.
	scenario exampleMethod: self addressBookAddCompanySuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the addresses in a contact'.
	scenario exampleMethod: self addressBookEditAddress.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the company in a contact'.
	scenario exampleMethod: self addressBookEditCompany.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the emails in a contact'.
	scenario exampleMethod: self addressBookEditEmail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditFirstNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the first name in a contact to make a duplicate'.
	scenario exampleMethod: self addressBookFirstNameFailDuplicate.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the first name in a contact'.
	scenario exampleMethod: self addressBookFirstNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditLastNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the last name in a contact to make a duplicate'.
	scenario exampleMethod: self addressBookLastNameFailDuplicate.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the last name in a contact'.
	scenario exampleMethod: self addressBookLastNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the note in a contact'.
	scenario exampleMethod: self addressBookEditNote.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the phone numbers in a contact'.
	scenario exampleMethod: self addressBookEditPhone.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailFailDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate address email to a contact'.
	scenario exampleMethod: self addressBookAddEmailFailAddress.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailFailDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type email to a contact'.
	scenario exampleMethod: self addressBookAddEmailFailType.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new email to a contact'.
	scenario exampleMethod: self addressBookAddEmailSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new first name to a contact'.
	scenario exampleMethod: self addressBookAddFirstNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new last name to a contact'.
	scenario exampleMethod: self addressBookAddLastNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeContacts [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Fully merge two contacts in an address book'.
	scenario exampleMethod: self addressBookMergeContacts.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different addresses in an address book'.
	scenario exampleMethod: self addressBookMergeDifferentAddress.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different emails in an address book'.
	scenario exampleMethod: self addressBookMergeDifferentEmail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentFirstName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different first names in an address book'.
	scenario exampleMethod: self addressBookMergeDifferentFirstName.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentLastName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different last names in an address book'.
	scenario exampleMethod: self addressBookMergeDifferentLastName.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different phone numbers in an address book'.
	scenario exampleMethod: self addressBookMergeDifferentPhone.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same address in an address book'.
	scenario exampleMethod: self addressBookMergeSameAddress.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same email in an address book'.
	scenario exampleMethod: self addressBookMergeSameEmail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameFirstName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same first name in an address book'.
	scenario exampleMethod: self addressBookMergeSameFirstName.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameLastName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same last name in an address book'.
	scenario exampleMethod: self addressBookMergeSameLastName.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSamePhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same phone numbers in an address book'.
	scenario exampleMethod: self addressBookMergeSamePhone.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNewContactFailure [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate contact'.
	scenario exampleMethod: self addressBookAddNewFailure.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNewContactSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new contact'.
	scenario exampleMethod: self addressBookAddNewSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNoteSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a note to a contact'.
	scenario exampleMethod: self addressBookAddNoteSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneFailNumber [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number duplicate to a contact'.
	scenario exampleMethod: self addressBookAddPhoneFailNumber.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneFailType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number duplicate type to a contact'.
	scenario exampleMethod: self addressBookAddPhoneFailType.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number to a contact'.
	scenario exampleMethod: self addressBookAddPhoneSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveAddressFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a non existing address'.
	scenario exampleMethod: self addressBookRemoveAddressFailure.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove an existing address'.
	scenario exampleMethod: self addressBookRemoveAddressSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove the company of a contact'.
	scenario exampleMethod: self addressBookRemoveCompany.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveContactFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing contact'.
	scenario exampleMethod: self addressBookRemoveContactFailure.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveContactSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove contact'.
	scenario exampleMethod: self addressBookRemoveContactSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveEmailFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing email from contact'.
	scenario exampleMethod: self addressBookRemoveEmailFailure.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove an email from contact'.
	scenario exampleMethod: self addressBookRemoveEmailSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a note from contact'.
	scenario exampleMethod: self addressBookRemoveNote.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemovePhoneFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing phone from contact'.
	scenario exampleMethod: self addressBookRemovePhoneFailure.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemovePhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a phone from contact'.
	scenario exampleMethod: self addressBookRemovePhoneSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchAddressFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by address that doesnt exist'.
	scenario exampleMethod: self addressBookSearchAddressFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by address'.
	scenario exampleMethod: self addressBookSearchAddressSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchCompanyFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a company that doesnt exist'.
	scenario exampleMethod: self addressBookSearchCompanyFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchCompanySuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a company'.
	scenario exampleMethod: self addressBookSearchCompanySuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchEmailFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an email that doesnt exist'.
	scenario exampleMethod: self addressBookSearchEmailFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an email'.
	scenario exampleMethod: self addressBookSearchEmailSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchFirstNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an first name that doesnt exist'.
	scenario exampleMethod: self addressBookSearchFirstNameFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a first name'.
	scenario exampleMethod: self addressBookSearchFirstNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchLastNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an last name that doesnt exist'.
	scenario exampleMethod: self addressBookSearchLastNameFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a last name'.
	scenario exampleMethod: self addressBookSearchLastNameSuccess.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchPhoneFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a phone that doesnt exist'.
	scenario exampleMethod: self addressBookSearchPhoneFail.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchPhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by phone'.
	scenario exampleMethod: self addressBookSearchPhoneSuccess.
	^ scenario
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseAddNewContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Add a contact'.
	useCase task: 'Add a contact to the address book'.
	useCase addUserStory: self userStoryAddNewUser.
	useCase addUserStory: self userStoryNewPhoneToContact.
	useCase addUserStory: self userStoryNewAddressToContact.
	useCase addUserStory: self userStoryNewEmailAddressToContact.
	useCase addUserStory: self userStoryNewFirstNameToContact.
	useCase addUserStory: self userStoryNewLastNameToContact.
	useCase addUserStory: self userStoryNewCompanyToContact.
	self assert: useCase user_stories  size equals: 7.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseEditContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Edit a contact'.
	useCase task: 'Edit a contact that exists in the address book'.
	useCase addUserStory: self userStoryEditLastName.
	useCase addUserStory: self userStoryEditFirstName.
	useCase addUserStory: self userStoryEditPhone.
	useCase addUserStory: self userStoryEditAddress.
	useCase addUserStory: self userStoryEditEmail.
	useCase addUserStory: self userStoryEditNote.
	useCase addUserStory: self userStoryEditCompany.
	self assert: useCase user_stories size equals: 7.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseMergeExistingContacts [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Merge existing contacts'.
	useCase task: 'Merge two contacts that existing in the address book'.
	useCase addUserStory: self userStoryMergeFirstName.
	useCase addUserStory: self userStoryMergeLastName.
	useCase addUserStory: self userStoryMergePhoneNumber.
	useCase addUserStory: self userStoryMergeAddress.
	useCase addUserStory: self userStoryMergeEmail.
	useCase addUserStory: self userStoryMergeAll.
	self assert: useCase user_stories  size equals: 6.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseRemoveContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Remove a contact'.
	useCase task: 'Remove a contact from the address book'.
	useCase addUserStory: self userStoryRemoveContact.
	useCase addUserStory: self userStoryRemovePhone.
	useCase addUserStory: self userStoryRemoveAddress.
	useCase addUserStory: self userStoryRemoveEmail.
	useCase addUserStory: self userStoryRemoveNote.
	useCase addUserStory: self userStoryRemoveCompany.
	self assert: useCase user_stories  size equals: 6.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseSearchContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Search for a contact'.
	useCase task: 'Search for a contact in the address book'.
	useCase addUserStory: self userStorySearchByFirstName.
	useCase addUserStory: self userStorySearchByLastName.
	useCase addUserStory: self userStorySearchByPhone.
	useCase addUserStory: self userStorySearchByAddress.
	useCase addUserStory: self userStorySearchByEmailAddress.
	useCase addUserStory: self userStorySearchByCompany.
	self assert: useCase user_stories  size equals: 6.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseViewContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'View a contact'.
	useCase task: 'View a contact in the address book'.
	useCase addUserStory: self userStoryViewContact.
	useCase addUserStory: self userStoryViewContactPhoneNumbers.
	useCase addUserStory: self userStoryViewContactAddresses.
	useCase addUserStory: self userStoryViewContactEmailAddresses.
	useCase addUserStory: self userStoryViewContactNotes.
	useCase addUserStory: self userStoryViewContactCompany.
	self assert: useCase user_stories  size equals: 6.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseViewResults [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'View a contact'.
	useCase task: 'Filter the search results for a contact in the address book'.
	useCase addUserStory: self userStoryViewByFirstName.
	useCase addUserStory: self userStoryViewByLastName.
	useCase addUserStory: self userStoryViewByNote.
	useCase addUserStory: self userStoryViewByAddress.
	useCase addUserStory: self userStoryViewByEmailAddress.
	useCase addUserStory: self userStoryViewByCompany.
	self assert: useCase user_stories  size equals: 6.
	^ useCase
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryAddNewUser [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new user'.
	
	"userStory addScenario: self scenarioNewContactFailure."
	userStory addScenario: self scenarioNewContactSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the address of a specific contact'.
	"userStory addScenario: self scenarioEditAddress."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the company of a specific contact'.
	"userStory addScenario: self scenarioEditCompany."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditEmail [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the email address of a specific contact'.
	"userStory addScenario: self scenarioEditEmail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditFirstName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the first name of a specific contact'.
	
	"userStory addScenario: self scenarioEditFirstNameFail."
	userStory addScenario: self scenarioEditFirstNameSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditLastName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the last name of a specific contact'.
	
	userStory addScenario: self scenarioEditLastNameSuccess.
	"userStory addScenario: self scenarioEditLastNameFail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditNote [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the note of a specific contact'.
	"userStory addScenario: self scenarioEditNote."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryEditPhone [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'edit the phone numbers of a specific contact'.
	"userStory addScenario: self scenarioEditPhone."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergeAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on a specific address'.
	"userStory addScenario: self scenarioMergeAddress."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergeAll [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on all the same fields'.
	"userStory addScenario: self scenarioMergeContacts."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergeEmail [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on a specific email address'.
	"userStory addScenario: self scenarioMergeDifferentEmail."
	"userStory addScenario: self scenarioMergeSameEmail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergeFirstName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on first name'.
	"userStory addScenario: self scenarioMergeDifferentFirstName."
	"userStory addScenario: self scenarioMergeSameFirstName."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergeLastName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on last name'.
	"userStory addScenario: self scenarioMergeSameLastName."
	"userStory addScenario: self scenarioMergeDifferentLastName."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryMergePhoneNumber [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'merge contacts on a specific phone number'.
	"userStory addScenario: self scenarioMergeSamePhone."
	"userStory addScenario: self scenarioMergeDifferentPhone."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewAddressToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new address to a contact'.
	
	"userStory addScenario: self scenarioAddressFailDuplicateAddress.
	userStory addScenario: self scenarioAddressFailDuplicateType."
	userStory addScenario: self scenarioAddressSuccess.
	
	^ userStory 
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewCompanyToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a company to a contact'.
	
	userStory addScenario: self scenarioCompanySuccess.
	
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewEmailAddressToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new email address to a contact'.
	"userStory addScenario: self scenarioEmailFailDuplicateAddress.
	userStory addScenario: self scenarioEmailFailDuplicateType."
	userStory addScenario: self scenarioEmailSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewFirstNameToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new first name to a contact'.
	userStory addScenario: self scenarioFirstNameSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewLastNameToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new last name to a contact'.
	userStory addScenario: self scenarioLastNameSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryNewPhoneToContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a new phone number to a contact'.
	"userStory addScenario: self scenarioPhoneFailNumber.
	userStory addScenario: self scenarioPhoneFailType."
	userStory addScenario: self scenarioPhoneSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove a specific address of a specific contact'.
	"userStory addScenario: self scenarioRemoveAddressSuccess.
	userStory addScenario: self scenarioRemoveAddressFail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove the company of a specific contact'.
	userStory addScenario: self scenarioRemoveCompany.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove an entire contact'.
	"userStory addScenario: self scenarioRemoveContactSuccess.
	userStory addScenario: self scenarioRemoveContactFail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveEmail [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove a specific email address of a specific contact'.
	"userStory addScenario: self scenarioRemoveEmailSuccess.
	userStory addScenario: self scenarioRemoveEmailFail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveNote [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove a note of a specific contact'.
	userStory addScenario: self scenarioRemoveNote.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemovePhone [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove a specific phone number of a specific contact'.
	"userStory addScenario: self scenarioRemovePhoneSuccess.
	userStory addScenario: self scenarioRemovePhoneFail."
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by address'.
	"userStory addScenario: self scenarioSearchAddressFail."
	userStory addScenario: self scenarioSearchAddressSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by company'.
	"userStory addScenario: self scenarioSearchCompanyFail."
	userStory addScenario: self scenarioSearchCompanySuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByEmailAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by email address'.
	"userStory addScenario: self scenarioSearchEmailFail."
	userStory addScenario: self scenarioSearchEmailSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByFirstName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by first name'.
	"userStory addScenario: self scenarioSearchFirstNameFail."
	userStory addScenario: self scenarioSearchFirstNameSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByLastName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by last name'.
	"userStory addScenario: self scenarioSearchLastNameFail."
	userStory addScenario: self scenarioSearchLastNameSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByPhone [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by phone number'.
	"userStory addScenario: self scenarioSearchPhoneFail."
	userStory addScenario: self scenarioSearchPhoneSuccess.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by address'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by company'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByEmailAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by email address'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByFirstName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by first name'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByLastName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by last name'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewByNote [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view search results for a contact by notes'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contact listing'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContactAddresses [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contacts addresses'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContactCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contacts company'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContactEmailAddresses [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contacts email addresses'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContactNotes [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contacts notes'.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryViewContactPhoneNumbers [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'view a contacts phone numbers'.
	^ userStory
]
