<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: SourceInterface.php 50632 2014-04-02 19:40:58Z lphuberdeau $

namespace Tiki\MailIn\Source;

interface SourceInterface
{
	function test();

	function getMessages();
}
