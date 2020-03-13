"
!Scenario
I represent scenarios for ${class:name=EUserStory}$.
I am test cases that cover every possibile outcome of a ${class:name=EUserStory}$.
"
Class {
	#name : #EScenario,
	#superclass : #Object,
	#instVars : [
		'description',
		'exampleMethod',
		'exampleMethods',
		'parametrizedExamples'
	],
	#category : #'Epic-Model'
}

{ #category : #'as yet unclassified' }
EScenario >> aViewFor: scenario [
	<gtView>
]

{ #category : #adding }
EScenario >> addParametrizedExample: anExample [
	self parametrizedExamples add: anExample.
]

{ #category : #accessing }
EScenario >> description [
	^ description
]

{ #category : #accessing }
EScenario >> description: aString [
	description := aString
]

{ #category : #accessing }
EScenario >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
EScenario >> exampleMethod: aMethod [
	exampleMethod := aMethod
]

{ #category : #accessing }
EScenario >> exampleMethods [
	^ exampleMethods
]

{ #category : #accessing }
EScenario >> exampleMethods: list [
	list do: [ :item | self exampleMethods add: item ].
]

{ #category : #'as yet unclassified' }
EScenario >> exampleWithLabel [
	<gtExample>
^ '[[[label=Evaluate
aBook := GtDocument new.
]]]'
]

{ #category : #ui }
EScenario >> gtDescriptionFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text:
			"'A ${class:name=EScenario}$ represents all methods that cover use story functionality ' ,"
			self exampleWithLabel .
			"'[[[	label=Evaluate
					aBook := GtDocument new.
			]]]'".
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 13 
]

{ #category : #'as yet unclassified' }
EScenario >> gtListOfMethodsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Methods';
		priority: 2;
		items: [ self exampleMethods asOrderedCollection];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 40;
		column: 'Method' item: [ :anElement | '${method:anElement|expanded}$' ] width: 400
]

{ #category : #'as yet unclassified' }
EScenario >> gtListOfParametrizedExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Parametrized';
		priority: 2;
		items: [ self parametrizedExamples ];
		column: 'Index' item: [ :anElement :anIndex| anIndex ];
		column: 'Method' item: [ :anElement | anElement toString ].
]

{ #category : #'as yet unclassified' }
EScenario >> gtViewSource: aView [
	<gtView> 
	self exampleMethod ifNil: [ ^ aView empty ].
	^ self exampleMethod gtCoderSourceFor: aView.
]

{ #category : #initialization }
EScenario >> initialize [
	exampleMethods := Set new.
	parametrizedExamples := OrderedCollection new.
]

{ #category : #accessing }
EScenario >> parametrizedExamples [
	^ parametrizedExamples
]

{ #category : #'instance creation' }
EScenario >> popupList [
	<gtExample>
	|list|
	list:= (Dictionary newFrom: {1 -> 7. 2 -> 3. 3 -> 1. 4 -> 3}) associations.
	"^ self exampleWithSelection"
	list:= self selectionListWith: list andChosenElement: nil.
	^  list
		lookDo: [ :aLook | aLook listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200
]

{ #category : #examples }
EScenario >> roundedDropdownList [
	<gtExample>
	^ self toggleButton
		look:
			BrGlamorousButtonWithLabelAndIconLook
				+
					(BrGlamorousWithDropdownLook
						handle: [ self toggleButton
								look:
									BrGlamorousButtonWithLabelAndIconLook - BrGlamorousButtonExteriorLook;
								yourself ]
						content: [ self popupList ]);
		relocate: 200 @ 100;
		yourself
]

{ #category : #'examples - selection' }
EScenario >> selectionListWith: injectedContent andChosenElement: element [
	"I represent list of objects user injects me into"
	<gtExample>
	| aList listContent |
	listContent := (Dictionary newFrom: {1 -> 7. 2 -> 3. 3 -> 1. 4 -> 3}) associations.
	listContent := injectedContent.
	
	aList := BrSimpleList new.
	aList
		stencil: [ :aNumber :index |
			BlTextElement new
				text: aNumber asRopedText;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					anEvent consumed: true.
					aList selectOne: index ] ];
		display: [{1 . 3 . 4}] ;
		when: BrSelectionChanged do: [ :anEvent |
			anEvent selectedDo: [ :anInterval | self inform: 'Selected: ', anInterval asString ].
			anEvent deselectedDo: [ :anInterval | self inform: 'Deselected: ', anInterval asString ] ];
		yourself.
	^ aList
]

{ #category : #'instance creation' }
EScenario >> toggleButton [
	<gtExample>
	^ BrButton new
		label: 'examples';
		icon:
			(BlElement new
				size: 8 @ 8;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((8 / 2) rounded @ 8)});
				background: Color lightGray;
				margin: (BlInsets left: 6);
				constraintsDo: [ :c | c linear vertical alignCenter ]);
		yourself
]
