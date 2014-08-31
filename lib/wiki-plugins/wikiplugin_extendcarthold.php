<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: wikiplugin_extendcarthold.php 51051 2014-04-29 20:50:51Z lphuberdeau $

function wikiplugin_extendcarthold_info()
{
	return array(
		'name' => tra('Extend Cart Inventory Hold'),
		'documentation' => tra('PluginExtendCartHold'),
		'description' => tra('Extends the time that items are held in the shop before timing out'),
		'prefs' => array('wikiplugin_extendcarthold', 'payment_feature'),
		'filter' => 'wikicontent',
		'format' => 'html',
		'tags' => array( 'experimental' ),		
		'params' => array(
		),
	);
}

function wikiplugin_extendcarthold( $data, $params )
{
	$cartlib = TikiLib::lib('cart');
	$cartlib->extend_onhold_list(); 
} 
			
