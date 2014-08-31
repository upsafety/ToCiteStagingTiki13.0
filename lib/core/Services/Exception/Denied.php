<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: Denied.php 50743 2014-04-10 17:36:10Z lphuberdeau $

class Services_Exception_Denied extends Services_Exception
{
	function __construct($message = null)
	{
		if (is_null($message)) {
			$message = tr('Permission denied');
		}

		parent::__construct($message, 403);
	}

	public static function checkAuth()
	{
		if (empty($GLOBALS['user'])) {
			throw new self(tr('Authentication required'));
		}
	}

	public static function checkGlobal($perm)
	{
		$perms = Perms::get();
		if (! $perms->$perm) {
			throw new self(tr('Permission denied'));
		}
	}

	public static function checkObject($perm, $type, $object)
	{
		$perms = Perms::get($type, $object);
		if (! $perms->$perm) {
			throw new self(tr('Permission denied'));
		}
	}
}

