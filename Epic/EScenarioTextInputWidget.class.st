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
	"	editorLook
		add:
			(BrInteractiveCommonLook new
				default: [ BlBorder paint: Color red ];
				hovered: [ BlBorder paint: Color green ];
				pressed: [ editorLook foreground: Color black ])."
	editor := BrEditor new
		text: '';
		look:
			editorLook;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		geometry: (BlRectangle cornerRadius: 10);
		"hFitContent;"
			hMatchParent;
		vExact: 40;
		"vExact: 40;"
			constraintsDo: [ :c | 
			c minWidth: 100.
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
