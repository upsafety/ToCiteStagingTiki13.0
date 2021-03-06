<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: TokenizerTest.php 44444 2013-01-05 21:24:24Z changi67 $

class Search_Expr_TokenizerTest extends PHPUnit_Framework_TestCase
{
	private $tokenizer;

	function setUp()
	{
		$this->tokenizer = new Search_Expr_Tokenizer;
	}

	function testSingleWord()
	{
		$this->assertEquals(array('hello'), $this->tokenizer->tokenize('hello'));
	}

	function testMultipleWords()
	{
		$this->assertEquals(array('hello', 'world', 'who', 'listens'), $this->tokenizer->tokenize('hello world who listens'));
	}

	function testWithQuotedText()
	{
		$this->assertEquals(array('hello world', 'who listens'), $this->tokenizer->tokenize('"hello world" "who listens"'));
	}

	function testWithParenthesis()
	{
		$this->assertEquals(
			array(
				'hello world (who?)',
				'(',
				'who',
				')',
				'(',
				'test',
				'listens',
				')'
			),
			$this->tokenizer->tokenize('"hello world (who?)" (who) (test listens)')
		);
	}
}

