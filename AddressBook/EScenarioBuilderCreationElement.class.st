Class {
	#name : #EScenarioBuilderCreationElement,
	#superclass : #BlElement,
	#instVars : [
		'creationAction',
		'functionsTraits',
		'selectedTraits'
	],
	#category : #'AddressBook-Scenarios'
}

{ #category : #initialization }
EScenarioBuilderCreationElement >> buildWidget [
	| fieldsContainer  nameEditor traitsList |
	self
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c padding: (BlInsets all: 5).
			c vertical fitContent.
			c horizontal exact: 400 ].
	fieldsContainer := BlElement new 
		margin: (BlInsets top: 5 right: 2);
		layout: (BlGridLayout new columnCount: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	nameEditor := self createEditor.
	fieldsContainer addChild: (self creatLabelWithText: 'Name: ').
	fieldsContainer addChild: nameEditor.
	
	traitsList := self createTraitsList.
	fieldsContainer addChild: (self creatLabelWithText: 'Functions: ').
	fieldsContainer addChild: traitsList.
	
	self addChild: fieldsContainer.
	self addChild: (self createSubmitButton 
		action: [ 
			| enteredText |
			enteredText := nameEditor editor text asString trimBoth.
			(enteredText isNotEmpty and: (selectedTraits isNotEmpty)) ifTrue: [ 
				creationAction 
					cull: enteredText 
					cull: selectedTraits
					cull: self ] ]). 
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> creatLabelWithText: aString [
	^ BrLabel new
		fitContent;
		margin: (BlInsets right: 10);
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize foreground: Color gray; fontSize: 12);
		focusability: BlFocusability none;
		constraintsDo: [ :c | 
			c grid horizontal alignLeft.
			c grid vertical alignCenter. ];
		text: aString
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> createEditor [
	^ BrEditor new
		look: BrGlamorousInputFieldSpacingLook + (BrGlamorousRegularEditorLook - BrLayoutResizerLook);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> createSubmitButton [
	^ BrButton new 
		look: BrGlamorousButtonWithLabelLook;
		label: 'Create';
		margin: (BlInsets top: 5 right: 2);
		constraintsDo: [ :c |
			c linear horizontal alignRight ]
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> createTraitsList [
	| aList |
	aList := BrSimpleList new.
	^ aList
		margin: (BlInsets top: 5 right: 2);
		padding: (BlInsets all: 2);
		border: (BlBorder paint: Color veryLightGray);
		hMatchParent;
		vFitContent;
		items: (functionsTraits ifNil: #());
		stencil: [ :aTrait :index | 
			| labelElement |
			labelElement := BrLabel new.
			labelElement
				look: BrGlamorousLabelLook new;
				padding: (BlInsets all: 4);
				margin: (BlInsets bottom: 2);
				text: aTrait name;
				vFitContent;
				hMatchParent;
				when: BlClickEvent
					do: [ :anEvent | 
					anEvent consumed: true.
					(selectedTraits includes: aTrait)
						ifTrue: [ selectedTraits remove: aTrait.
							labelElement background: Color white ]
						ifFalse: [ selectedTraits add: aTrait.
							labelElement background: (Color veryLightGray alpha: 0.5) ] ] ]
]

{ #category : #accessing }
EScenarioBuilderCreationElement >> creationAction: aBlock [
	creationAction := aBlock
]

{ #category : #accessing }
EScenarioBuilderCreationElement >> functionsTraits: anObject [
	functionsTraits := anObject
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> initialize [
	super initialize.
	selectedTraits := OrderedCollection new.
]
