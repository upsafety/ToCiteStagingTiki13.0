<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: cancel_membership_extension.php 50770 2014-04-11 22:41:59Z lphuberdeau $

function payment_behavior_cancel_membership_extension( $users, $groupId )
{
	$userlib = TikiLib::lib('user');

	$users = (array) $users;

	foreach ( $users as $u ) {
		$attributelib = TikiLib::lib('attribute');
		$attributes = $attributelib->get_attributes('user', $u);

		foreach ($attributes as $a) {
			$attname = 'tiki.memberextend.' . $groupId; 
			if (isset($attributes[$attname])) {
				$attributelib->set_attribute('user', $u, $attname, '');
			}
		}
	}
}

