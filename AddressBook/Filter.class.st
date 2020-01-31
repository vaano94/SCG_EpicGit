Class {
	#name : #Filter,
	#superclass : #Object,
	#instVars : [
		'filters'
	],
	#category : #'AddressBook-Model'
}

{ #category : #accessing }
Filter >> filters [
	^ filters
]

{ #category : #accessing }
Filter >> filters: anObject [
	filters := anObject
]

{ #category : #initialization }
Filter >> initialize [ 
	filters := Set new.
]

{ #category : #accessing }
Filter >> withCompanies [
	 filters add: 'companies'
]

{ #category : #accessing }
Filter >> withNames [
	 filters add: 'names'
]

{ #category : #accessing }
Filter >> withPhones [
	 filters add: 'phones'
]

{ #category : #accessing }
Filter >> withoutCompanies [
	 filters remove: 'companies'
]

{ #category : #accessing }
Filter >> withoutNames [
	 filters remove: 'names'
]

{ #category : #accessing }
Filter >> withoutPhones [
	 filters remove: 'phones'
]
