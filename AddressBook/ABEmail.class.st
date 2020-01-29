"
I represent an email address
"
Class {
	#name : #ABEmail,
	#superclass : #Object,
	#instVars : [
		'username',
		'website',
		'extension',
		'type'
	],
	#category : #AddressBook
}

{ #category : #'examples - contacts' }
ABEmail >> emailBadAddress [
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
ABEmail >> emailBadType [
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
ABEmail >> emailNew [
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

{ #category : #accessing }
ABEmail >> extension [
	^ extension
]

{ #category : #accessing }
ABEmail >> extension: anExtension [
	extension := anExtension
]

{ #category : #accessing }
ABEmail >> toString [
	^ username, '@', website, '.', extension
]

{ #category : #accessing }
ABEmail >> type [
	^ type
]

{ #category : #accessing }
ABEmail >> type: aType [
	type := aType
]

{ #category : #accessing }
ABEmail >> username [
	^ username
]

{ #category : #accessing }
ABEmail >> username: aUsername [
	username := aUsername
]

{ #category : #accessing }
ABEmail >> website [
	^ website
]

{ #category : #accessing }
ABEmail >> website: aWebsite [
	website := aWebsite
]
