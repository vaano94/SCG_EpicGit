Class {
	#name : #EParametrizedExampleEditViewSelectionSpotterWidget,
	#superclass : #BlElement,
	#instVars : [
		'exampleContainer',
		'spotterDropDownLook',
		'examplesGroup',
		'selectedClass',
		'defaultValue'
	],
	#category : #'Epic-Model'
}

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> actOnClassSelected: aClass [
	selectedClass := aClass.
	exampleContainer removeChildren.
	exampleContainer
	  addChild: (self createLabelForClass: aClass).
	spotterDropDownLook hide.
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> createLabelForClass: class [ 
	^ BrLabel new
		text: class;
		margin: (BlInsets right: 4);
		padding: (BlInsets all: 2);
		geometry: (BlRectangle cornerRadius: 4);
		background: (Color fromHexString: 'eaeaea');
		look: BrGlamorousLabelLook new glamorousRegularFontAndSize;
		constraintsDo: [ :c | c linear vertical alignCenter ]
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> createSearchIcon [
	^ BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons search asElement;
		label: 'Search'
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> createSearchIconButtonWithNoExteriorLook [
	^ BrButton new
												look: BrGlamorousButtonWithIconLook - BrGlamorousButtonExteriorLook;
												icon: BrGlamorousIcons search asElement
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> createSpotterDropdown [
	^ self createSearchIcon
		look:
			BrGlamorousButtonWithIconLook
				+
					(spotterDropDownLook := BrGlamorousWithDropdownLook
						stencil: [ | model spotterElement |
							model := GtSpotter new initializeWith: self spotterStartModel.
							model announcer
								when: GtSpotterActOn
								do: [ :anEvent | 
									self actOnClassSelected: anEvent realItem.
									anEvent actedUpon: true ].
							model announcer
								when: GtSpotterExitAnnouncement
								do: [ :e | spotterDropDownLook hide ].
							spotterElement := GtSpotterElement new
								spotterModel: model;
								size: 500 @ 500.
							BlElement new
								look:
									(BrGlamorousDropdownLook new
										handle: self createSearchIconButtonWithNoExteriorLook;
										content: spotterElement);
								background: BrGlamorousColors secondaryHeaderBackgroundColor ])
]

{ #category : #accessing }
EParametrizedExampleEditViewSelectionSpotterWidget >> defaultValue: anObject [
		selectedClass := anObject.
		exampleContainer removeChildren.
		exampleContainer
			addChild: (self createLabelForClass: anObject).
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> initialize [
	| container |
	super initialize.
	self
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 1);
		geometry: (BlRectangle cornerRadius: 7);
		padding:
			(BlInsets
				top: 5
				left: 3
				bottom: 5
				right: 3);
		background: Color white;
		layout: (BlLinearLayout horizontal cellSpacing: 6);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c minWidth: 100. ].
	exampleContainer := BlElement new
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal fitContent.
			c minWidth: 100. ].
	container addChild: exampleContainer.
	container addChild: self createSpotterDropdown.
	self addChild: container
]

{ #category : #'grammar - Parameter' }
EParametrizedExampleEditViewSelectionSpotterWidget >> parameterValue [
	^ selectedClass
]

{ #category : #examples }
EParametrizedExampleEditViewSelectionSpotterWidget >> spotterStartModel [
	^ (ESearchableClassSpotterStartModel new
			"viewSelector: #gtViewSpotterPreview:;"
			objectGroup: Smalltalk globals allClasses)
]
