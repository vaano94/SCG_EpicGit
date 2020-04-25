Class {
	#name : #ABModelsBuilder,
	#superclass : #Object,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'as yet unclassified' }
ABModelsBuilder >> gtViewModelBuildersFor: aView [
	<gtView>
	^ aView list 
		title: 'Scenarios';
		items: [ TABAddressBookModelBuilder users asArray ];
		itemFormat: #label;
		send: [ :aClass | aClass new ];
		action: [ :anAction |  anAction dropdown 
			icon: BrGlamorousIcons add;
			content: [ 
				| container |
				container := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [ :c |
						c padding: (BlInsets all: 5).
						c vertical exact: 400.
						c horizontal exact: 400 ]]. ]
]
