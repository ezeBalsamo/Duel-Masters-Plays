Class {
	#name : #WikitextArgumentParser,
	#superclass : #Object,
	#instVars : [
		'wikitextArgumentToParse'
	],
	#category : #'DMP-Wikitext-Parsing-Model'
}

{ #category : #'private - testing' }
WikitextArgumentParser class >> canHandle: aWikitextArgumentToParse [

	self subclassResponsibility
]

{ #category : #'private - testing' }
WikitextArgumentParser class >> isNamed: aWikitextArgumentToParse [

	^ aWikitextArgumentToParse includesSubstring: '='
]

{ #category : #'private - testing' }
WikitextArgumentParser class >> isUnnamedArgumentWithTemplateContent: aWikitextArgumentToParse [

	^ aWikitextArgumentToParse beginsWith: '{{'
]

{ #category : #'instance creation' }
WikitextArgumentParser class >> toParse: aWikitextArgumentToParse [

	| trimmedWikitextArgumentToParse |

	trimmedWikitextArgumentToParse := WikitextWhiteSpacesCleaner new
		clean: aWikitextArgumentToParse.

	^ ( SuitableClassFinder
		findSubclassOf: self
		suitableFor: trimmedWikitextArgumentToParse ) value new
		initializeToParse: trimmedWikitextArgumentToParse
]

{ #category : #initialization }
WikitextArgumentParser >> initializeToParse: aWikitextArgumentToParse [

	wikitextArgumentToParse := aWikitextArgumentToParse
]

{ #category : #parsing }
WikitextArgumentParser >> parse [

	self subclassResponsibility
]
