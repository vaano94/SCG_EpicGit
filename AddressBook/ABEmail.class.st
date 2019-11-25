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

{ #category : #accessing }
ABEmail >> extension [
	^ extension
]

{ #category : #accessing }
ABEmail >> extension: anExtension [
	extension := anExtension
]

{ #category : #'as yet unclassified' }
ABEmail >> fullEmail [
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
