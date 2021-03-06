"
A WikitextTemplateParserTest is a test class for testing the behavior of WikitextTemplateParser
"
Class {
	#name : #WikitextTemplateParserTest,
	#superclass : #TestCase,
	#category : #'DMP-Wikitext-Parsing-Model-Tests'
}

{ #category : #tests }
WikitextTemplateParserTest >> test01ParsingAWikitextTemplateWithoutArguments [

	| wikitextTemplateToParse wikitextTemplateParser parsedWikitextTemplate expectedWikitextTemplate |

	wikitextTemplateToParse := 'Tap Skill'.

	wikitextTemplateParser := WikitextTemplateParser toParse: wikitextTemplateToParse.
	parsedWikitextTemplate := wikitextTemplateParser parse.
	expectedWikitextTemplate := WikitextTemplate withoutArgumentsNamed: 'Tap Skill'.

	self
		assert: ( wikitextTemplateParser isA: WikitextTemplateWithoutArgumentsParser );
		assert: ( expectedWikitextTemplate isEquivalentTo: parsedWikitextTemplate )
]

{ #category : #tests }
WikitextTemplateParserTest >> test02ParsingAWikitextTemplateWithArguments [

	| wikitextTemplateToParse wikitextTemplateParser parsedWikitextTemplate expectedWikitextTemplate |

	wikitextTemplateToParse := 'Cardtable|Civilization=Water'.

	wikitextTemplateParser := WikitextTemplateParser toParse: wikitextTemplateToParse.
	parsedWikitextTemplate := wikitextTemplateParser parse.
	expectedWikitextTemplate := WikitextTemplate
		named: 'Cardtable'
		withArgument: ( WikitextArgument named: 'Civilization' withContent: ( WikitextBasicContent being: 'Water' ) ).

	self
		assert: ( wikitextTemplateParser isA: WikitextTemplateWithArgumentsParser );
		assert: ( expectedWikitextTemplate isEquivalentTo: parsedWikitextTemplate )
]

{ #category : #tests }
WikitextTemplateParserTest >> test03ParsingTrimsWhiteSpaces [

	| wikitextTemplateToParse wikitextTemplateParser parsedWikitextTemplate expectedWikitextTemplate |

	wikitextTemplateToParse := 'Cardtable
|  phonetic = Europika
'.

	wikitextTemplateParser := WikitextTemplateParser toParse: wikitextTemplateToParse.
	parsedWikitextTemplate := wikitextTemplateParser parse.
	expectedWikitextTemplate := WikitextTemplate
		named: 'Cardtable'
		withArgument: ( WikitextArgument named: 'phonetic' withContent: ( WikitextBasicContent being: 'Europika' ) ).

	self
		assert: ( wikitextTemplateParser isA: WikitextTemplateWithArgumentsParser );
		assert: ( expectedWikitextTemplate isEquivalentTo: parsedWikitextTemplate )
]
