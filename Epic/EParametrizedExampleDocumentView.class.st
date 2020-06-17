Class {
	#name : #EParametrizedExampleDocumentView,
	#superclass : #BlElement,
	#instVars : [
		'parametrizedExample',
		'container'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EParametrizedExampleDocumentView >> container [
	^ container
]

{ #category : #accessing }
EParametrizedExampleDocumentView >> container: anObject [
	container := anObject
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> createLabelForExampleText: aParametrizedExample [
	| label aDocument text textElement pragmaTypeArguments replaceIndex resultString |
	
	pragmaTypeArguments:= (aParametrizedExample exampleMethod pragmas
		select: [ :p | 
			p selector = #given:ofType:in: or: p selector = #given:ofType:in:elementType:])
		collect: [ :pragma | pragma argumentNamed: #ofType ]	.
	text:= aParametrizedExample description example.
	
	replaceIndex:= 1.
	resultString:= ''.
	text do: [ :symb | symb = $% 
		ifTrue: [ resultString:= resultString, (self getDocumentTextForClass: (pragmaTypeArguments at: replaceIndex)) asString. replaceIndex:= replaceIndex + 1.  ] 
		ifFalse: [ resultString:= resultString , symb asString ] ].
			
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: (resultString asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Example: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #accessing }
EParametrizedExampleDocumentView >> createLabelForPropertyTests: aParametrizedExample [
	| label aDocument textElement resultString |
	
	resultString:= ''.
	aParametrizedExample propertyTests do: [ :ex | 
		resultString:= resultString , (self getDocumentTextForExample: ex) asString ].
			
	container := BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: (resultString asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Property Tests: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> createLabelForProviding: aParametrizedExample [
	| label aDocument text textElement pragmaElementTypeArguments replaceIndex resultString |
	
	pragmaElementTypeArguments:= ((aParametrizedExample exampleMethod pragmas
			select: [ :p | 
			p selector = #given:ofType:in:])
			collect: [ :pragma | pragma argumentNamed: #in ]) asOrderedCollection
		addAll: ((aParametrizedExample exampleMethod pragmas
			select: [ :p |  p selector = #given:ofType:in:elementType:])
			collect: [ :pragma | pragma argumentNamed: #elementType ]); 
		yourself	.
	text:= aParametrizedExample description example.
	
	replaceIndex:= 1.
	resultString:= ''.
	text do: [ :symb | | widgetClass |
			symb = $% 
			ifTrue: [ 
			widgetClass:= self getWidgetClassForString: (pragmaElementTypeArguments at: replaceIndex) asString.
			resultString:= resultString, (self getDocumentTextForClass: widgetClass) asString.
			replaceIndex:= replaceIndex + 1.  ] 
		ifFalse: [ resultString:= resultString , symb asString ] ].
	
	container := BlElement new
		layout: BlGridLayout new;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: (resultString asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Providing: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> createLabelForReturn: aParametrizedExample [
	| returnPragmaArgument label aDocument text textElement|
	returnPragmaArgument := (aParametrizedExample exampleMethod pragmas
		detect: [ :p | 
			p selector = #return:]) argumentNamed: #return.
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	text:= (self getDocumentTextForClass: returnPragmaArgument).
	aDocument text: (text asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Returns: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> createLabelForScenario: aParametrizedExample [
	| label aDocument text textElement|
	
	self parametrizedExample description scenario
			ifNil: [ 
					text:= 'scenario text is not specified' ] 
			ifNotNil: [
					text:= parametrizedExample description scenario description].
		
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	"text:= aParametrizedExample description example."
	aDocument text: (text asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'Scenario: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> createLabelForWhen: aParametrizedExample [
	| label aDocument text textElement |
	
	text:= (aParametrizedExample description when)	.
	text:= text	copyReplaceAll: '%'
			with: (self getDocumentTextForMethod: (aParametrizedExample exampleMethod) ).
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: (text asRopedText fontSize: 50).
	textElement := aDocument asElementWithoutSaveAction constraintsDo: [  :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	label := BrLabel new
		padding: (BlInsets right: 0);
		text: 'When: ';
		look: (BrGlamorousLabelLook new bold glamorousRegularFont fontSize: 20);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft. ].
	container addChild: label.
	container addChild: textElement.	
	^ container.	
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> getDocumentTextForClass: className [
 ^ '${class:' , className, '|label=', className, '}$'.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> getDocumentTextForExample: aCompiledMethod [
 ^  '${example:' , (aCompiledMethod name), '|codeExpanded=false}$'.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> getDocumentTextForMethod: aCompiledMethod [
 ^ '${method:name=' , (aCompiledMethod name), '|label=', aCompiledMethod selector, '}$'.
]

{ #category : #'as yet unclassified' }
EParametrizedExampleDocumentView >> getWidgetClassForString: aString [
	^ (EScenarioInputWidget subclasses detect: [ 
		:subclass| subclass widgetType = aString ]) name
]

{ #category : #initialization }
EParametrizedExampleDocumentView >> initialize [
	super initialize.
	
	self
		layout: BlLinearLayout vertical ;
		"padding: (BlInsets all: 6);"
		border: (BlBorder paint: (Color red ) width: 3);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ]
]

{ #category : #initialization }
EParametrizedExampleDocumentView >> initializeForParametrizedExample: aParametrizedExample [
	| aDocument scenarioName scenarioElement exampleTextElement whenElement propertyTestsElement returnElement providingElement aScrollPane|
	self parametrizedExample: aParametrizedExample.
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.	
	self parametrizedExample boundScenario
			ifNil: [ 	
					(parametrizedExample exampleMethod pragmaAt: #label:) 
						ifNil: [ scenarioName:= 'scenario text is not specified' ]
						ifNotNil: [ :pragma |
						scenarioName:= pragma arguments first. 
						 ].
					]
			ifNotNil: [ scenarioName:= self parametrizedExample boundScenario description].
	
	scenarioElement:= self createLabelForScenario: aParametrizedExample.
	self addChild: scenarioElement.		
			
	exampleTextElement:= self createLabelForExampleText: aParametrizedExample.
	self addChild: exampleTextElement.
			
	providingElement:= self createLabelForProviding: aParametrizedExample.
	self addChild: providingElement.
	
	whenElement:= self createLabelForWhen: aParametrizedExample.
	self addChild: whenElement.
			
	returnElement:= self createLabelForReturn: aParametrizedExample.
	self addChild: returnElement.
	
	propertyTestsElement:= self createLabelForPropertyTests: aParametrizedExample.
	self addChild: propertyTestsElement.

	^ self
]

{ #category : #accessing }
EParametrizedExampleDocumentView >> parametrizedExample [
	^ parametrizedExample
]

{ #category : #accessing }
EParametrizedExampleDocumentView >> parametrizedExample: anObject [
	parametrizedExample := anObject
]
