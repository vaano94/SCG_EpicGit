Class {
	#name : #ABContactElement,
	#superclass : #BlElement,
	#instVars : [
		'contact'
	],
	#category : #'AddressBook-Elements'
}

{ #category : #factory }
ABContactElement >> buildAddressesElement [
	| addressesContainer |
	addressesContainer := self createGridContainerElement.
	
	self contact address do: [ :anAddresss |
		addressesContainer 
			addChild: (self createTypeElementFor: anAddresss typeName);
			addChild: (self createLabelFor: anAddresss toString) ].
	self addChild: addressesContainer
]

{ #category : #factory }
ABContactElement >> buildCategorySeparator [
	self addChild: (BlElement new
		background: Color veryLightGray;
		margin: (BlInsets top: 5 bottom: 5);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 1 ]).
	
]

{ #category : #factory }
ABContactElement >> buildEmailsElement [
	| emailsContainer |
	emailsContainer := self createGridContainerElement.

	self contact email do: [ :anEmail |
		emailsContainer 
			addChild: (self createTypeElementFor: anEmail typeName);
			addChild: (self createLabelFor: anEmail toString) ].
	self addChild: emailsContainer
]

{ #category : #factory }
ABContactElement >> buildHeaderElement [
	self addChild: (BrLabel new
		text: contact fullName;
		look: (BrLabelLook new
			fontSize: 24)).
	self addChild: (BlElement new
		background: Color veryLightGray;
		margin: (BlInsets top: 5 bottom: 15);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 2 ]).
	
]

{ #category : #factory }
ABContactElement >> buildPhonesElement [
	| phonesContainer |
	phonesContainer := self createGridContainerElement.

	self contact phoneNumber do: [ :aPhoneNumber |
		phonesContainer 
			addChild: (self createTypeElementFor: aPhoneNumber typeName);
			addChild: (self createLabelFor: aPhoneNumber toString) ].
	self addChild: phonesContainer
]

{ #category : #factory }
ABContactElement >> buildWidget [
	self buildHeaderElement.
	self buildPhonesElement.
	self buildCategorySeparator.
	self buildEmailsElement.
	self buildCategorySeparator.
	self buildAddressesElement.
]

{ #category : #accessing }
ABContactElement >> contact [
	^ contact
]

{ #category : #accessing }
ABContactElement >> contact: aContact [
	contact := aContact.
	self buildWidget.
]

{ #category : #factory }
ABContactElement >> createGridContainerElement [
	^  BlElement new
		layout: (BlGridLayout new cellSpacing: 5; columnCount: 2);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent. ]
]

{ #category : #factory }
ABContactElement >> createLabelFor: aString [
	^ BrLabel new
		text: aString;
		look: (BrLabelLook new
			fontSize: 14)
]

{ #category : #factory }
ABContactElement >> createTypeElementFor: aTypeName [
	^ BrLabel new
			constraintsDo: [ :c |
			c grid horizontal alignRight ];
		padding: (BlInsets left: 15  right: 15);
		text: aTypeName;
		look: (BrLabelLook new
			foreground: Color lightGray;
			fontSize: 14)
]

{ #category : #initialization }
ABContactElement >> initialize [
	super initialize.
	self
		layout: BlLinearLayout vertical;
		padding: (BlInsets top: 20 left: 25 bottom: 20 right: 20);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ].
]
