<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: jquery.php 51844 2014-07-04 11:04:19Z jonnybradley $

function prefs_jquery_list($partial = false)
{

	global $prefs;

	$jquery_effect_options = array(
		''      => tra('Default'),
		'none'  => tra('None'),
		'slide' => tra('Slide'),
		'fade'  => tra('Fade'),
	);	

	if (! $partial && $prefs['feature_jquery_ui'] == 'y') {
		$jquery_effect_options['blind_ui'] = tra('Blind (UI)');
		$jquery_effect_options['clip_ui'] = tra('Clip (UI)');
		$jquery_effect_options['drop_ui'] = tra('Drop (UI)');
		$jquery_effect_options['explode_ui'] = tra('Explode (UI)');
		$jquery_effect_options['fold_ui'] = tra('Fold (UI)');
		$jquery_effect_options['puff_ui'] = tra('Puff (UI)');
		$jquery_effect_options['slide_ui'] = tra('Slide (UI)');
	}

	return array(
		'jquery_effect' => array(
			'name' => tra('Effect for modules'),
            'description' => tra(''),
			'type' => 'list',
			'options' => $jquery_effect_options,
			'help' => 'JQuery#Effects',
			'default' => '',				// Default effect for general show/hide: ['' | 'slide' | 'fade' | and
											// see http://docs.jquery.com/UI/Effects: 'blind' | 'clip' | 'explode' etc]
		),
		'jquery_effect_tabs' => array(
			'name' => tra('Effect for tabs'),
            'description' => tra(''),
			'type' => 'list',
			'options' => $jquery_effect_options,
			'help' => 'JQuery#Effects',
			'default' => 'slide',	// Different effect for tabs (['none' | 'normal' (for jq) | 'slide' etc]
		),
		'jquery_effect_speed' => array(
			'name' => tra('Speed'),
            'description' => tra(''),
			'type' => 'list',
			'options' => array(
				'fast' => tra('Fast'),
				'normal' => tra('Normal'),
				'slow' => tra('Slow'),
			),
			'default' => 'normal', 	// ['slow' | 'normal' | 'fast' | milliseconds (int) ]
		),
		'jquery_effect_direction' => array(
			'name' => tra('Direction'),
            'description' => tra(''),
			'type' => 'list',
			'options' => array(
				'vertical' => tra('Vertical'),
				'horizontal' => tra('Horizontal'),
				'left' => tra('Left'),
				'right' => tra('Right'),
				'up' => tra('Up'),
				'down' => tra('Down'),
			),
			'default' => 'vertical', 	// ['horizontal' | 'vertical' | 'left' | 'right' | 'up' | 'down' ]
		),
		'jquery_effect_tabs_speed' => array(
			'name' => tra('Speed'),
            'description' => tra(''),
			'type' => 'list',
			'options' => array(
				'fast' => tra('Fast'),
				'normal' => tra('Normal'),
				'slow' => tra('Slow'),
			),
			'default' => 'fast',
		),
		'jquery_effect_tabs_direction' => array(
			'name' => tra('Direction'),
            'description' => tra(''),
			'type' => 'list',
			'options' => array(
				'vertical' => tra('Vertical'),
				'horizontal' => tra('Horizontal'),
				'left' => tra('Left'),
				'right' => tra('Right'),
				'up' => tra('Up'),
				'down' => tra('Down'),
			),
			'default' => 'vertical',
		),
		'jquery_ui_chosen' => array(
			'name' => tra('jQuery-ui Chosen Menu'),
			'description' => tra('Styled replacement for dropdown select menus and multiple select inputs.'),
			'type' => 'flag',
			'default' => 'n',
			'dependencies' => array(
				'feature_jquery_ui',
			),
		),
		'jquery_ui_selectmenu' => array(
			'name' => tra('jQuery-ui Select Menu'),
			'description' => tra('Styled replacement for dropdown select menus.'),
			'type' => 'flag',
			'default' => 'n',
			'warning' => tra('Experimental. This plugin is deprecated in favor of "Chosen".'),
			'tags' => array('experimental'),
			'dependencies' => array(
				'feature_jquery_ui',
			),
		),
		'jquery_ui_selectmenu_all' => array(
			'name' => tra('Use Select Menu on all select elements'),
			'description' => tra('Applies jQuery-ui Select Menu to every select menu.'),
			'type' => 'flag',
			'default' => 'n',
			'tags' => array('experimental'),
			'warning' => tra('Experimental. This feature is under development.'),
			'dependencies' => array(
				'jquery_ui_selectmenu',
			),
		),
		'jquery_colorbox_theme' => array(
			'name' => tra('CSS to use in Colorbox (a.k.a. "Shadowbox")'),
            'description' => tra(''),
			'type' => 'list',
			'perspective' => false,
			'options' => array(
				'example1' => tra('One'),
				'example2' => tra('Two'),
				'example3' => tra('Three'),
				'example4' => tra('Four'),
				'example5' => tra('Five'),
			),
			'default' => 'example1',
			'dependencies' => array(
				'feature_shadowbox',
			),
		),
	);
}
