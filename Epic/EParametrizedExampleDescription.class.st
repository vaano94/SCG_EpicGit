Class {
	#name : #EParametrizedExampleDescription,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'example',
		'providing',
		'when'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EParametrizedExampleDescription >> example [
	^ example
]

{ #category : #accessing }
EParametrizedExampleDescription >> example: anObject [
	example := anObject
]

{ #category : #accessing }
EParametrizedExampleDescription >> providing [
	^ providing
]

{ #category : #accessing }
EParametrizedExampleDescription >> providing: anObject [
	providing:= anObject
]

{ #category : #accessing }
EParametrizedExampleDescription >> scenario [
	^ scenario
]

{ #category : #accessing }
EParametrizedExampleDescription >> scenario: anObject [
	scenario := anObject
]

{ #category : #accessing }
EParametrizedExampleDescription >> when [
	^ when
]

{ #category : #accessing }
EParametrizedExampleDescription >> when: anObject [
	when := anObject
]
