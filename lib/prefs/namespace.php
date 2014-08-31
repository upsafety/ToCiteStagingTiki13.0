<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: namespace.php 50755 2014-04-11 03:08:31Z nkoth $

function prefs_namespace_list()
{
	return array(
		'namespace_enabled' => array(
			'name' => tr('Namespace'),
			'description' => tr('Enable namespaces for wiki pages.'),
			'type' => 'flag',
			'default' => 'n',
			'help' => 'Namespace',
			'keywords' => 'Namespaces',
			'tags' => array('experimental'),
			'perspective' => false,
		),
		'namespace_separator' => array(
			'name' => tr('Namespace separator'),
			'description' => tra(''),
			'size' => 5,
			'type' => 'text',
			'default' => ':_:',
			'keywords' => 'Namespaces',
			'perspective' => false,
		),
		'namespace_default' => array(
			'name' => tr('Default namespace'),
			'description' => tr('Namespace to use when creating wiki pages. Should be defined within perspectives.'),
			'type' => 'text',
			'default' => '',
			'detail' => tra('This should only be set for perspectives, and not globally.'),
		),
		'namespace_indicator_in_structure' => array(
			'name' => tra('Hide namespace indicator in structure path'),
			'description' => tra('Hide namespace indicator in structure path.'),
			'type' => 'flag',
			'default' => 'n',
		),
		'namespace_force_links' => array(
			'name' => tra('Force all non-namespace page links to same namespace'),
			'description' => tra('If the current page is in a namespace, all links without namespace will have it added automatically'),
			'type' => 'flag',
			'default' => 'n',
		),
	);	
}
