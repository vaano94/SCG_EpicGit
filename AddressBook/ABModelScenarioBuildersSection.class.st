Class {
	#name : #ABModelScenarioBuildersSection,
	#superclass : #GtHomeSection,
	#category : #'AddressBook-Scenarios'
}

{ #category : #'api - instantiation' }
ABModelScenarioBuildersSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Models').
	cardsContainer := self newCardsContainer.
	cardsContainer addChild: (self
		newShowCardWithTitle: 'Address Book'
		modelBuilder: 'The official webpage.'
		description: 'Address Book Model').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #'api - instantiation' }
ABModelScenarioBuildersSection >> newShowCardWithTitle: aTitle modelBuilder: haba description: aDescription [
	^ self
		newHeaderCardWithTitle: 'Model'
		description: aDescription
		size: 200 @ 80
		content:
			(BlElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				layout: BlLinearLayout vertical alignCenter;
				addChild:
					(BrLabel new
						text: aTitle;
						look: BrGlamorousLabelLook))
		action: [ :card | self
				showSpaceWithTitle: aTitle
				with: (GtInspector
					createOn: ABScenarioModelsBuilder new)
				from: card ]
]
