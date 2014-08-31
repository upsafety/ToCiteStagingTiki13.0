<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: storedsearch.php 49174 2013-12-19 18:34:03Z lphuberdeau $

function prefs_storedsearch_list()
{
	return array(
		'storedsearch_enabled' => array(
			'name' => tr('Stored Searches'),
			'description' => tr('Allow users to store search queries.'),
			'type' => 'flag',
			'default' => 'n',
		),
	);
}

