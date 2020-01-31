Class {
	#name : #SearchService,
	#superclass : #Object,
	#instVars : [
		'addressBook',
		'filterList'
	],
	#category : #'AddressBook-Service'
}

{ #category : #accessing }
SearchService >> addressBook [
	^ addressBook
]

{ #category : #accessing }
SearchService >> addressBook: anObject [
	addressBook := anObject
]

{ #category : #'as yet unclassified' }
SearchService >> searchAddress: anAddress [
	^ true.
]

{ #category : #'as yet unclassified' }
SearchService >> searchCompany: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
SearchService >> searchEmail: anEmail [
	^ true.
]

{ #category : #'as yet unclassified' }
SearchService >> searchFirstName: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
SearchService >> searchIn: adBook withFilter: filter [
 	^nil.
]

{ #category : #'as yet unclassified' }
SearchService >> searchLastName: aString [
	^ true.
]

{ #category : #'as yet unclassified' }
SearchService >> searchPhone: aPhoneNumber [
	^ true.
]
