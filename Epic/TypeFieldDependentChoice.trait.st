Trait {
	#name : #TypeFieldDependentChoice,
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
TypeFieldDependentChoice classSide >> examplesForParametrizedExample: aParametrizedExample widgetModel: aWidget index: anIndex [
	| gtExamplesForClass methodDictionary widgetPragma returnClassString |
	gtExamplesForClass:= OrderedCollection new.
	widgetPragma := (aParametrizedExample exampleMethod pragmas
		select: [ :p | p selector == #given:ofType:in:elementType: ])
		at: anIndex.
	returnClassString:= widgetPragma argumentNamed: #ofType.
	returnClassString = ''
		ifTrue: [ gtExamplesForClass := aWidget object gtExamples ]
		ifFalse: [ | collection |
			collection := OrderedCollection new.
			aWidget object gtExamples
				do: [ :example | 
					| innerReturnPragmas |
					innerReturnPragmas := example method pragmas
						select: [ :p | p selector = #return: ].
					innerReturnPragmas
						do: [ :prag | 
							(prag arguments at: 1) = returnClassString
								ifTrue: [ collection add: example ] ] ].
			gtExamplesForClass := collection ].
	^ gtExamplesForClass
]

{ #category : #'as yet unclassified' }
TypeFieldDependentChoice >> examplesForParametrizedExample: aParametrizedExample widgetModel: aWidget index: anIndex [
	| gtExamplesForClass methodDictionary widgetPragma returnClassString |
	gtExamplesForClass:= OrderedCollection new.
	widgetPragma := (aParametrizedExample exampleMethod pragmas
		select: [ :p | p selector == #given:ofType:in:elementType: ])
		at: anIndex.
	returnClassString:= widgetPragma argumentNamed: #ofType.
	returnClassString = ''
		ifTrue: [ gtExamplesForClass := aWidget object gtExamples ]
		ifFalse: [ | collection |
			collection := OrderedCollection new.
			TABCreateContactParametrizedExamples gtExamples
				do: [ :example | 
					| innerReturnPragmas |
					innerReturnPragmas := example method pragmas
						select: [ :p | p selector = #return: ].
					innerReturnPragmas
						do: [ :prag | 
							(prag arguments at: 1) = returnClassString
								ifTrue: [ collection add: example ] ] ].
			gtExamplesForClass := collection ].
	^ gtExamplesForClass
]
