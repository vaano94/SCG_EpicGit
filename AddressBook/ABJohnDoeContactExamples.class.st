Class {
	#name : #ABJohnDoeContactExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #'examples - addresses' }
ABJohnDoeContactExamples >> homeAddress [
	<gtExample>
	<label: 'Home Address'>
	<return: #ABAddress>
	^ ABAddress new
		streetName: 'rue Pierre De Coubertin';
		streetNumber: 75;
		city: 'Toulouse';
		country: 'France';
		postalCode: '31400';
		type: ABAddressType home
]

{ #category : #'examples - emails' }
ABJohnDoeContactExamples >> homeEmail [
	<gtExample>
	<label: 'Home Email'>
	<return: #ABEmail>
	^ ABEmail new 
		extension: 'com';
		type: ABEmailType home;
		username: 'john.doe';
		host: 'gmail'
]

{ #category : #'examples - phones' }
ABJohnDoeContactExamples >> homePhone [
	<gtExample>
	<label: 'Home phone'>
	<return: #ABPhoneNumber>
	^ ABPhoneNumber new
		countryCode: 33;
		number: 772625532;
		type: ABPhoneType home
]

{ #category : #'example - parametrized' }
ABJohnDoeContactExamples >> johnDoeContactWithAddresses: contactAddressses emails: contactEmails phones: contactPhones description: contactDescription [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create a contact with the given addresses, emails, phones and description'>
	<given: #contactAddressses ofType: #ABAddress in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #contactEmails ofType: #ABEmail in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #contactPhones ofType: #ABPhoneNumber in: #ABJohnDoeContactExamples elementType: #multipleSearch>
	<given: #contactDescription ofType: #String in: #input>
	<return: #ABContact>
	| contact |
	
	contact := ABContact new
		firstName: 'John';
		lastName: 'Doe';
		addAddresses: contactAddressses;
		addEmails: contactEmails;
		addPhoneNumbers: contactPhones.
		
	^ contact
	
]

{ #category : #'examples - emails' }
ABJohnDoeContactExamples >> otherEmail [
	<gtExample>
	<label: 'Other Email'>
	<return: #ABEmail>
	^ ABEmail new 
		extension: 'com';
		type: ABEmailType home;
		username: 'john862';
		host: 'yahooo'
]

{ #category : #'examples - phones' }
ABJohnDoeContactExamples >> otherPhone [
	<gtExample>
	<label: 'Other phone'>
	<return: #ABPhoneNumber>
	^ ABPhoneNumber new
		countryCode: 33;
		number: 76242623;
		type: ABPhoneType home
]

{ #category : #'examples - addresses' }
ABJohnDoeContactExamples >> workAddress [
	<gtExample>
	<label: 'Work Address'>
	<return: #ABAddress>
	^ ABAddress new
		streetName: 'rue Pierre Motte';
		streetNumber: 38;
		city: 'SAINT-DIÉ';
		country: 'France';
		postalCode: '88100';
		type: ABAddressType work
]

{ #category : #'examples - emails' }
ABJohnDoeContactExamples >> workEmail [
	<gtExample>
	<label: 'Work Email'>
	<return: #ABEmail>
	^ ABEmail new 
		extension: 'com';
		type: ABEmailType work;
		username: 'john.doe';
		host: 'company'
]

{ #category : #'examples - phones' }
ABJohnDoeContactExamples >> workPhone [
	<gtExample>
	<label: 'Work phone'>
	<return: #ABPhoneNumber>
	^ ABPhoneNumber new
		countryCode: 33;
		number: 75142315234;
		type: ABPhoneType work
]
