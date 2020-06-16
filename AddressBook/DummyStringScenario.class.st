Class {
	#name : #DummyStringScenario,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

{ #category : #examples }
DummyStringScenario >> a [
	<gtExample>
	<label: 'a'>
	<return: #String>
	^ 'a'
]

{ #category : #examples }
DummyStringScenario >> b [
	<gtExample>
	<label: 'b'>
	<return: #String>
	^ 'b'
]

{ #category : #examples }
DummyStringScenario >> c [
	<gtExample>
	<label: 'c'>
	<return: #String>
	^ 'c'
]

{ #category : #'keys - letters' }
DummyStringScenario >> d [
	<gtExample>
	<label: 'd'>
	<return: #String>
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

{ #category : #accessing }
DummyStringScenario >> joinMultipleStrings_CHANGE_ME_and_CHANGE_ME_ [
<gtExample>
<label: 'Generated example for joinMultipleStrings_CHANGE_ME_and_CHANGE_ME_'>
<return: #String>
| result  Onearray  Anotherarray |
Onearray := (Array 
with: (DummyStringScenario new d) 
with: (DummyStringScenario new d) 
with: (DummyStringScenario new a) 
) asOrderedCollection.
Anotherarray := (Array 
with: (DummyStringScenario new d) 
with: (DummyStringScenario new a) 
) asOrderedCollection.

result := self joinMultipleStrings:Onearray and:Anotherarray .
^ result
]

{ #category : #'as yet unclassified' }
DummyStringScenario >> methodName_a: one b: two [
	<gtExample>
	<gtParametrizedExample>
	<label: '123'>
	<description: '123'>
	<given: #anA ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #aB ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #anAaaaaaa ofType: #ABCustomAddressBookExamples in: #ABEmailType
	elementType: #multipleSearch>
	<return: #String>
	| strStream |
	strStream := WriteStream on: String new.
	one do: [ :s | strStream nextPutAll: s asString ].
	two do: [ :s | strStream nextPutAll: s asString ].
	^ strStream contents
]

{ #category : #'as yet unclassified' }
DummyStringScenario >> method_aaaNew: aaa bb: anObject [
	<gtExample>
	<gtParametrizedExample>
	<label: '123'>
	<description: '123'>
	<given: #anA ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #aB ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #anAaaaaaa ofType: #ABCustomAddressBookExamples in: #ABEmailType
	elementType: #multipleSearch>
	<return: #String>
	| strStream |
	strStream := WriteStream on: String new.
	^ strStream contents
]

{ #category : #'as yet unclassified' }
DummyStringScenario >> method_aaaNew: aaa bb: anObject aaaaa: something [
	<gtExample>
	<gtParametrizedExample>
	<label: '123'>
	<description: '123'>
	<given: #anA ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #aB ofType: #String in: #DummyStringScenario elementType: #multipleSearch>
	<given: #anAaaaaaa ofType: #ABCustomAddressBookExamples in: #ABEmailType
	elementType: #multipleSearch>
	<return: #String>
	| strStream |
	strStream := WriteStream on: String new.
	^ strStream contents
]

{ #category : #public }
DummyStringScenario >> openFile: file [
	<gtExample>
	<gtParametrizedExample>
	<given: #aFile ofType: #File in:#'' elementType:#input>
	<return: #String>
	self inform: file exists asString.
	^ file
]

{ #category : #printing }
DummyStringScenario >> printString: str [
	<gtExample>
	<gtParametrizedExample>
	<given: #aWord ofType: #String in:#'' elementType:#input>
	<label: 'Print string'>
	<description: 'A simple parametrized examples that 
	prints the string representation of an input parameter'>
	<return: #String>
	Transcript show: str asString.
	^ str.
]

{ #category : #printing }
DummyStringScenario >> returnExample: example [
	<gtExample>
	<gtParametrizedExample>
	<given: #aBook ofType: #ABAddressBook in: #ABAddressBookExamples
	elementType: #list>
	<return: #ABAddressBook>
	self inform: example.
	^ example
]
