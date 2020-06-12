Class {
	#name : #EAgileEpicBoard,
	#superclass : #Object,
	#instVars : [
		'epics'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EAgileEpicBoard >> children [
	^ self epics
]

{ #category : #accessing }
EAgileEpicBoard >> epics [
	^ epics
]

{ #category : #accessing }
EAgileEpicBoard >> epics: anObject [
	epics := anObject
]

{ #category : #'as yet unclassified' }
EAgileEpicBoard >> gtTreeViewOn: aView [
	<gtView>

	(self epics isEmpty) ifTrue: [^ aView empty].
	^ aView columnedTree
		title: 'Epics' translated;
		items: [self children];
		children: [ :each | each children ];
		column: 'Type' format: [ :eachElement | eachElement treeViewShortString ].
]

{ #category : #initialization }
EAgileEpicBoard >> initialize [
	super initialize.
	epics := OrderedCollection new.
	
]
