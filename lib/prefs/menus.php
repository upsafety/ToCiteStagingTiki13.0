<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: menus.php 50836 2014-04-19 15:09:27Z jonnybradley $

function prefs_menus_list()
{
	return array(
		'menus_items_icons' => array(
			'name' => tra('Menu icons'),
			'description' => tra('Allows icons to be defined for menu entries'),
			'type' => 'flag',
			'default' => 'n',
		),
		'menus_items_icons_path' => array(
			'name' => tra('Default path for the icons'),
            'description' => tra(''),
			'type' => 'text',
			'default' => 'img/icons/large',
		),
		'menus_item_names_raw_teaser' => array(
			'name' => tra('Allow HTML in menu option names and URLs'),
			'description' => tra('If enabled, menu option names and URL-s are treated as HTML content and they are not escaped (no replacement of HTML special characters). This allows the use of HTML to insert images for example. Code must be valid. This allows menu item editors to put arbitrary HTML; only enable if you know what you are doing.'),
			'help' => 'Menus',
			'type' => 'flag',
			'default' => 'n',
		),
		'menus_item_names_raw' => array(
			'name' => tra('REALLY allow HTML (INSECURE)'),
			'description' => tra('This needs to be checked for the parent preference to be actually enabled. This allows menu item editors to put arbitrary HTML, which could allow session hijacking; only enable if you know what you are doing.'),
			'help' => 'Menus',
			'dependencies' => array(
				'menus_item_names_raw_teaser',
			),
			'type' => 'flag',
			'default' => 'n',
		),
	);
}
