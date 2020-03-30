Class {
	#name : #EEditAndSearchElement,
	#superclass : #BlElement,
	#instVars : [
		'searchValue',
		'announcer',
		'anotherValue',
		'editor'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
EEditAndSearchElement >> addMainSearchLabel [
	| label |
	label := BrLabel new
		look: BrLabelLook;
		text:
			('Search Service' asRopedText
				foreground: Color black;
				fontSize: 22;
				attributes: {(BlFontSizeAttribute size: 20)});
		geometry: (BlRectangle cornerRadius: 2).
	self addChild: label
]

{ #category : #adding }
EEditAndSearchElement >> addSearchField [
	| label elem edit |
	elem := BlElement new
		layout: BlLinearLayout horizontal alignTopLeft;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	edit := BrEditor new
		text: '';
		look: BrEditorLook;
		border: (BlBorder paint: Color black);
		hExact: 180;
		vExact: 30.
	self editor: edit.
	label := BrLabel new
		look: BrGlamorousLabelLook;
		text: 'Search:';
		geometry: (BlRectangle cornerRadius: 4);
		background: (Color fromHexString: #eaeaea).
	elem addChild: label.
	elem addChild: editor.
	self addChild: elem
]

{ #category : #accessing }
EEditAndSearchElement >> announcer [
	^ announcer
]

{ #category : #accessing }
EEditAndSearchElement >> announcer: anObject [
	| edit |
	announcer := anObject.
	edit := self editor.
	editor
		in: [ :e | 
				e editor
				when: BrTextEditorInsertedEvent
				do: [ "update search value and send and announcment to EditableExample"
				self inform: 'Target ' , e editor text.
				self searchValue:  e editor text.
				Transcript show: 'value insertered' , String cr.
				announcer announce: ESearchFieldChangedAnnouncement new ]].
]

{ #category : #accessing }
EEditAndSearchElement >> editor [
	^ editor
]

{ #category : #accessing }
EEditAndSearchElement >> editor: anObject [
	editor := anObject
]

{ #category : #'example - geometry' }
EEditAndSearchElement >> horizontalLine [
	| elem line |
	elem := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 10 ].
	line := BlLineElement new
		border: (BlBorder paint: Color red width: 5);
		fromAnchor: (BlElementBottomLeftAnchor element: self);
		toAnchor: (BlElementBottomRightAnchor element: self).
	elem addChild: line.
	self addChild: elem
]

{ #category : #initialization }
EEditAndSearchElement >> initialize [
	| searchField |
	super initialize.
	self
		layout: (BlLinearLayout vertical cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		padding: (BlInsets left: 10).
	self addMainSearchLabel.
	self horizontalLine.
	self addSearchField.
	searchField := GtSpotterSearchField new.
	searchField
		vFitContent;
		hMatchParent.
	searchField padding: (BlInsets all: 15).
	self addChild: searchField
]

{ #category : #accessing }
EEditAndSearchElement >> searchValue [
	^ searchValue
]

{ #category : #accessing }
EEditAndSearchElement >> searchValue: anObject [
	searchValue := anObject
]
