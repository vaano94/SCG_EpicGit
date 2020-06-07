Trait {
	#name : #BuilderStringForGtExample,
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
BuilderStringForGtExample >> generateString [
	^ self parameterValue classLabel , ' new ' , self parameterValue method selector.
]

{ #category : #'as yet unclassified' }
BuilderStringForGtExample >> generateStringSelf [
	^ 'self ' , self parameterValue method selector.
]
