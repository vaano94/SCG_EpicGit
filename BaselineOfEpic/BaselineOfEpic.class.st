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
			spec baseline: 'GToolkit' with: [ spec repository: 'github://feenkcom/gtoolkit/src' ].
			"Packages"
			spec package: 'Epic' with: [ spec requires: #('GToolkit') ];
				  package: 'AddressBook' with: [ spec requires: #('GToolkit') ] ]
]
