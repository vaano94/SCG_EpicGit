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

{ #category : #actions }
ABScenarioModelsBuilder >> createScenarioBuilderNamed: aScenarioName withTraits: selectedTraits [
	| className newClass classTraits |
	className := 'AB', (aScenarioName copyReplaceAll: ' ' with: ''), 'Examples'.
	(Smalltalk hasClassNamed: className) ifTrue: [ ^ self ].
	
	classTraits := TEParametrizedExamplesListExtension.
	selectedTraits do: [ :aTrait |  
		classTraits := classTraits + aTrait ].
	newClass := Object subclass: className
		uses: classTraits
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
				EScenarioBuilderCreationElement new 
					functionsTraits: { 
						TABAddContactsParametrizedExamples.
						TABCreateAddressBookParametrizedExamples.
						TABCreateContactParametrizedExamples };
					creationAction: [ :className :selectedTraits :creationElement |
							self announcer announce: Announcement.
							creationElement parent parent look hide.
							self createScenarioBuilderNamed: className withTraits: selectedTraits ];
					buildWidget ]  ]
]
