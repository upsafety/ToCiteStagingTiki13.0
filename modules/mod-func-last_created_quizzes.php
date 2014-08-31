<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: mod-func-last_created_quizzes.php 44444 2013-01-05 21:24:24Z changi67 $

//this script may only be included - so its better to die if called directly.
if (strpos($_SERVER["SCRIPT_NAME"], basename(__FILE__)) !== false) {
  header("location: index.php");
  exit;
}

/**
 * @return array
 */
function module_last_created_quizzes_info()
{
	return array(
		'name' => tra('Newest Quizzes'),
		'description' => tra('Displays the specified number of quizzes from newest to oldest.'),
		'prefs' => array("feature_quizzes"),
		'params' => array(),
		'common_params' => array('nonums', 'rows')
	);
}

/**
 * @param $mod_reference
 * @param $module_params
 */
function module_last_created_quizzes($mod_reference, $module_params)
{
	global $tikilib, $smarty;
	$ranking = TikiLib::lib('quiz')->list_quizzes(0, $mod_reference["rows"], 'created_desc', '');
	
	$smarty->assign('modLastCreatedQuizzes', $ranking["data"]);
}