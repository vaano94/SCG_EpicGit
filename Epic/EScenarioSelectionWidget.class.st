Class {
	#name : #EScenarioSelectionWidget,
	#superclass : #EScenarioInputWidget,
	#instVars : [
		'exampleList'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioSelectionWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
	| gtExamplesForClass methodDictionary |
	gtExamplesForClass := aWidget object gtExamples.
	methodDictionary := aParametrizedExample
		createMapFromCompiledMethodList: gtExamplesForClass.
	^  self new
			parameterIndex: anIndex;
			parameterName: aWidget parameterName;
			examples: methodDictionary values
]

{ #category : #accessing }
EScenarioSelectionWidget class >> widgetType [
	^ 'list'
]

{ #category : #initialization }
EScenarioSelectionWidget >> examples: aListOfExamples [
	exampleList display: aListOfExamples
]

{ #category : #initialization }
EScenarioSelectionWidget >> initialize [
	super initialize.
	exampleList := BrSimpleList new.
	exampleList
		stencil: [ :anExample :index | 
			BrLabel new
				text: anExample label asRopedText;
				look: BrLabelLook;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 6);
				when: BlClickEvent
					do: [ :anEvent | 
					anEvent consumed: true.
					exampleList selectOne: index ] ];
		fitContent;
		margin:
			(BlInsets
				left: 0;
				right: 0);
		border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5);
		geometry: (BlRectangle cornerRadius: 10).
	self addChild: exampleList
]

{ #category : #'grammar - Parameter' }
EScenarioSelectionWidget >> parameterValue [
	exampleList selectedItemDo: [ :selectedElement | ^ selectedElement ].
	^ nil
	
]
