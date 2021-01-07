Class {
	#name : #GtTSImporter,
	#superclass : #GtJSImporter,
	#category : #'GtTSImporter-Importer'
}

{ #category : #importing }
GtTSImporter >> importJSFile: aFile [
	| ast |
	self startingImportingFile.
	ast := self parserClass
		parseWithErrors: aFile asFileReference contents.
	ast filename: aFile.
	scopeStack := OrderedCollection with: ast.
	self acceptNode: ast.
	self finishImportingFile
]

{ #category : #initialization }
GtTSImporter >> initialize [
	super initialize.
	self parserClass: TypeScriptParser.
]
