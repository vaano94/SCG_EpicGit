"
!Epic

An epic is a feature or overarching objective. This is a fairly generalized feature within a system that meets user requirements to achieve business as usual. The epic will have a collection of ${class:name=EUseCase}$ that will help define behavior that needs to be available for users.
"
Class {
	#name : #Epic,
	#superclass : #Object,
	#instVars : [
		'title',
		'use_cases'
	],
	#category : #Epic
}

{ #category : #adding }
Epic >> addUseCase: anUseCase [
	self use_cases add: anUseCase
]

{ #category : #'as yet unclassified' }
Epic >> gtDocumentFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new
		text:
			'In progress report, you can see the progress of each ${class:name=EUseCase}$ that exists in this Epic.

Under Use Cases you can see a list of all ${class:name=EUseCase}$.

Under Use Case Details, you will see all aspects of each of the ${class:name=EUseCase}$ in a detailed view, including the ${class:name=EActor}$.'.
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 1
]

{ #category : #'as yet unclassified' }
Epic >> gtEpicInfoFor: aView [
	<gtView>
	^ aView textEditor
	title: 'Information';
	priority: 0;
	text: [ 'Epic: ', title ]
]

{ #category : #'as yet unclassified' }
Epic >> gtUseCaseColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Use Cases';
		priority: 2;
		items: [ self use_cases ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ];
		column: 'Name' item: [ :anElement | anElement title ]
]

{ #category : #'as yet unclassified' }
Epic >> gtUseCaseDetailedColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Use Case Details';
		priority: 4;
		items: [ self use_cases ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 50;
		column: 'Name' item: [ :anElement | anElement title ];
		column: 'Task' item: [ :anElement | anElement task ]
]

{ #category : #'as yet unclassified' }
Epic >> gtUseCaseProgressColumnsFor: aView [
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
Epic >> initialize [
	super initialize.
	title := 'Feature of this epic'.
	use_cases := OrderedCollection new.
	
]

{ #category : #accessing }
Epic >> title [
	^ title
]

{ #category : #accessing }
Epic >> title: aString [
	title := aString
]

{ #category : #accessing }
Epic >> use_cases [
	^ use_cases
]

{ #category : #accessing }
Epic >> use_cases: anObject [
	use_cases := anObject
]
