Class {
	#name : #BaselineOfGtTSImporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtTSImporter
}

{ #category : #baseline }
BaselineOfGtTSImporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'GtTSImporter'
				with: [ spec postLoadDoIt: #postLoadRefactorings ] ]
]

{ #category : #'post load' }
BaselineOfGtTSImporter >> postLoadRefactorings [
	(GtJSClass instVarNames includes: #accesses)
		ifFalse: [ (RBAddInstanceVariableRefactoring
				variable: 'accesses'
				class: GtJSClass) execute ].
	TypeScriptParser
		compile:
			'defaultStartingState
				^ self startingStateForModule'
]
