<?php
/**
 * This redirects to the site's root to prevent directory browsing.
 *  
 * @ignore 
 * @package TikiWiki 
 * @copyright (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
 * @licence Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
 */
// $Id: index.php 49810 2014-02-10 19:55:37Z jonnybradley $

require_once ('check_composer_exists.php');

require_once ('tiki-setup.php');
if ( ! headers_sent($header_file, $header_line) ) {
	// rfc2616 wants this to have an absolute URI
	header('Location: '.$base_url.$prefs['tikiIndex']);
} else {
	echo "Header already sent in ".$header_file." at line ".$header_line;
	exit();
}

