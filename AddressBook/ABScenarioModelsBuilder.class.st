Class {
	#name : #ABScenarioModelsBuilder,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #'AddressBook-Scenarios'
}

{ #category : #accessing }
ABScenarioModelsBuilder >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #actions }
ABScenarioModelsBuilder >> createScenarioBuilderNamed: aScenarioName [
	| className newClass |
	className := 'AB', (aScenarioName copyReplaceAll: ' ' with: ''), 'Examples'.
	(Smalltalk hasClassNamed: className) ifTrue: [ ^ self ].
	newClass := Object subclass: className
		uses: TABCreateAddressBookParametrizedExamples + TEParametrizedExamplesListExtension + TABAddContactsParametrizedExamples
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'AddressBook-Scenarios'.
	newClass classSide 
		compile:  'label
	^  ', aScenarioName printString
		classified: 'accessing'
]

{ #category : #'gt-extensions' }
ABScenarioModelsBuilder >> gtViewModelBuildersFor: aView [
	<gtView>
	^ aView list 
		title: 'Scenarios';
		items: [ TABCreateAddressBookParametrizedExamples users asArray ];
		itemFormat: #label;
		send: [ :aClass | aClass new ];
		updateWhen: Announcement in: [ self announcer ];
		action: [ :anAction | |dropdownAction|
			dropdownAction := anAction dropdown.
			dropdownAction
			icon: BrGlamorousIcons add;
			content: [ 
				| fieldsContainer container nameEditor |
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
				container := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [ :c |
						c padding: (BlInsets all: 5).
						c vertical exact: 100.
						c horizontal exact: 300 ].
				container addChild: fieldsContainer.
				container addChild: (BrButton new 
					look: BrGlamorousButtonWithLabelLook;
					label: 'Create';
					margin: (BlInsets top: 5 right: 2);
					constraintsDo: [ :c |
						c linear horizontal alignRight ];
					action: [ 
						| enteredText |
						enteredText := nameEditor editor text asString.
						enteredText ifNotEmpty: [ 
							self announcer announce: Announcement.
							container parent parent look hide.
							self createScenarioBuilderNamed: nameEditor editor text asString ] ] ) ]. ]
]
