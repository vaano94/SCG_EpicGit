Class {
	#name : #EScenarioSelectionDropdownWidget,
	#superclass : #EScenarioInputWidget,
	#traits : 'BuilderStringForGtExample + TypeFieldDependentChoice',
	#classTraits : 'BuilderStringForGtExample classTrait + TypeFieldDependentChoice classTrait',
	#instVars : [
		'exampleList',
		'toggleButton',
		'toggleButtonLabel',
		'initialButtonElement',
		'dropDownLook'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioSelectionDropdownWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
	| gtExamplesForClass methodDictionary |
	gtExamplesForClass:= self examplesForParametrizedExample: aParametrizedExample widgetModel: aWidget index: anIndex.
	methodDictionary := aParametrizedExample
		createMapFromCompiledMethodList: gtExamplesForClass.
	^ self new
		parameterIndex: anIndex;
		parameterName: aWidget parameterName;
		examples: methodDictionary values
]

{ #category : #accessing }
EScenarioSelectionDropdownWidget class >> widgetType [
	^ 'dropdown'
]

{ #category : #accessing }
EScenarioSelectionDropdownWidget >> exampleList [
	^ exampleList
]

{ #category : #initialization }
EScenarioSelectionDropdownWidget >> examples: aListOfExamples [
	exampleList items: aListOfExamples
]

{ #category : #examples }
EScenarioSelectionDropdownWidget >> initialize [
	| list |
	super initialize.
	list := self simpleListElement.
	initialButtonElement := self toggleButton
		look:
			BrGlamorousButtonWithLabelAndIconLook
				+
					(dropDownLook := BrGlamorousWithDropdownLook
						handle: [ self toggleButton
								look: BrGlamorousButtonWithLabelAndIconLook - BrGlamorousButtonExteriorLook;
								yourself ]
						content: [ list ]);
		margin: (BlInsets all: 8).
	self addChild: initialButtonElement
]

{ #category : #'grammar - Parameter' }
EScenarioSelectionDropdownWidget >> parameterValue [
	^ exampleList selectedIndices 
		ifEmpty: [ nil ]
		ifNotEmpty: [ :selectedIndexes | exampleList items at: selectedIndexes first ]. 
]

{ #category : #list }
EScenarioSelectionDropdownWidget >> simpleListElement [
	exampleList := BrSimpleList new.
	exampleList
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination builder return build;
				action: [ 
					initialButtonElement label: toggleButtonLabel.
					dropDownLook hide ]);
		stencil: [ :anExample :index | 
			BrLabel new
				text: anExample label asRopedText;
				look: BrLabelLook;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 6);
				when: BlClickEvent
					do:
						[ :anEvent | exampleList selectOne: index ] ];
		when: BrSelectionChanged
			do: [ :anEvent | 
			anEvent
				selectedDo: [ :anInterval | 
					| selectedExample |
					selectedExample := exampleList items at: anInterval first.
					toggleButtonLabel := selectedExample label ] ];
		fitContent;
		margin:
			(BlInsets
				left: 0;
				right: 0);
		border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5).
	^ exampleList
]

{ #category : #'instance creation' }
EScenarioSelectionDropdownWidget >> toggleButton [
	| buttonInstance |
	buttonInstance := BrButton new
		label:
			(initialButtonElement
				ifNotNil: [ initialButtonElement label ]
				ifNil: [ 'Choose an element' ]);
		icon:
			(BlElement new
				size: 10 @ 10;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((10 / 3) rounded @ 10)});
				background: Color lightGray;
				margin: (BlInsets left: 10);
				constraintsDo: [ :c | c linear vertical alignCenter ]).
	toggleButton := buttonInstance.
	^ buttonInstance
]

{ #category : #accessing }
EScenarioSelectionDropdownWidget >> toggleButtonLabel: anObject [
	^ toggleButtonLabel := anObject
]

{ #category : #accessing }
EScenarioSelectionDropdownWidget >> widgetType [
	^ 'dropdown'
]
