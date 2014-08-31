<?php
/**
 * This redirects to the site's root to prevent directory browsing.
 *  
 * @ignore 
 * @package TikiWiki
 * @subpackage db
 * @copyright (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
 * @licence Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
 */
// $Id: index.php 49696 2014-02-04 12:53:04Z lphuberdeau $

// This redirects to the sites root to prevent directory browsing
header("location: ../tiki-index.php");
die;
