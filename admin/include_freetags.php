<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: include_freetags.php 50998 2014-04-25 14:09:57Z lphuberdeau $

// This script may only be included - so its better to die if called directly.

require_once ('tiki-setup.php');
$access->check_script($_SERVER["SCRIPT_NAME"], basename(__FILE__));
if (isset($_REQUEST["freetagsfeatures"])) {
	check_ticket('admin-inc-freetags');
}

if (isset($_REQUEST["cleanup"])) {
	check_ticket('admin-inc-freetags');
	$freetaglib = TikiLib::lib('freetag');
	$freetaglib->cleanup_tags();
}

if (isset($_REQUEST["morelikethisoptions"])) {
	check_ticket('admin-inc-freetags');
}

if (isset($_REQUEST["freetagsset3d"])) {
	check_ticket('admin-inc-freetags');
}

$headerlib->add_cssfile('css/admin.css');
ask_ticket('admin-inc-freetags');
