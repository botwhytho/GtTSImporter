Extension { #name : #GtJSImporter }

{ #category : #'*GtTSImporter' }
GtJSImporter >> localFilename: aString from: aNode [
	| currentDirectory name |
	currentDirectory := aNode topParent filename asFileReference parent.
	name := (aString substrings: '/\')
			inject: currentDirectory
			into: [ :sum :each | each = '..' ifTrue: [ sum parent ] ifFalse: [ sum / each ] ].
	self parserClass fileExtensions
		do: [ :each | 
			| fullName |
			fullName := name parent / (name basename , each).
			fullName exists ifTrue: [ ^ fullName ] ].
	name exists ifTrue: [ ^ name ].
	^ nil
]
