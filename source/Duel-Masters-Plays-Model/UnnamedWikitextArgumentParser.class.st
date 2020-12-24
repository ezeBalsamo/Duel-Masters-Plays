Class {
	#name : #UnnamedWikitextArgumentParser,
	#superclass : #WikitextArgumentParser,
	#category : #'Duel-Masters-Plays-Model'
}

{ #category : #'private - testing' }
UnnamedWikitextArgumentParser class >> canHandle: aWikitextArgumentToParse [

	^ ( self isUnnamedArgumentWithBasicContent: aWikitextArgumentToParse )
		or: [ self isUnnamedArgumentWithTemplateContent: aWikitextArgumentToParse ]
]

{ #category : #'private - testing' }
UnnamedWikitextArgumentParser class >> isUnnamedArgumentWithBasicContent: aWikitextArgumentToParse [

	^ ( self isUnnamedArgumentWithTemplateContent: aWikitextArgumentToParse ) not
		and: [ ( self isNamed: aWikitextArgumentToParse ) not ]
]

{ #category : #parsing }
UnnamedWikitextArgumentParser >> parse [

	^ WikitextArgument unnamedWithContent: self parseContent
]

{ #category : #'parsing - private' }
UnnamedWikitextArgumentParser >> parseContent [

	^ ( WikitextContentParser toParse: wikitextArgumentToParse ) parse
]