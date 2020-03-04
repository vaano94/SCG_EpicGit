"
!Use Case

Uses cases are actions that define how a system and a user work together to achieve a goal. Because of this, each use case will have a task and an actor. The task will be within the scope of the epic's feature. They are one step into more detail from an ${class:name=Epic}$.

The title serves as a 1 or 2 word summation of the contents of the use case for identification purposes. The actor will be an ${class:name=EActor}$ who can have specifications made about them. The task will be a more detailed account of the title and goal of this use case.

Each use case will have a collection of ${class:name=EUserStory}$ that will give more specifications and scenarios.

"
Class {
	#name : #EUseCase,
	#superclass : #Object,
	#instVars : [
		'title',
		'actor',
		'supportingActor',
		'precondition',
		'successGarantie',
		'complexity',
		'flowOfEvents',
		'state',
		'task',
		'userStories'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EUseCase >> actor [
	^ actor
]

{ #category : #accessing }
EUseCase >> actor: anObject [
	actor := anObject
]

{ #category : #adding }
EUseCase >> addActor [
	| a |
	a := EActor new.
	actor add: a.
]

{ #category : #adding }
EUseCase >> addActor: anObject [
	actor add: anObject.
]

{ #category : #adding }
EUseCase >> addUserStory: aUserStory [
	self userStories add: aUserStory
]

{ #category : #accessing }
EUseCase >> complexity [
	^ complexity
]

{ #category : #accessing }
EUseCase >> complexity: anObject [
	complexity := anObject
]

{ #category : #'as yet unclassified' }
EUseCase >> createUserStory [
	| us |
	us := EUserStory new.
	userStories add: us.
]

{ #category : #accessing }
EUseCase >> flowOfEvents [
	^ flowOfEvents
]

{ #category : #accessing }
EUseCase >> flowOfEvents: anObject [
	flowOfEvents := anObject
]

{ #category : #ui }
EUseCase >> gtActorColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Actors';
		priority: 1;
		items: [ self actor asOrderedCollection];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 40;
		column: 'Name' item: [ :anElement | anElement name ] width: 200
]

{ #category : #ui }
EUseCase >> gtCaseInfoFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Information';
		priority: 0;
		text: [ title , String cr , String cr, 
				'The current state of this use case is: ' , state , String cr, 
				String cr , 'The task of this use case is: ' , self task, String cr,
				'Actor: ', self actor asString, String cr,
				'Supporting Actor: ', self supportingActor asString, String cr,
				'Precondition: ', self precondition , String cr,
				'SuccessGarantie: ', self successGarantie , String cr,
				'Complexity: ', self complexity , String cr,
				'Flow of events: ', self flowOfEvents , String cr
				
				 ]
]

{ #category : #ui }
EUseCase >> gtDiagramFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Diagram';
		priority: 4;
		text: [ 'This page will hopefully have a use case diagram' ]
]

{ #category : #ui }
EUseCase >> gtDocumentFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new
		text:
			'A ${class:name=EUseCase}$ is defined as: I am a(n) ${class:name=EActor}$ who wants to complete a task.
			
Under information you will see the name of this use case as well as the state it is currently in and the task that the use case is responsible for implementing.
			
In Actors, you can see the list of ${class:name=EActor}$ that exists in this use case.

Under User Stories you can see a list of all ${class:name=EUserStory}$.

Under Diagram, you will be able to see a use case diagram. This is still under construction.'.
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 1
]

{ #category : #ui }
EUseCase >> gtUserStoryColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'User Stories';
		priority: 3;
		items: [ self userStories asArray ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 50;
		column: 'User' item: [ :anElement :anIndex | anElement user name ];
		column: 'Action' item: [ :anElement :anIndex | anElement action ];
		column: 'Class' item: [ :anElement :anIndex | anElement class ]
]

{ #category : #initialization }
EUseCase >> initialize [
	super initialize.
	userStories := OrderedCollection new.
	actor := OrderedCollection new.
	actor add: EActor new.
	title :=  'Use Case Title'.
	state :=  'Not started'.
	task := 'Undefined'.
	
	
]

{ #category : #'as yet unclassified' }
EUseCase >> markComplete [
	state := 'Completed'.
]

{ #category : #'as yet unclassified' }
EUseCase >> markStarted [
	state := 'Started, uncomplete'.
]

{ #category : #accessing }
EUseCase >> precondition [
	^ precondition
]

{ #category : #accessing }
EUseCase >> precondition: anObject [
	precondition := anObject
]

{ #category : #accessing }
EUseCase >> state [
	^ state
]

{ #category : #accessing }
EUseCase >> state: anObject [
	state := anObject
]

{ #category : #accessing }
EUseCase >> successGarantie [
	^ successGarantie
]

{ #category : #accessing }
EUseCase >> successGarantie: anObject [
	successGarantie := anObject
]

{ #category : #accessing }
EUseCase >> supportingActor [
	^ supportingActor
]

{ #category : #accessing }
EUseCase >> supportingActor: anObject [
	supportingActor := anObject
]

{ #category : #accessing }
EUseCase >> task [
	^ task
]

{ #category : #accessing }
EUseCase >> task: anObject [
	task := anObject
]

{ #category : #accessing }
EUseCase >> title [
	^ title
]

{ #category : #accessing }
EUseCase >> title: anObject [
	title := anObject
]

{ #category : #accessing }
EUseCase >> userStories [
	^ userStories
]

{ #category : #accessing }
EUseCase >> userStories: anObject [
	userStories := anObject
]
