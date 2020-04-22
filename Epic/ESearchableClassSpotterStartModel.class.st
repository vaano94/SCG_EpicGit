Class {
	#name : #ESearchableClassSpotterStartModel,
	#superclass : #Object,
	#instVars : [
		'viewSelector',
		'objectGroup'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
ESearchableClassSpotterStartModel >> actOnExampleDeleted: child [
	^ nil
]

{ #category : #'gt-spotter' }
ESearchableClassSpotterStartModel >> gtSpotterForEmptyPlayBookFor: aStep [
	<gtSearch>
	aStep listProcessor
		title: 'Classes';
		allCandidates: [ self objectGroup ];
		itemName: [ :class | class ];
		previewElement: [ :anExample | 
			| returnValue viewToShow |
			"returnValue := anExample returnValue.
			viewToShow := (returnValue class canPerform: self viewSelector)
				ifTrue: [ viewToShow := self viewSelector ]
				ifFalse: [ viewToShow := #gtRawFor: ].
			(anExample returnValue
				perform: viewToShow
				with: GtPhlowEmptyView new)
				asElementDo: [ :anElement | anElement ]" ];
		filter: GTFilterSubstring
]

{ #category : #accessing }
ESearchableClassSpotterStartModel >> objectGroup [
	^ objectGroup
]

{ #category : #accessing }
ESearchableClassSpotterStartModel >> objectGroup: anObject [
	objectGroup := anObject
]

{ #category : #printing }
ESearchableClassSpotterStartModel >> printOn: aStream [
	aStream nextPutAll: 'Select class'
]

{ #category : #accessing }
ESearchableClassSpotterStartModel >> viewSelector [
	^ viewSelector
]

{ #category : #accessing }
ESearchableClassSpotterStartModel >> viewSelector: anObject [
	viewSelector := anObject
]
