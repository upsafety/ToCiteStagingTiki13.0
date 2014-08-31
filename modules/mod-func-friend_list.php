<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: mod-func-friend_list.php 50214 2014-03-05 13:20:56Z lphuberdeau $

//this script may only be included - so its better to die if called directly.
if (strpos($_SERVER["SCRIPT_NAME"], basename(__FILE__)) !== false) {
  header("location: index.php");
  exit;
}

/**
 * @return array
 */
function module_friend_list_info()
{
	return array(
		'name' => tra('Friend List'),
		'description' => tra('Displays a list of friends'),
		'prefs' => array('feature_friends'),
		'params' => array(
		),
	);
}

/**
 * @param $mod_reference
 * @param $module_params
 */
function module_friend_list($mod_reference, $module_params)
{
	// Template does everyting
}

