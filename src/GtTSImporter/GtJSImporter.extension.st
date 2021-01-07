Extension { #name : #GtJSImporter }

{ #category : #'*GtTSImporter' }
GtJSImporter >> localFilename: aString from: aNode [
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
	name := name parent / name basename.
	self parserClass fileExtensions
		do: [ :each | 
			(name , each) exists
				ifTrue: [ ^ name , each ] ].
	^ nil
]
