Trait {
	#name : #BuilderStringForGtExampleArray,
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
BuilderStringForGtExampleArray >> generateString [
	|str|
	"^ self parameterValue classLabel , ' new ' , self parameterValue method selector."
	"(Array with: 'a' with: 'b' with: 'c') asOrderedCollection "
	
	self parameterValue isEmpty 
		ifTrue: [ str:= 'OrderedCollection new' ] 
		ifFalse: [ str:= '(Array ', String cr.
					self parameterValue do: [ :ex | str:= str, 'with: (', ex classLabel , ' new ' , ex method selector, ') ', String cr].
					str:= str, ')', ' asOrderedCollection' ].
	^ str.
]
