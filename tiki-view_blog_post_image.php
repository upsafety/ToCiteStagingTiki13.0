<?php
/**
 * @package tikiwiki
 */
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: tiki-view_blog_post_image.php 51052 2014-04-29 21:05:47Z lphuberdeau $

require_once ('tiki-setup.php');

$access->check_feature('feature_blogs');

$bloglib = TikiLib::lib('blog');
if (!isset($_REQUEST['imgId'])) {
	die;
}
$info = $bloglib->get_post_image($_REQUEST['imgId']);
$type = & $info['filetype'];
$file = & $info['filename'];
$content = & $info['data'];
header("Content-type: $type");
header("Content-Disposition: inline; filename=$file");
echo $content;
