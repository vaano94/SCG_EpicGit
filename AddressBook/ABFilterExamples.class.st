Class {
	#name : #ABFilterExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleAllFilters [
	<gtExample>
	<label: 'Filter for everything'>
	<description: 'Filter with companies, names, phones'>
	^ ContactFilter new
		withCompanies;
		withNames;
		withPhones.
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterCompanies [
	<gtExample>
	<label: 'Filter for companies'>
	<description: 'Filter with companies'>
	^ ContactFilter new
		withCompanies
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterCompaniesAddresses [
	<gtExample>
	<label: 'Filter for companies and addresses'>
	<description: 'Filter with companies and addresses'>
	^ ContactFilter new
		withCompanies;
		withAddresses
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterNames [
	<gtExample>
	<label: 'Filter for names'>
	<description: 'Filter with names'>
	^ ContactFilter new withNames
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterNamesAddresses [
	<gtExample>
	<label: 'Filter for names and addresses'>
	<description: 'Filter with names and addresses'>
	^ ContactFilter new
		withNames;
		withAddresses
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterNamesPhones [
	<gtExample>
	<label: 'Filter for names and phones'>
	<description: 'Filter with names and phones'>
	^ ContactFilter new
		withNames;
		withPhones
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterPhones [
	<gtExample>
	<label: 'Filter for phones'>
	<description: 'Filter with phones'>
	^ ContactFilter new withPhones
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterPhonesAddresses [
	<gtExample>
	<label: 'Filter for phones and addresses'>
	<description: 'Filter with phones and addresses'>
	^ ContactFilter new
		withPhones;
		withAddresses
]

{ #category : #'as yet unclassified' }
ABFilterExamples >> exampleFilterPhonesCompanies [
	<gtExample>
	<label: 'Filter for phones and companies'>
	<description: 'Filter with phones and companies'>
	^ ContactFilter new withPhones; withCompanies 
]
