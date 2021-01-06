Extension { #name : #GtJSClass }

{ #category : #'*GtTSImporter' }
GtJSClass >> accesses [
	"Adding this as an extension temporarily, need to open PR against upstream really. These extensions don't cover adding instances variables"

	^ accesses
]

{ #category : #'*GtTSImporter' }
GtJSClass >> initialize [
	super initialize.
	accesses := FMNullMultivalueLink
		on: self
		opposite: #accessor:
		selector: #accesses
]
