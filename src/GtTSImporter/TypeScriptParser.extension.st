Extension { #name : #TypeScriptParser }

{ #category : #'*GtTSImporter' }
TypeScriptParser class >> defaultStartingState [
	^ self startingStateForModule
]

{ #category : #'*GtTSImporter' }
TypeScriptParser class >> fileExtensions [
	^ {self fileExtension. self superclass fileExtension}
]
