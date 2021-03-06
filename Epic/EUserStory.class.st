"
!User Story

User stories are brief descriptions of the feature and its purpose - the focus is on user and business needs, goals, and benefits. They do not contain techincal details or specifications. Stories need to be specific, measurable, achievable, relevant, and time boxed (limited duration). They are one step deeper into detail from a ${class:name=EUseCase}$. 

The format on a traditional story card is
			As a <user> I want to <complete action> so that I can <goal>
			
${class:name=EScenario}$ are examples that serve as test cases.
The user of each story is an ${class:name=EActor}$ who can have specifications made about them. The action can be defined as a quick phrase about what the ${class:name=EActor}$ will be doing (i.e. use an email address). The goal is related to/the same as the task in the heirarchal use case (i.e. register for an account).
"
Class {
	#name : #EUserStory,
	#superclass : #Object,
	#instVars : [
		'user',
		'action',
		'goal',
		'component',
		'pillar',
		'scenarios',
		'acceptCriteria'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EUserStory >> acceptCriteria [
	^ acceptCriteria
]

{ #category : #accessing }
EUserStory >> acceptCriteria: anObject [
	acceptCriteria := anObject
]

{ #category : #accessing }
EUserStory >> action [
	^ action
]

{ #category : #accessing }
EUserStory >> action: anObject [
	action := anObject
]

{ #category : #adding }
EUserStory >> addScenario: aScenario [
	scenarios add: aScenario.
]

{ #category : #accessing }
EUserStory >> children [ 
	^ self scenarios
]

{ #category : #accessing }
EUserStory >> component [
	^ component
]

{ #category : #accessing }
EUserStory >> component: anObject [
	component := anObject
]

{ #category : #accessing }
EUserStory >> goal [
	^ goal
]

{ #category : #accessing }
EUserStory >> goal: anObject [
	goal := anObject
]

{ #category : #'as yet unclassified' }
EUserStory >> gtDocumentFor: aView [
    <gtView>
    | aDocument |
    aDocument := GtDocument new text: 'As a <user>, ${class:name=EActor}$ I want to <complete action> so that I can <goal>

Under elements, you can see a list of all actors that are present within this user story.

Under scenarios, you can see a list and view each of the scenarios used to support this story.'. 
    ^ (aDocument gtTextFor: aView)
        title: 'View Details';
        priority: 1
]

{ #category : #'as yet unclassified' }
EUserStory >> gtStoryInfoFor: aView [
	<gtView>
"	|aDocument|
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	self assert: aDocument isSubscribedToSystem not.
	self assert: (SystemAnnouncer uniqueInstance hasSubscriber: aDocument) not.
	^ aDocument
	"
	^ aView textEditor
		title: 'Information';
		priority: 0;
		text: [ 'As a ', user name, ', I want to ', action, '.', String cr]
]

{ #category : #'as yet unclassified' }
EUserStory >> gtTreeViewOn: aView [
	<gtView>

	(self scenarios isEmpty) ifTrue: [^ aView empty].
	^ aView columnedTree
		title: 'Tree' translated;
		items: [self children];
		children: [ :each | each children ];
		column: 'Type' format: [ :eachElement | eachElement treeViewShortString ].
]

{ #category : #'as yet unclassified' }
EUserStory >> gtViewScenarios: aView [
	<gtView>
	^ aView list
		title: 'Scenarios';
		priority: 4;
		items: [ scenarios ];
		itemFormat: [ :aScenario | aScenario description ]
]

{ #category : #initialization }
EUserStory >> initialize [
	super initialize.
	user := EActor new.
	component := OrderedCollection new.
	component add: user.
	goal := 'Undefined'.
	action := 'Undefined'.
	scenarios := OrderedCollection new.
]

{ #category : #accessing }
EUserStory >> pillar [
	^ pillar
]

{ #category : #accessing }
EUserStory >> pillar: anObject [
	pillar := anObject
]

{ #category : #accessing }
EUserStory >> scenarios [
	^ scenarios
]

{ #category : #'as yet unclassified' }
EUserStory >> treeViewShortString [
	^ 'Use Story: (As a ', user name, ', I want to ', action, ')'
]

{ #category : #accessing }
EUserStory >> user [
	^ user
]

{ #category : #accessing }
EUserStory >> user: anObject [
	user := anObject
]
