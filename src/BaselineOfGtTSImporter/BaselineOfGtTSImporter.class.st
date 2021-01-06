Class {
	#name : #BaselineOfGtTSImporter,
	#superclass : #BaselineOf,
	#category : 'BaselineOfGtTSImporter'
}

{ #category : #baseline }
BaselineOfGtTSImporter >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			package: 'GtTSImporter'. ].

]
