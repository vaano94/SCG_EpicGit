Trait {
	#name : #TABAddressBookParametrizedExamples,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'examples - phone types' }
TABAddressBookParametrizedExamples >> companyPhoneType [
	<gtExample>
	<label: 'Company phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType company
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> exampleAddContacts: aCollectionOfContacts toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Add contacts to an address book.'>
	<given: #'Contacts' ofType: #ABContact in: #self elementType: #multipleSearch>
	<given: #'Address book' ofType: #ABAddressBook in: #self elementType: #list>
	<return: #ABAddressBook>
	
	aCollectionOfContacts do: [ : aContact | 
		anAddressBook addContact: aContact ].
	^ anAddressBook
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> exampleAddressBookLabeled: aLabel withContacts: aCollectionOfContacts [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create address book.'>
	<given: #'Label' ofType: #String in: '' elementType: #input>
	<given: #'Contacts' ofType: #ABContact in: #self elementType: #multipleSearch>
	<return: #ABAddressBook>
	| addressBook |
	addressBook := ABAddressBook new.
	aCollectionOfContacts do: [ : aContact | 
		addressBook addContact: aContact ].
	^ addressBook
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> exampleAddressStreet: aStreetName number: aNumber postalCode: aPostalCode city: aCity country: aCountry type: anAddressType [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new address'>
	<given: #'Street Name' ofType: #String in: '' elementType: #input>
	<given: #'Street Number' ofType: #String in: '' elementType: #input>
	<given: #'Postal Code' ofType: #String in: '' elementType: #input>
	<given: #'City' ofType: #String in: '' elementType: #input>
	<given: #'Country' ofType: #String in: '' elementType: #input>
	<given: #'Adddress Type' 
		ofType: #ABAddressType 
		in: #self 
		elementType: #list>
	<return: #ABAddress>
	^ ABAddress new
		streetName: aStreetName;
		streetNumber: aNumber;
		city: aCity;
		country: aCountry;
		postalCode: aPostalCode;
		type: anAddressType
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> exampleContactFirstName: aFirstName lastName: aLastName Addresses: contactAddressses emails: contactEmails phones: contactPhones description: contactDescription [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new contact'>
	<given: #'First Name' ofType: #String in: '' elementType: #input>
	<given: #'Last Name' ofType: #String in: '' elementType: #input>
	<given: #'Addresses' ofType: #ABAddress in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #'Emails' ofType: #ABEmail in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #'Phone nummbers' ofType: #ABPhoneNumber in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #'Description' ofType: #String in: '' elementType: #input>
	<return: #ABContact>
	| contact |
	
	contact := ABContact new
		firstName: aFirstName;
		lastName: aLastName;
		addAddresses: contactAddressses;
		addEmails: contactEmails;
		addPhoneNumbers: contactPhones.
		
	^ contact
	
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> exampleEmailUser: aUserName host: aHost extension: anExtension type: anEmailType [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new email'>
	<given: #'User' ofType: #String in: '' elementType: #input>
	<given: #'Host' ofType: #String in: '' elementType: #input>
	<given: #'Extension' ofType: #String in: '' elementType: #input>
	<given: #'Email Type' 
		ofType: #ABEmailType 
		in: #self 
		elementType: #list>
	<return: #ABEmail>
	^ ABEmail new 
		extension: anExtension;
		type: anEmailType;
		username: aUserName;
		host: aHost
]

{ #category : #'examples - parametrized' }
TABAddressBookParametrizedExamples >> examplePhoneNumberCountryCode: aCountryCode number: aNumber type: aPhoneType [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new Phone Number'>
	<given: #'Country Code' ofType: #String in: '' elementType: #input>
	<given: #'Number Code' ofType: #String in: '' elementType: #input>
	<given: #'Number Type' ofType: #ABPhoneType in: #self elementType: #list>
	<return: #ABPhoneNumber>
	^ ABPhoneNumber new
		countryCode: aCountryCode;
		number: aNumber;
		type: aPhoneType
]

{ #category : #'examples - address type' }
TABAddressBookParametrizedExamples >> homeAddressType [
	<gtExample>
	<label: 'Home email Type'>
	<return: #ABAddressType>
	^ ABAddressType home
]

{ #category : #'examples - email types' }
TABAddressBookParametrizedExamples >> homeEmailType [
	<gtExample>
	<label: 'Home email Type'>
	<return: #ABEmailType>
	^ ABEmailType home
]

{ #category : #'examples - phone types' }
TABAddressBookParametrizedExamples >> homePhoneType [
	<gtExample>
	<label: 'Home phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType home
]

{ #category : #'examples - address type' }
TABAddressBookParametrizedExamples >> otherAddressType [
	<gtExample>
	<label: 'Other email Type'>
	<return: #ABAddressType>
	^ ABAddressType other
]

{ #category : #'examples - email types' }
TABAddressBookParametrizedExamples >> otherEmailType [
	<gtExample>
	<label: 'Other email Type'>
	<return: #ABEmailType>
	^ ABEmailType other
]

{ #category : #'examples - phone types' }
TABAddressBookParametrizedExamples >> pagerPhoneType [
	<gtExample>
	<label: 'Pager phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType pager
]

{ #category : #'examples - address type' }
TABAddressBookParametrizedExamples >> workAddressType [
	<gtExample>
	<label: 'Work email Type'>
	<return: #ABAddressType>
	^ ABAddressType work
]

{ #category : #'examples - email types' }
TABAddressBookParametrizedExamples >> workEmailType [
	<gtExample>
	<label: 'Work email Type'>
	<return: #ABEmailType>
	^ ABEmailType work
]

{ #category : #'examples - phone types' }
TABAddressBookParametrizedExamples >> workPhoneType [
	<gtExample>
	<label: 'Work phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType work
]
