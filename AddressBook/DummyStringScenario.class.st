Class {
	#name : #DummyStringScenario,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #examples }
DummyStringScenario >> a [
	<gtExample>
	<label: 'a'>
	^ 'a'
]

{ #category : #examples }
DummyStringScenario >> b [
	<gtExample>
	<label: 'b'>
	^ 'b'
]

{ #category : #examples }
DummyStringScenario >> c [
	<gtExample>
	<label: 'c'>
	^ 'c'
]

{ #category : #'keys - letters' }
DummyStringScenario >> d [
	<gtExample>
	<label: 'd'>
	^ 'd'
]

{ #category : #'keys - letters' }
DummyStringScenario >> e [
	<gtExample>
	<label: 'e'>
	^ 'e'
]

{ #category : #'keys - letters' }
DummyStringScenario >> f [
	<gtExample>
	<label: 'f'>
	^ 'f'
]

{ #category : #'keys - letters' }
DummyStringScenario >> g [
	<gtExample>
	<label: 'g'>
	^ 'g'
]

{ #category : #'keys - letters' }
DummyStringScenario >> h [
	<gtExample>
	<label: 'h'>
	^ 'h'
]

{ #category : #'keys - letters' }
DummyStringScenario >> i [
	<gtExample>
	<label: 'i'>
	^ 'i'
]

{ #category : #running }
DummyStringScenario >> joinMultipleStrings: strings and: strings2 [
	|strStream|
	<gtExample>
	<gtParametrizedExample>
	<given: #'One array' ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #'Another array' ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<return: #String>
	strStream := WriteStream on: String new.
	strings do: [ :s | strStream nextPutAll: s asString ].
	strings2 do: [ :s | strStream nextPutAll: s asString ].
	^ strStream contents
]
