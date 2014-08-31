<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: theme.php 51570 2014-06-03 06:14:20Z chibaguy $

//this script may only be included - so its better to die if called directly.
$access->check_script($_SERVER['SCRIPT_NAME'], basename(__FILE__));

if ( isset($_SESSION['try_style']) ) {
	$prefs['style'] = $_SESSION['try_style'];
} elseif ( $prefs['change_theme'] != 'y' && !isset($_SESSION['current_perspective'])) {
	// Use the site value instead of the user value if the user is not allowed to change the theme
	$prefs['style'] = $prefs['site_style'];
	$prefs['style_option'] = $prefs['site_style_option'];
}

// Always include default bootstrap JS
$headerlib->add_jsfile('vendor/twitter/bootstrap/dist/js/bootstrap.js');

$prefs['jquery_ui_chosen_css'] = 'y';

if ($prefs['feature_fixed_width'] === 'y') {
    $headerlib->add_css(
        '@media (min-width: 1200px) { .container { min-width:' .
        (!empty($prefs['layout_fixed_width']) ? $prefs['layout_fixed_width'] : '1170px') .
        '; } }'
    );
}

if (empty($prefs['theme_active']) || $prefs['theme_active'] == 'default') {
	$headerlib->add_cssfile('styles/layout/tiki.css');

	$headerlib->add_cssfile('vendor/twitter/bootstrap/dist/css/bootstrap.min.css');
} elseif ($prefs['theme_active'] == 'custom') {
	$headerlib->add_cssfile('styles/layout/tiki.css');

	$custom_theme = $prefs['theme_custom'];
	// Use external link if url begins with http://, https://, or // (auto http/https)
	if (preg_match('/^(http(s)?:)?\/\//', $custom_theme)) {
		$headerlib->add_cssfile($custom_theme, 'external');
	} else {
		$headerlib->add_cssfile($custom_theme);
	}
}   elseif ($prefs['theme_active'] == 'legacy') {
    // use legacy styles
	if ( $prefs['useGroupTheme'] == 'y' && $group_style = $userlib->get_user_group_theme()) {
		$prefs['style'] = $group_style;
		$smarty->assign_by_ref('group_style', $group_style);
	}
	if (empty($prefs['style']) || $tikilib->get_style_path('', '', $prefs['style']) == '') {
		$prefs['style'] = 'fivealive-lite.css';
	}

	if (!empty($prefs['style_admin']) && ($section === 'admin' || empty($section))) {		// use admin theme if set
		$prefs['style'] = $prefs['style_admin'];
		$prefs['style_option'] = $prefs['style_admin_option'];								// and its option
		$prefs['themegenerator_theme'] = '';												// and disable theme generator
	}

	$headerlib->add_cssfile($tikilib->get_style_path('', '', $prefs['style']), 51);
	$style_base = $tikilib->get_style_base($prefs['style']);

	// include optional "options" cascading stylesheet if set
	if ( !empty($prefs['style_option'])) {
		$style_option_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], $prefs['style_option']);
		if (!empty($style_option_css)) {
			$headerlib->add_cssfile($style_option_css, 52);
		}
	}
	// End legacy
} else {
//	$headerlib->add_cssfile("themes/{$prefs['theme_active']}/css/tiki.css");
	$prefs['jquery_ui_chosen_css'] = 'n';
}

// Allow to have a IE specific CSS files for the theme's specific hacks
$style_ie6_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], 'ie6.css');
$style_ie7_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], 'ie7.css');
$style_ie8_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], 'ie8.css');
$style_ie9_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], 'ie9.css');

// include optional "custom" cascading stylesheet if there
$custom_css = $tikilib->get_style_path($prefs['style'], $prefs['style_option'], 'custom.css');;
if ( !empty($custom_css)) {
	$headerlib->add_cssfile($custom_css, 53);
}
// Always use tiki.css.
$headerlib->add_cssfile("styles/layout/tiki.css");
$smarty->initializePaths();

