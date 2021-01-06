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

{ #category : #accessing }
GtTSImporter >> localFilename: aString from: aNode [
	"TODO: Need to open upstream PR to use the parseClass's extension variable instead of hard coding"

	| currentDirectory name |
	currentDirectory := aNode topParent filename asFileReference parent.
	name := (aString substrings: '/\')
		inject: currentDirectory
		into: [ :sum :each | 
			each = '..'
				ifTrue: [ sum parent ]
				ifFalse: [ sum / each ] ].
	name exists
		ifTrue: [ ^ name ].
	name := name parent / (name basename , '.ts').
	name exists
		ifTrue: [ ^ name ].
	^ nil
]