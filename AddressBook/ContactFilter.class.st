Class {
	#name : #ContactFilter,
	#superclass : #Object,
	#instVars : [
		'filters'
	],
	#category : #'AddressBook-Model'
}

{ #category : #accessing }
ContactFilter >> filters [
	^ filters
]

{ #category : #accessing }
ContactFilter >> filters: anObject [
	filters := anObject
]

{ #category : #initialization }
ContactFilter >> initialize [ 
	filters := Set new.
]

{ #category : #accessing }
ContactFilter >> withAddresses [
	 filters add: 'Addresses'
]

{ #category : #accessing }
ContactFilter >> withCompanies [
	 filters add: 'Companies'
]

{ #category : #accessing }
ContactFilter >> withNames [
	 filters add: 'Names'
]

{ #category : #accessing }
ContactFilter >> withPhones [
	 filters add: 'Phones'
]

{ #category : #accessing }
ContactFilter >> withoutAddresses [
	 filters remove: 'Addresses'
]

{ #category : #accessing }
ContactFilter >> withoutCompanies [
	 filters remove: 'Companies'
]

{ #category : #accessing }
ContactFilter >> withoutNames [
	 filters remove: 'Names'
]

{ #category : #accessing }
ContactFilter >> withoutPhones [
	 filters remove: 'Phones'
]
