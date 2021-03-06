"
A WikitextBasicContentTest is a test class for testing the behavior of WikitextBasicContent
"
Class {
	#name : #WikitextBasicContentTest,
	#superclass : #TestCase,
	#category : #'DMP-Wikitext-Parsing-Model-Tests'
}

{ #category : #tests }
WikitextBasicContentTest >> test01WikitextBasicContentIsEquivalentToAnotherWikitextBasicContent [

	| content wikitextBasicContent anotherWikitextBasicContent |

	content := 'Fire'.
	wikitextBasicContent := WikitextBasicContent being: content.
	anotherWikitextBasicContent := WikitextBasicContent being: content.

	self assert: ( wikitextBasicContent isEquivalentTo: anotherWikitextBasicContent )
]

{ #category : #tests }
WikitextBasicContentTest >> test02WikitextBasicContentIsNotEquivalentToAnotherWikitextBasicContent [

	| wikitextBasicContent anotherWikitextBasicContent |

	wikitextBasicContent := WikitextBasicContent being: 'Fire'.
	anotherWikitextBasicContent := WikitextBasicContent being: 'Water'.

	self deny: ( wikitextBasicContent isEquivalentTo: anotherWikitextBasicContent )
]

{ #category : #tests }
WikitextBasicContentTest >> test03PrintingWikitextBasicContent [

	| wikitextBasicContent expectedPrintString |

	wikitextBasicContent := WikitextBasicContent being: 'Fire'.
	expectedPrintString := 'Basic Content: Fire'.

	self assert: wikitextBasicContent printString equals: expectedPrintString
]
