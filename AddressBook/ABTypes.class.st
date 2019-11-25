"
I represent a type enum
"
Class {
	#name : #ABTypes,
	#superclass : #Object,
	#instVars : [
		'home',
		'work',
		'mobile'
	],
	#category : #AddressBook
}

{ #category : #accessing }
ABTypes >> home [
	^home
]

{ #category : #initialization }
ABTypes >> initialize [
	super initialize.
	home := 'Home'.
	work := 'Work'.
	mobile := 'Mobile'.
]

{ #category : #accessing }
ABTypes >> mobile [
	^mobile
]

{ #category : #accessing }
ABTypes >> work [
	^work
]
