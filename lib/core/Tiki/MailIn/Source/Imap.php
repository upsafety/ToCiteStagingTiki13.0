<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: Imap.php 50637 2014-04-02 21:07:49Z lphuberdeau $

namespace Tiki\MailIn\Source;
use Tiki\MailIn\Exception\TransportException;

class Imap extends Pop3
{
	protected function connect()
	{
		try {
			$imap = new \Zend_Mail_Storage_Imap([
				'host' => $this->host,
				'port' => $this->port,
				'user' => $this->username,
				'password' => $this->password,
				'ssl' => $this->port == 993,
			]);

			return $imap;
		} catch (\Zend_Mail_Protocol_Exception $e) {
			throw new TransportException(tr("Login failed for IMAP account on %0:%1 for user %2", $this->host, $this->password, $this->username));
		}
	}
}
