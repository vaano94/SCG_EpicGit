"
!Epic

An epic is a feature or overarching objective. This is a fairly generalized feature within a system that meets user requirements to achieve business as usual. The epic will have a collection of ${class:name=EUseCase}$ that will help define behavior that needs to be available for users.
"
Class {
	#name : #EEpic,
	#superclass : #Object,
	#instVars : [
		'title',
		'use_cases'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
EEpic >> addUseCase: anUseCase [
	self use_cases add: anUseCase
]

{ #category : #ui }
EEpic >> gtDocumentFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new
		text:
			'An ${class:name=Epic}$ is a feature or overarching objective. This is a fairly generalized feature within a system that meets user requirements to achieve business as usual. The epic will have a collection of ${class:name=EUseCase}$ that will help define behavior that needs to be available for users.

Under Use Cases you can see a list of all ${class:name=EUseCase}$.
			
In progress report, you can see the progress of each ${class:name=EUseCase}$ that exists in this Epic.

Under Use Case Details, you will see all aspects of each of the ${class:name=EUseCase}$ in a detailed view, including the ${class:name=EActor}$.'.
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 1
]

{ #category : #ui }
EEpic >> gtEpicInfoFor: aView [
	<gtView>
	^ aView textEditor
	title: 'Information';
	priority: 0;
	text: [ 'Epic: ', title ]
]

{ #category : #ui }
EEpic >> gtUseCaseColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Use Cases';
		priority: 2;
		items: [ self use_cases ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ];
		column: 'Name' item: [ :anElement | anElement title ]
]

{ #category : #ui }
EEpic >> gtUseCaseDetailedColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Use Case Details';
		priority: 4;
		items: [ self use_cases ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 50;
		column: 'Name' item: [ :anElement | anElement title ];
		column: 'Task' item: [ :anElement | anElement task ]
]

{ #category : #ui }
EEpic >> gtUseCaseProgressColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Progress Report';
		priority: 3;
		items: [ self use_cases ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 50;
		column: 'Name' item: [ :anElement | anElement title ];
		column: 'Status' item: [ :anElement | anElement state ]
]

{ #category : #initialization }
EEpic >> initialize [
	super initialize.
	title := 'Feature of this epic'.
	use_cases := OrderedCollection new.
	
]

{ #category : #accessing }
EEpic >> title [
	^ title
]

{ #category : #accessing }
EEpic >> title: aString [
	title := aString
]

{ #category : #accessing }
EEpic >> use_cases [
	^ use_cases
]

{ #category : #accessing }
EEpic >> use_cases: anObject [
	use_cases := anObject
]
