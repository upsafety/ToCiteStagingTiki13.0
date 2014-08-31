<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: function.notification_link.php 49767 2014-02-06 17:41:40Z lphuberdeau $

function smarty_function_notification_link($params)
{
	global $user, $prefs;

	if ($prefs['monitor_enabled'] != 'y') {
		return;
	}

	if (! $user) {
		return '';
	}

	$servicelib = TikiLib::lib('service');

	$smarty = TikiLib::lib('smarty');
	$smarty->assign('monitor_link', $params);
	return $smarty->fetch('monitor/notification_link.tpl');
}

