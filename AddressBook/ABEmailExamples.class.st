Class {
	#name : #ABEmailExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
ABEmailExamples >> exampleGoogleEmail [
	<gtExample>
	<label: 'Google email'>
	| email |
	email := ABEmail new googleEmail.
	^ email
]

{ #category : #'as yet unclassified' }
ABEmailExamples >> exampleListMultipleEmail: email1 and: email2 [
	<gtExample>
	<gtParametrizedExample>
	<given: #email1 ofType: #ABEmail in: #ABEmailExamples elementType: #list>
	<given: #email2 ofType: #ABEmail in: #ABEmailExamples elementType: #search>
	<return: #ABEmail>
	email1 toString.
	email2 toString.
	^ email1
]
