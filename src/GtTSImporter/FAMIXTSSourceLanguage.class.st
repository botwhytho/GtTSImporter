Class {
	#name : #FAMIXTSSourceLanguage,
	#superclass : #FAMIXJSSourceLanguage,
	#category : #'GtTSImporter-Importer'
}

{ #category : #accessing }
FAMIXTSSourceLanguage >> parserClass [

	^ parserClass ifNil: [ TypeScriptParser ]
]
