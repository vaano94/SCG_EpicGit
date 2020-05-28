Trait {
	#name : #TABCreateContactParametrizedExamples,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'examples - phone types' }
TABCreateContactParametrizedExamples >> companyPhoneType [
	<gtExample>
	<label: 'Company phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType company
]

{ #category : #'examples - parametrized' }
TABCreateContactParametrizedExamples >> exampleAddressStreet: aStreetName number: aNumber postalCode: aPostalCode city: aCity country: aCountry type: anAddressType [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new address'>
	<given: #'Street Name' ofType: #String in: '' elementType: #input>
	<given: #'Street Number' ofType: #String in: '' elementType: #input>
	<given: #'Postal Code' ofType: #String in: '' elementType: #input>
	<given: #'City' ofType: #String in: '' elementType: #input>
	<given: #'Country' ofType: #String in: '' elementType: #input>
	<given: #'Address Type' 
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
TABCreateContactParametrizedExamples >> exampleContactFirstName: aFirstName lastName: aLastName Addresses: contactAddressses emails: contactEmails phones: contactPhones description: contactDescription [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new contact'>
	<given: #'First Name' ofType: #String in: '' elementType: #input>
	<given: #'Last Name' ofType: #String in: '' elementType: #input>
	<given: #'Addresses' ofType: #ABAddress in: #self elementType: #multipleSearch>
	<given: #'Emails' ofType: #ABEmail in: #self elementType: #multipleSearch>
	<given: #'Phone numbers' ofType: #ABPhoneNumber in: #self elementType: #multipleSearch>
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
TABCreateContactParametrizedExamples >> exampleEmailUser: aUserName host: aHost extension: anExtension type: anEmailType [
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
TABCreateContactParametrizedExamples >> examplePhoneNumberCountryCode: aCountryCode number: aNumber type: aPhoneType [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a new Phone Number'>
	<given: #'Country Code' ofType: #String in: '' elementType: #input>
	<given: #'Number Code' ofType: #String in: '' elementType: #input>
	<given: #'Number Type' ofType: #ABPhoneType in: #self elementType: #dropdown>
	<return: #ABPhoneNumber>
	^ ABPhoneNumber new
		countryCode: aCountryCode;
		number: aNumber;
		type: aPhoneType
]

{ #category : #'examples - address type' }
TABCreateContactParametrizedExamples >> homeAddressType [
	<gtExample>
	<label: 'Home email Type'>
	<return: #ABAddressType>
	^ ABAddressType home
]

{ #category : #'examples - email types' }
TABCreateContactParametrizedExamples >> homeEmailType [
	<gtExample>
	<label: 'Home email Type'>
	<return: #ABEmailType>
	^ ABEmailType home
]

{ #category : #'examples - phone types' }
TABCreateContactParametrizedExamples >> homePhoneType [
	<gtExample>
	<label: 'Home phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType home
]

{ #category : #'examples - address type' }
TABCreateContactParametrizedExamples >> otherAddressType [
	<gtExample>
	<label: 'Other email Type'>
	<return: #ABAddressType>
	^ ABAddressType other
]

{ #category : #'examples - email types' }
TABCreateContactParametrizedExamples >> otherEmailType [
	<gtExample>
	<label: 'Other email Type'>
	<return: #ABEmailType>
	^ ABEmailType other
]

{ #category : #'examples - phone types' }
TABCreateContactParametrizedExamples >> pagerPhoneType [
	<gtExample>
	<label: 'Pager phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType pager
]

{ #category : #'examples - address type' }
TABCreateContactParametrizedExamples >> workAddressType [
	<gtExample>
	<label: 'Work email Type'>
	<return: #ABAddressType>
	^ ABAddressType work
]

{ #category : #'examples - email types' }
TABCreateContactParametrizedExamples >> workEmailType [
	<gtExample>
	<label: 'Work email Type'>
	<return: #ABEmailType>
	^ ABEmailType work
]

{ #category : #'examples - phone types' }
TABCreateContactParametrizedExamples >> workPhoneType [
	<gtExample>
	<label: 'Work phone Type'>
	<return: #ABPhoneType>
	^ ABPhoneType work
]
