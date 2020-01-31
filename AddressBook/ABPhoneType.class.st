"
I only return string instances of addresses types.
Available are company, home, mobile, other, pager, work
call me as 'ABAddressType home'
"
Class {
	#name : #ABPhoneType,
	#superclass : #Object,
	#category : #'AddressBook-Model'
}

{ #category : #instances }
ABPhoneType class >> company [
 ^ 'Company'
]

{ #category : #instances }
ABPhoneType class >> home [
 ^ 'Home'
]

{ #category : #instances }
ABPhoneType class >> mobile [
 ^ 'Mobile'
]

{ #category : #instances }
ABPhoneType class >> other [
 ^ 'Other'
]

{ #category : #instances }
ABPhoneType class >> pager [
 ^ 'Pager'
]

{ #category : #instances }
ABPhoneType class >> work [
 ^ 'Work'
]
