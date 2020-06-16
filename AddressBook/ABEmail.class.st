"
I represent an email address
"
Class {
	#name : #ABEmail,
	#superclass : #Object,
	#instVars : [
		'username',
		'host',
		'extension',
		'type'
	],
	#category : #'AddressBook-Model'
}

{ #category : #tests }
ABEmail class >> testEmail [
	| email |
	email := ABEmail new.
	email 
		extension: 'ch';
		type: ABEmailType work;
		username: 'ivan.kravchenko';
		host: 'students.unibe'.
	^email.
]

{ #category : #'examples - contacts' }
ABEmail >> emailNew [
	<gtExample>
	| email |
	email := ABEmail testEmail.
	self assert:email host equals: 'gmail'.
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

{ #category : #'as yet unclassified' }
ABEmail >> googleEmail [
	<gtExample>
	| email |
	email := ABEmail new.
	email
		extension: 'com';
		username: 'mail';
		host: 'gmail';
		type: ABEmailType work.
	^ email
]

{ #category : #accessing }
ABEmail >> host [
	^ host
]

{ #category : #accessing }
ABEmail >> host: anObject [
	host := anObject
]

{ #category : #accessing }
ABEmail >> toString [
	^ username, '@', host, '.', extension
]

{ #category : #accessing }
ABEmail >> type [
	^ type name
]

{ #category : #accessing }
ABEmail >> type: aType [
	type := aType
]

{ #category : #accessing }
ABEmail >> typeName [ 
	^ type name
]

{ #category : #accessing }
ABEmail >> username [
	^ username
]

{ #category : #accessing }
ABEmail >> username: aUsername [
	username := aUsername
]
