Trait {
	#name : #TEParametrizedExamplesListExtension,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'as yet unclassified' }
TEParametrizedExamplesListExtension >> gtViewParametrizedExamplesSelectionFor: aView [
	<gtView>
	^ aView columnedList 	
		title: 'Parametrized examples';
		priority: 10;
		items: [ self gtParametrizedExamples collect: [ :anExample |
			EParametrizedExample new exampleMethod: anExample method ] ];
		"column: 'Model entity' item: [ :aParametrizeExample |
			 aParametrizeExample exampleMethod label ];"
		column: 'Label' item: [ :aParametrizeExample |
			 aParametrizeExample exampleMethod gtParametrizedExample label ];
		actionButtonIcon: BrGlamorousIcons add 
			action: [ :aButton | aButton phlow 
				spawnObject: EScenarioParametrizedExampleCreationHelper new ]
]

{ #category : #'gt-extensions' }
TEParametrizedExamplesListExtension >> gtViewServicesFor: aView [
	<gtView>
	^ aView list 	
		title: 'Services';
		priority: 50;
		items: [ self class traits ]
]
