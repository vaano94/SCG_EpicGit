Trait {
	#name : #BuilderStringForFile,
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
BuilderStringForFile >> generateString [
	^ self parameterValue pathString printString, ' asFileReference'.
]
