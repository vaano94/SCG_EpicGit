"
I provide types for Email addresses.
"
Class {
	#name : #ABEmailType,
	#superclass : #Object,
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABEmailType class >> home [
 ^ 'Home'
]

{ #category : #instances }
ABEmailType class >> other [
 ^ 'Other'
]

{ #category : #instances }
ABEmailType class >> work [
 ^ 'Work'
]
