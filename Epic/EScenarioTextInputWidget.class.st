Class {
	#name : #EScenarioTextInputWidget,
	#superclass : #EScenarioInputWidget,
	#instVars : [
		'editor'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EScenarioTextInputWidget >> initialize [
	| editorLook interactiveLook |
	super initialize.
	editorLook := BrGlamorousRegularEditorLook new fontSize: 15.
	"editorLook
		add:
			(BrInteractiveCommonLook new
				default: [ editorLook foreground: Color red ];
				hovered: [ editorLook foreground: Color blue ];
				pressed: [ editorLook foreground: Color black ])."
	editor := BrEditor new
		text: '';
		look: editorLook;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		geometry: (BlRectangle cornerRadius: 10);
		hExact: 120;
		vExact: 40;
		constraintsDo: [ :c | 
			c padding: (BlInsets all: 10).
			c linear horizontal alignLeft.
			c vertical matchParent.
			c linear weight: 0.3 ].
	editor
		in: [ :e | 
			e editor
				when: BrTextEditorInsertedEvent
				do: [ self inform: 'Target ' , e editor text ] ].
	self addChild: editor
]

{ #category : #'grammar - Parameter' }
EScenarioTextInputWidget >> parameterValue [
	^ editor editor text asString
]
