<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: function.glyph.php 48373 2013-11-08 19:34:45Z lphuberdeau $

function smarty_function_glyph($params)
{
	if (! empty($params['name'])) {
		return "<span class=\"glyphicon glyphicon-{$params['name']}\"></span>";
	}
}

