"
!Epic Examples

This class holds example epics for the Address Book.
Each ${class:name=Epic}$ has ${class:name=EUseCase}$ that have ${class:name=EUserStory}$ that have ${class:name=EScenario}$ to serve as test cases.
"
Class {
	#name : #EpicExamples,
	#superclass : #Object,
	#category : #'Epic-AddressBook'
}

{ #category : #accessing }
EpicExamples >> addressBookAddAddressSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := ABContact janeDoeClass.
	addressBook
		addContact: contact.
	
	contact addAddress: (ABAddressExamples >> #emptyAddress) gtExample returnValue.
	
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
	epic addUseCase: self useCaseEditContact.
	epic addUseCase: self useCaseRemoveContact.
	^ epic 
]

{ #category : #'examples - epic' }
EpicExamples >> epicSearchAddressBook [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Search address book'.
	epic addUseCase: self useCaseSearchContact.
	epic addUseCase: self useCaseSearchWilhFilter.
	^ epic 
]

{ #category : #initialization }
EpicExamples >> initialize [
	super initialize.
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type address to a contact'.
	scenario exampleMethod: (ABContactExamples >> #addSameAddressTypes) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioAddEmailOnDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'add a duplicate type email to a contact'.
	scenario exampleMethod: (ABContactExamples >> #addSameMailTypes) gtExample.
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
EpicExamples >> scenarioEditAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the addresses in a contact'.
	scenario exampleMethod: (ABContactExamples >> #editAddress) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the company in a contact'.
	scenario exampleMethod: (ABContactExamples >> #editCompany) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the emails in a contact'.
	scenario exampleMethod: (ABContactExamples >> #editEmail) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Edit the note in a contact'.
	scenario exampleMethod: (ABContactExamples >> #editNote) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioEditPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'edit the phone numbers in a contact'.
	scenario exampleMethod: (ABContactExamples >> #editPhone) gtExample.
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
EpicExamples >> scenarioNewContact [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Add a new contact'.
	scenario exampleMethods: (Array 
		with: (ABAddressBookExamples >> #addressBookAddContact) gtExample
		with: (ABAddressBookExamples >> #addressBookAddTwoContactsWithSameName) gtExample
	).
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioRemoveContactFromAddressBook [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Remove a given contact'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #removeContact) gtExample 
		).
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchByAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by address'.
	scenario exampleMethods: (Array 
		with: (ABAddressBookExamples >> #exampleSearchAddressesWithOneContact) gtExample
		).
	scenario addParametrizedExample: (ABAddressBookExamples >> #exampleSearchAddressesWithOneContact) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchByCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a company'.
	scenario exampleMethods: (Array 
			with: (ABAddressBookExamples >> #exampleSearchCompanyWithOneContact) gtExample
			with: (ABAddressBookExamples >> #exampleSearchCompanyWithTwoContacts) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchByName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'search for a contact by a first name'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #exampleSearchNamesWithOneContact) gtExample 
			with: (ABAddressBookExamples >> #exampleSearchNamesWithTwoContacts) gtExample 
		).
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchByPhone [
	<gtExample>
	| scenario parametrizedExample|
	scenario := EScenario new.
	scenario description: 'search for a contact by phone'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #exampleSearchPhonesWithOneContact) gtExample 
			with: (ABAddressBookExamples >> #exampleSearchPhonesWithTwoContacts) gtExample 
		).
	parametrizedExample := EParametrizedExample new.
	parametrizedExample exampleMethod: ABAddressBookExamples >> #exampleAddContact:toAddressBook:.
	scenario addParametrizedExample: parametrizedExample.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioSearchByPhone: phone book: book [
	<gtExample>
	| scenario |
	scenario := EParametrizedExample new.
	scenario parametrizedExample: self class >> #scenarioSeachByPhone.
	^ scenario
]

{ #category : #'examples - scenario' }
EpicExamples >> scenarioUseDefinedFilter [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario description: 'Search for a contact with a defined filter'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #filterSearchByFilter) gtExample 
		).
	^ scenario
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseAddNewContact [
	<gtExample>
	| useCase actor|
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'Igor'.
	
	useCase 	title: 'Add a contact';
				task: 'Add a new contact to address book';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User presses the ""PLUS"" button near the search field. 3. User fills out all necessary details and clicks Save. 4. User acknowledges success. 5.End';
				userStories: (Array 
					with: self userStoryAddNewContact
					).
	
	self assert: useCase userStories  size equals: 1.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseEditContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Edit a contact'.
	useCase task: 'Edit a contact that exists in the address book'.
	self assert: useCase userStories size equals: 7.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseRemoveContact [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'Remove a contact'.
	useCase task: 'Remove a contact from the address book'.
	self assert: useCase userStories  size equals: 0.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseSearchContact [
	<gtExample>
	| useCase actor |
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'Jake'.
	useCase 	title: 'Search for a contact';
				task: 'Search for a new contact to address book';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User presses the ""PLUS"" button near the search field. 3. User fills out all necessary details and clicks Save. 4. User acknowledges success. 5.End';
				userStories: (Array 
					with: self userStorySearchByAddress
					with: self userStorySearchByCompany 
					with: self userStorySearchByName
					with: self userStorySearchByPhone).
	self assert: useCase userStories  size equals: 4.
	^ useCase
]

{ #category : #'examples - use case' }
EpicExamples >> useCaseSearchWilhFilter [
	<gtExample>
	| useCase |
	useCase := EUseCase new.
	useCase title: 'View a contact'.
	useCase task: 'Filter the search results for a contact in the address book'.
	self assert: useCase userStories  size equals: 0.
	^ useCase
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryAddNewContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'add a contact'.
	
	userStory addScenario: self scenarioNewContact.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStoryRemoveAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'remove a specific address of a specific contact'.
	userStory addScenario: self scenarioRemoveAddressSuccess.
	"userStory addScenario: self scenarioRemoveAddressFail."
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
	userStory addScenario: self scenarioSearchByAddress.
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by company'.
	userStory addScenario: self scenarioSearchByCompany.
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
EpicExamples >> userStorySearchByName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search user by his last or second name'.
	
	userStory addScenario: self scenarioSearchByName.
	
	^ userStory
]

{ #category : #'examples - user story' }
EpicExamples >> userStorySearchByPhone [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory action: 'search for a contact by phone number'.
	userStory addScenario: self scenarioSearchByPhone.
	^ userStory
]
