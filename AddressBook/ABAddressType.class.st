"
I only return string instances of addresses types.
Available are home, other, work
call me as 'ABAddressType home'
"
Class {
	#name : #ABAddressType,
	#superclass : #Object,
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABAddressType class >> home [
 ^ 'Home'
]

{ #category : #instances }
ABAddressType class >> other [
 ^ 'Other'
]

{ #category : #instances }
ABAddressType class >> work [
 ^ 'Work'
]
