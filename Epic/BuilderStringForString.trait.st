Trait {
	#name : #BuilderStringForString,
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
BuilderStringForString >> generateString [
	^ self parameterValue printString.
]
