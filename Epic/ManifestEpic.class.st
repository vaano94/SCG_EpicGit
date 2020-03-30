"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestEpic,
	#superclass : #PackageManifest,
	#category : #'Epic-Manifest'
}

{ #category : #'code-critics' }
ManifestEpic class >> ruleRBCascadedNextPutAllsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EEditAndSearchElement #announcer: #false)) #'2020-03-23T12:12:03.975202+01:00') )
]

{ #category : #'code-critics' }
ManifestEpic class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EEditAndSearchElement #announcer: #false)) #'2020-03-23T12:14:30.725202+01:00') )
]

{ #category : #'code-critics' }
ManifestEpic class >> ruleRBGlobalVariablesUsageV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EEditAndSearchElement #announcer: #false)) #'2020-03-23T12:11:45.809202+01:00') )
]
