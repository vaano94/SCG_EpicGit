"
Baseline for git
"
Class {
	#name : #BaselineOfEpic,
	#superclass : #BaselineOf,
	#category : #BaselineOfEpic
}

{ #category : #baselines }
BaselineOfEpic >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec package: 'Epic' ;
			     package: 'AddressBook' ]
]
