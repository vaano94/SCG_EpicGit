Class {
	#name : #ESearchableExamplesSpotterStartModel,
	#superclass : #Object,
	#instVars : [
		'viewSelector',
		'examplesGroup'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
ESearchableExamplesSpotterStartModel >> examplesGroup [
	^ examplesGroup
]

{ #category : #accessing }
ESearchableExamplesSpotterStartModel >> examplesGroup: anObject [
	examplesGroup := anObject
]

{ #category : #'gt-spotter' }
ESearchableExamplesSpotterStartModel >> gtSpotterForEmptyPlayBookFor: aStep [
	<gtSearch>
	aStep listProcessor
		title: 'Examples';
		allCandidates: [ self examplesGroup examples ];
		itemName: [ :exampleWithResult | exampleWithResult example label ];
		previewElement: [ :anExample | 
			| returnValue viewToShow |
			returnValue := anExample returnValue.
			viewToShow := (returnValue class canPerform: self viewSelector)
				ifTrue: [ viewToShow := self viewSelector ]
				ifFalse: [ viewToShow := #gtRawFor: ].
			(anExample returnValue
				perform: viewToShow
				with: GtPhlowEmptyView new)
				asElementDo: [ :anElement | anElement ] ];
		filter: GTFilterSubstring
]

{ #category : #printing }
ESearchableExamplesSpotterStartModel >> printOn: aStream [
	aStream nextPutAll: 'Select examples'
]

{ #category : #accessing }
ESearchableExamplesSpotterStartModel >> viewSelector [
	^ viewSelector
]

{ #category : #accessing }
ESearchableExamplesSpotterStartModel >> viewSelector: anObject [
	viewSelector := anObject
]
