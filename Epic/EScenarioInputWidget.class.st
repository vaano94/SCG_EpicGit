Class {
	#name : #EScenarioInputWidget,
	#superclass : #BlElement,
	#instVars : [
		'label',
		'parameterName',
		'parameterIndex'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioInputWidget class >> forIndex: anIndex widgetModel: aParameterName parametrizedExample: aParametrizedExample [
	self subclassResponsibility
]

{ #category : #accessing }
EScenarioInputWidget class >> widgetType [
	self subclassResponsibility
]

{ #category : #initialization }
EScenarioInputWidget >> initialize [
	super initialize.
	self
		look: BrShadowLook;
		padding:
			(BlInsets
				top: 5
				left: 3
				bottom: 5
				right: 3);
		background: Color white;
		layout: (BlLinearLayout horizontal cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	"border: (BlBorder paint: Color red)."
	label := BrLabel new
		padding: (BlInsets right: 0);
		look:
			(BrGlamorousLabelLook new
				glamorousRegularFontAndSize;
				foreground: Color gray);
		constraintsDo: [ :c | 
			c linear horizontal alignLeft.
			c linear vertical alignCenter ].
	self addChild: label
]

{ #category : #accessing }
EScenarioInputWidget >> parameterIndex [
	^ parameterIndex
]

{ #category : #accessing }
EScenarioInputWidget >> parameterIndex: anObject [
	parameterIndex := anObject
]

{ #category : #accessing }
EScenarioInputWidget >> parameterName [
	^ parameterName
]

{ #category : #accessing }
EScenarioInputWidget >> parameterName: anObject [
	label text: anObject , ':'.
	parameterName := anObject
]

{ #category : #'grammar - Parameter' }
EScenarioInputWidget >> parameterValue [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EScenarioInputWidget >> widgetType [
	self subclassResponsibility
]
