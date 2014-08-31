<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: WikiAppend.php 50618 2014-04-02 13:30:30Z lphuberdeau $

namespace Tiki\MailIn\Action;
use Tiki\MailIn\Account;
use Tiki\MailIn\Source\Message;
use TikiLib;

class WikiAppend extends WikiPut
{
	function getName()
	{
		return tr('Wiki Append');
	}

	protected function handleContent($data, $info)
	{
		if ($info) {
			return $info['data'] . "\n" . $data['body'];
		} else {
			return $data['body'];
		}
	}
}
