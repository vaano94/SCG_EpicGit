Class {
	#name : #EScenarioBuilderCreationElement,
	#superclass : #BlElement,
	#instVars : [
		'creationAction'
	],
	#category : #'AddressBook-Scenarios'
}

{ #category : #accessing }
EScenarioBuilderCreationElement >> creationAction: aBlock [
	creationAction := aBlock
]

{ #category : #initialization }
EScenarioBuilderCreationElement >> initialize [
	| fieldsContainer  nameEditor |
	super initialize.
	self
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c padding: (BlInsets all: 5).
			c vertical exact: 100.
			c horizontal exact: 300 ].
	fieldsContainer := BlElement new 
		margin: (BlInsets top: 5 right: 2);
		layout: (BlGridLayout new columnCount: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	nameEditor := BrEditor new
		look: BrGlamorousInputFieldSpacingLook + (BrGlamorousRegularEditorLook - BrLayoutResizerLook);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ].
	fieldsContainer addChild: (BrLabel new
		fitContent;
		margin: (BlInsets right: 10);
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize foreground: Color gray; fontSize: 12);
		focusability: BlFocusability none;
		constraintsDo: [ :c | 
			c grid horizontal alignLeft.
			c grid vertical alignCenter. ];
		text: 'Name: ').
	fieldsContainer addChild: nameEditor.
	
	self addChild: fieldsContainer.
	self addChild: (BrButton new 
		look: BrGlamorousButtonWithLabelLook;
		label: 'Create';
		margin: (BlInsets top: 5 right: 2);
		constraintsDo: [ :c |
			c linear horizontal alignRight ];
		action: [ 
			| enteredText |
			enteredText := nameEditor editor text asString trimBoth.
			enteredText ifNotEmpty: [ 
				creationAction cull: enteredText cull: self ] ] ) 
]
