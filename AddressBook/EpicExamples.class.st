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

{ #category : #accessing }
EpicExamples >> addressBookAddAddressSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := ABContact janeDoe.
	addressBook
		addContact: contact.
	
	contact addAddress: ABAddress addressNew.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - epic' }
EpicExamples >> epicManageAddressBook [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Manage address book'.
	epic addUseCase: self useCaseAddNewContact.
"	epic addUseCase: self useCaseEditContact.
	epic addUseCase: self useCaseRemoveContact.
	epic addUseCase: self useCaseViewContact."
	^ epic 
]

{ #category : #'examples - epic' }
EpicExamples >> epicMergeContacts [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Merge contacts in address book'.
	epic addUseCase: self useCaseMergeExistingContacts.
	^ epic 
]

{ #category : #'examples - epic' }
EpicExamples >> epicSearchAddressBook [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Search address book'.
	epic addUseCase: self useCaseSearchContact.
	epic addUseCase: self useCaseViewResults.
	^ epic 
]

{ #category : #initialization }
EpicExamples >> initialize [
	super initialize.
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressFailDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate address to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddAddressFailAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressFailDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type address to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddAddressFailType) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new address to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddAddressSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioCompanySuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a company to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddCompanySuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the addresses in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookEditAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the company in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookEditCompany) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the emails in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookEditEmail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditFirstNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the first name in a contact to make a duplicate'.
	scenario exampleMethod: (EpicExamples >> #addressBookFirstNameFailDuplicate) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the first name in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookFirstNameSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditLastNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the last name in a contact to make a duplicate'.
	scenario exampleMethod: (EpicExamples >> #addressBookLastNameFailDuplicate) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the last name in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookLastNameSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the note in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookEditNote) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the phone numbers in a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookEditPhone) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailFailDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate address email to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddEmailFailAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailFailDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type email to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddEmailFailType) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new email to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddEmailSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new first name to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddContact) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new last name to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddLastNameSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeContacts [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Fully merge two contacts in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeContacts) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different addresses in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeDifferentAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different emails in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeDifferentEmail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentFirstName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different first names in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeDifferentFirstName) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentLastName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different last names in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeDifferentLastName) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeDifferentPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on different phone numbers in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeDifferentPhone) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same address in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeSameAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same email in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeSameEmail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameFirstName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same first name in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeSameFirstName) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSameLastName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same last name in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeSameLastName) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioMergeSamePhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Merge two contacts on same phone numbers in an address book'.
	scenario exampleMethod: (EpicExamples >> #addressBookMergeSamePhone) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNewContactFailure [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddNewFailure) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNewContactSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a new contact'.
	self flag: 'Fix this later'.
	scenario exampleMethod: (ABAddressBook >> #addressBookAddContact) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioNoteSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a note to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddNoteSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneFailNumber [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number duplicate to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddPhoneFailNumber) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneFailType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number duplicate type to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddPhoneFailType) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioPhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a phone number to a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookAddPhoneSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveAddressFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a non existing address'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveAddressFailure) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove an existing address'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveAddressSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove the company of a contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveCompany) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveContactFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveContactFailure) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveContactSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveContactSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveEmailFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing email from contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveEmailFailure) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove an email from contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveEmailSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a note from contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemoveNote) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemovePhoneFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove non existing phone from contact'.
	scenario exampleMethod: (EpicExamples >> #addressBookRemovePhoneFailure) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemovePhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'remove a phone from contact'.
	 scenario exampleMethod: (EpicExamples >> #addressBookRemovePhoneSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchAddressFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by address that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchAddressFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchAddressSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by address'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchAddressSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchCompanyFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a company that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchCompanyFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchCompanySuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a company'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchCompanySuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchEmailFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an email that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchEmailFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchEmailSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an email'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchEmailSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchFirstNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an first name that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchFirstNameFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchFirstNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a first name'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchFirstNameSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchLastNameFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by an last name that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchLastNameFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchLastNameSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a last name'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchLastNameSuccess) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchPhoneFail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a phone that doesnt exist'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchPhoneFail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchPhoneSuccess [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by phone'.
	scenario exampleMethod: (EpicExamples >> #addressBookSearchPhoneSuccess) gtExample.
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
	"useCase addUserStory: self userStoryNewPhoneToContact."
	"useCase addUserStory: self userStoryNewAddressToContact.
	useCase addUserStory: self userStoryNewEmailAddressToContact.
	useCase addUserStory: self userStoryNewFirstNameToContact.
	useCase addUserStory: self userStoryNewLastNameToContact.
	useCase addUserStory: self userStoryNewCompanyToContact.
	self assert: useCase user_stories  size equals: 7."
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
	userStory action: 'add a contact'.
	
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
