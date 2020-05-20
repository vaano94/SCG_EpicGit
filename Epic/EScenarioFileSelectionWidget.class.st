Class {
	#name : #EScenarioFileSelectionWidget,
	#superclass : #EScenarioInputWidget,
	#instVars : [
		'inputWidget',
		'pathEditor',
		'fileReference'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioFileSelectionWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
	^ self new
			parameterIndex: anIndex;
			parameterName: aWidget parameterName
]

{ #category : #accessing }
EScenarioFileSelectionWidget class >> widgetType [
	^ 'FileInput'
]

{ #category : #'as yet unclassified' }
EScenarioFileSelectionWidget >> actOnSelectFile [
	|reference|
	reference:= UIManager default
		chooseExistingFileReference: ''
		extensions: nil
		path: FileSystem workingDirectory.
	reference ifNotNil: [ 
		| stringPath |
		fileReference:= reference.
		stringPath:= reference fullName.
		pathEditor editor text: stringPath asRopedText.
			]
			ifNil: [ 
		pathEditor editor text: ''.		
		].
]

{ #category : #examples }
EScenarioFileSelectionWidget >> createSearchButton [
	^ ((BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons file asElement;
		label: 'Open file')
		look:
			BrGlamorousButtonWithIconLook)
]

{ #category : #examples }
EScenarioFileSelectionWidget >> createSearchIcon [
	^ BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons file asElement;
		label: 'Open file'
]

{ #category : #'as yet unclassified' }
EScenarioFileSelectionWidget >> getSelectedFileReference [
	^ UIManager default
		chooseExistingFileReference: ''
		extensions: nil
		path: FileSystem workingDirectory
]

{ #category : #initialization }
EScenarioFileSelectionWidget >> initialize [
	| editorLook interactiveLook searchButton|
	super initialize.
	editorLook := BrGlamorousRegularEditorLook new fontSize: 15.
	pathEditor := BrEditor new
		text: '';
		look:
			editorLook;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		geometry: (BlRectangle cornerRadius: 10);
			hMatchParent;
		vExact: 40;
			constraintsDo: [ :c | 
			c minWidth: 100.
			c padding: (BlInsets all: 10).
			c linear horizontal alignLeft.
			c vertical matchParent.
			c linear weight: 0.3 ].
	pathEditor
		in: [ :e | 
			e editor
				when: BrTextEditorInsertedEvent
				do: [" self inform: 'Target ' , e editor text "] ].
	self addChild: pathEditor.
	searchButton:= self createSearchButton.
	searchButton action: [ self inform: 'Clicked file button.'. self actOnSelectFile ].
	self addChild: searchButton.
]

{ #category : #'grammar - Parameter' }
EScenarioFileSelectionWidget >> parameterValue [
	^ pathEditor editor text asString asFileReference
]
