Class {
	#name : #EEditableExample,
	#superclass : #Object,
	#instVars : [
		'searchService',
		'searchElement',
		'announcer'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EEditableExample >> announcer [
	^ announcer
]

{ #category : #accessing }
EEditableExample >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
EEditableExample >> gtViewEditFor: aView [
	<gtView>
	| selectorElement |
	selectorElement := EEditAndSearchElement new.
	^ aView explicit
		title: 'Edit and Search';
		stencil: [ selectorElement ]
]

{ #category : #initialization }
EEditableExample >> initialize [
	| createdAnnouncer |
	super initialize.
	createdAnnouncer := Announcer new.
	self announcer: createdAnnouncer.
	self announcer
		when: ESearchFieldChangedAnnouncement
		send: #searchEmail
		to: self.
	self announcer
		when: ESearchFieldChangedAnnouncement
		send: #printShit
		to: self
]

{ #category : #initialization }
EEditableExample >> initializeForSearchElement: aSearchElement [
	self searchElement: aSearchElement.
	aSearchElement announcer: self announcer.
	^ self
]

{ #category : #printing }
EEditableExample >> printShit [
	Transcript show: 'woow'.
	^ nil
]

{ #category : #'as yet unclassified' }
EEditableExample >> searchCompany: userInput [
	| searchS |
	searchS := self searchService.
	^ searchS searchCompany: userInput
]

{ #category : #accessing }
EEditableExample >> searchElement [
	^ searchElement
]

{ #category : #accessing }
EEditableExample >> searchElement: anObject [
	searchElement := anObject
]

{ #category : #'as yet unclassified' }
EEditableExample >> searchEmail [
	| suggestedResult userInp |
	userInp := self searchElement searchValue.
	Transcript show: userInp.
	suggestedResult := self searchService searchEmail: userInp.
	^ suggestedResult
]

{ #category : #'as yet unclassified' }
EEditableExample >> searchExample: word withinClass: className for: instance [
	| list gatheredExamples searchPredicate |
	list := OrderedCollection new.
	searchPredicate := [ :gtExample | gtExample selector includesSubstring: word asLowercase ].
	gatheredExamples := OrderedCollection new.
	className asClass methodDict
		do: [ :method | 
			| gtExample |
			gtExample := method gtExample.
			gtExample
				ifNotNil: [ | pragmaList containsPragmaAndClass |
					pragmaList := gtExample method pragmas.
					containsPragmaAndClass := pragmaList
						contains: [ :pragmaValue | 
							pragmaValue selector = 'return:'
								and: [ pragmaValue arguments size > 0
										and: [ (pragmaValue arguments at: 1) = instance ] ] ].
					"self halt."
					containsPragmaAndClass
						ifTrue: [ | containsWord |
"							self halt."
							containsWord := searchPredicate value: gtExample.
							containsWord
								ifTrue: [ gatheredExamples add: gtExample ] ] ] ].
	^ gatheredExamples
]

{ #category : #accessing }
EEditableExample >> searchService [
	^ searchService
]

{ #category : #accessing }
EEditableExample >> searchService: anObject [
	searchService := anObject
]
