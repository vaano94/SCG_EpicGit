Class {
	#name : #ABMyContactsAddressBookExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> aubreyVerreauContact [
	<gtExample>
	<label: 'Aubrey Verreau contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Aubrey';
		lastName: 'Verreau';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 962534223;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'rue Pierre De Coubertin';
			streetNumber: 75;
			city: 'Toulouse';
			country: 'France';
			postalCode: '31400';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType other;
			username: 'john.doe';
			host: 'hotmail');
		description: 'Aubrey Verreau is a 28-year-old teacher who enjoys upcycling, listening to the radio and running.'.

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> augusteVarieurContact [
	<gtExample>
	<label: 'Auguste Varieur contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Auguste';
		lastName: 'Varieur';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 962534223;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'rue Petite Fusterie';
			streetNumber: 19;
			city: 'Lille';
			country: 'France';
			postalCode: '38300';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType other;
			username: 'Auguste.Varieur';
			host: 'yahoo').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> berangariaMartinContact [
	<gtExample>
	<label: 'Berangaria Martin contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Berangaria';
		lastName: 'Martin';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 75142315234;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'rue Pierre Motte';
			streetNumber: 38;
			city: 'SAINT-DIÉ';
			country: 'France';
			postalCode: '88100';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType work;
			username: 'Berangaria.Martin1';
			host: 'gmail').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> edLeonardoContact [
	<gtExample>
	<label: 'Ed Leonardo contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Ed';
		lastName: 'Leonardo';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 1;
			number: 7076232302;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'Marietta Street';
			streetNumber: 24;
			city: 'Los Angeles';
			country: 'USA';
			postalCode: '90017';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'us';
			type: ABEmailType work;
			username: 'EdLeonardo';
			host: 'teleworm').

	^ contact
]

{ #category : #'examples - addressbook' }
ABMyContactsAddressBookExamples >> emptyAddressBook [
	<gtExample>
	<label: 'Empty Address Book'>
	<return: #ABAddressBook>
	| addressBook |
	addressBook := ABAddressBook new
		label: 'My Contacts'.
	
	self assert: addressBook contacts size equals: 0.
	
	^ addressBook
]

{ #category : #search }
ABMyContactsAddressBookExamples >> exampleAddContact: aContact toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Add a given contact to an address book'>
	<given: #aContact ofType: #ABContact in: #ABMyContactsAddressBookExamples elementType: #search>
	<given: #anAddressBook ofType: #ABAddressBook in: #ABMyContactsAddressBookExamples elementType: #list>
	<return: #ABAddressBook>
	
	anAddressBook addContact: aContact.
	^ anAddressBook
]

{ #category : #search }
ABMyContactsAddressBookExamples >> exampleAddContacts: aCollectionOfContacts toAddressBook: anAddressBook [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Add the given contacts to an address book'>
	<given: #contacts ofType: #ABContact in: #ABMyContactsAddressBookExamples elementType: #multipleSearch>
	<given: #addressBook ofType: #ABAddressBook in: #ABMyContactsAddressBookExamples elementType: #list>
	<return: #ABAddressBook>
	
	aCollectionOfContacts do: [ : aContact | 
		anAddressBook addContact: aContact ].
	^ anAddressBook
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> fayeTurgeonContact [
	<gtExample>
	<label: 'Faye Turgeon contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Faye';
		lastName: 'Turgeon';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 726252654;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'rue de la République';
			streetNumber: 60;
			city: 'Lyon';
			country: 'France';
			postalCode: '69003';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType work;
			username: 'Faye.Turgeon';
			host: 'gmail').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> frontinoCharpentierContact [
	<gtExample>
	<label: 'Frontino Charpentier contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Frontino';
		lastName: 'Charpentier';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 765414451;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'Boulevard de la Liberation';
			streetNumber: 40;
			city: 'Marseille';
			country: 'France';
			postalCode: '13011';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'Frontino.Char84';
			host: 'gmail').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> georgeSaucierContact [
	<gtExample>
	<label: 'George Saucier contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'George';
		lastName: 'Saucier';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 1;
			number: 5623727231;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'Reynolds Alley';
			streetNumber: 3654;
			city: 'Anaheim';
			country: 'USA';
			postalCode: '92801';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'George1221';
			host: 'dayrep.').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> hollyMossContact [
	<gtExample>
	<label: 'Holly Moss contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Holly';
		lastName: 'Moss';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 1;
			number: 6626451735;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'Rafe Lane';
			streetNumber: 537;
			city: 'Jackson';
			country: 'USA';
			postalCode: '39201';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'us';
			type: ABEmailType work;
			username: 'HollyMoss';
			host: 'gmail').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> janeDoeContact [
	<gtExample>
	<label: 'Jane Doe contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Jane';
		lastName: 'Doe';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 41;
			number: 7625243;
			type: ABPhoneType work);
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 49;
			number: 7336252625;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'Mulhedorfstrasse';
			streetNumber: 17;
			city: 'Bern';
			country: 'Switzerland';
			postalCode: '3008';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'jane.doe';
			host: 'gmail');
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType work;
			username: 'jane';
			host: 'jane.doe');
		description: 'I am contact are used when the true a person is unknown or is being intentionally concealed.'.

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> johnDoeContact [
	<gtExample>
	<label: 'John Doe contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'John';
		lastName: 'Doe';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 41;
			number: 785242652;
			type: ABPhoneType work);
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 41;
			number: 72225223;
			type: ABPhoneType home);
		addAddress: (ABAddress new
			streetName: 'Mulhedorfstrasse';
			streetNumber: 17;
			city: 'Bern';
			country: 'Switzerland';
			postalCode: '3008';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'john.doe';
			host: 'gmail');
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType work;
			username: 'john';
			host: 'john.doe');
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType other;
			username: 'john.doe';
			host: 'hotmail');
		description: 'I am contact are used when the true a person is unknown or is being intentionally concealed.'.

	^ contact
]

{ #category : #'examples - addressbook' }
ABMyContactsAddressBookExamples >> myContactssAddressBook [
	<gtExample>
	<label: 'My Contacts Address Book'>
	<return: #ABAddressBook>
	| addressBook |
	addressBook := ABAddressBook new
		label: 'Cartoons'.
	addressBook addContact: self aubreyVerreauContact.
	addressBook addContact: self berangariaMartinContact.
	addressBook addContact: self edLeonardoContact.
	addressBook addContact: self frontinoCharpentierContact.
	addressBook addContact: self georgeSaucierContact.
	addressBook addContact: self hollyMossContact.
	addressBook addContact: self janeDoeContact.
	addressBook addContact: self johnDoeContact.
	
	self assert: addressBook contacts size equals: 8.
	
	^ addressBook
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> phillippNeustadtContact [
	<gtExample>
	<label: 'Phillipp Neustadt contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Phillipp';
		lastName: 'Neustadt';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 49;
			number: 76543243;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'Eichendorffstr.';
			streetNumber: 80;
			city: 'Munich';
			country: 'Germany';
			postalCode: '72116';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'neustadt.phil';
			host: 'gmail').

	^ contact
]

{ #category : #'examples - contacts' }
ABMyContactsAddressBookExamples >> voletaLeBatelierContact [
	<gtExample>
	<label: 'Voleta LeBatelier contact'>
	<return: #ABContact>
	| contact |
	contact := ABContact new 
		firstName: 'Voleta';
		lastName: 'LeBatelier';
		addPhoneNumber: (ABPhoneNumber new
			countryCode: 33;
			number: 72624254;
			type: ABPhoneType work);
		addAddress: (ABAddress new
			streetName: 'rue Pierre De Coubertin';
			streetNumber: 58;
			city: 'Tolouse';
			country: 'France';
			postalCode: '31000';
			type: ABAddressType work);
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType work;
			username: 'Voleta.LeBatelier';
			host: 'company');
		addEmail: (ABEmail new 
			extension: 'com';
			type: ABEmailType home;
			username: 'batelier.volt';
			host: 'gmail').

	^ contact
]
