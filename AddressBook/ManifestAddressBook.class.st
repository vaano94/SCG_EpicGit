Class {
	#name : #ManifestAddressBook,
	#superclass : #PackageManifest,
	#category : #'AddressBook-Manifest'
}

{ #category : #'code-critics' }
ManifestAddressBook class >> ruleRBCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'ABContact class' #testFullContact #true)) #'2020-02-25T13:51:02.578686+01:00') )
]
