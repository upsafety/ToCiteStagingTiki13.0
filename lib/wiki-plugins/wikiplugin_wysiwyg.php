<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: wikiplugin_wysiwyg.php 51421 2014-05-20 17:30:55Z nkoth $

function wikiplugin_wysiwyg_info()
{
	return array(
		'name' => 'WYSIWYG',
		'documentation' => 'PluginWYSIWYG',
		'description' => tra('Permits to have a WYSIWYG section for part of a page.'),
		'prefs' => array('wikiplugin_wysiwyg'),
		'icon' => 'img/icons/mime/default.png',
		'tags' => array( 'experimental' ),
		'filter' => 'purifier',			/* N.B. uses htmlpurifier to ensure only "clean" html gets in */
		'format' => 'html',
		'body' => tra('Content'),
		'extraparams' => true,
		'params' => array(
			'width' => array(
				'required' => false,
				'name' => tra('Width'),
				'description' => tra('Minimum width for DIV. Default:500px'),
				'filter' => 'text',
				'default' => '500px',
			),
			'height' => array(
				'required' => false,
				'name' => tra('Height'),
				'description' => tra('Minimum height for DIV. Default:300px.'),
				'filter' => 'text',
				'default' => '300px',
			),
		),
	);
} // wikiplugin_wysiwyg_info()


function wikiplugin_wysiwyg($data, $params)
{
	// TODO refactor: defaults for plugins?
	$defaults = array();
	$plugininfo = wikiplugin_wysiwyg_info();
	foreach ($plugininfo['params'] as $key => $param) {
		$defaults["$key"] = $param['default'];
	}
	$params = array_merge($defaults, $params);

	global $tiki_p_edit, $page, $prefs, $user;
	static $execution = 0;

	global $wikiplugin_included_page;
	if (!empty($wikiplugin_included_page)) {
		$sourcepage = $wikiplugin_included_page;
	} else {
		$sourcepage = $page;
	}

	if ($prefs['wysiwyg_htmltowiki'] == 'y') {
		$is_html = false;
	} else {
		$is_html = true;
	}
	$html = TikiLib::lib('edit')->parseToWysiwyg( $data, true, $is_html, array('page' => $sourcepage) );

	if (TikiLib::lib('tiki')->user_has_perm_on_object( $user, $sourcepage, 'wiki page', 'tiki_p_edit')) {
		$class = "wp_wysiwyg";
		$exec_key = $class . '_' . ++ $execution;
		$style = " style='min-width:{$params['width']};min-height:{$params['height']}'";

		$params['section'] = empty($params['section']) ? 'wysiwyg_plugin' : $params['section'];
		$params['_wysiwyg'] = 'y';
		$params['is_html'] = $is_html;
		//$params['comments'] = true;
		$ckoption = TikiLib::lib('wysiwyg')->setUpEditor(true, $exec_key, $params, '', false);

		if ($prefs['namespace_enabled'] == 'y' && $prefs['namespace_force_links'] == 'y') {
			$namespace = TikiLib::lib('wiki')->get_namespace($sourcepage);
			if ($namespace) {
				$namespace .= $prefs['namespace_separator'];
			}
		} else {
			$namespace = '';
		}
		$namespace = htmlspecialchars($namespace);

		$html = "<div id='$exec_key' class='{$class}'$style data-initial='$namespace'>" . $html . '</div>';

		$js = '$("#' . $exec_key . '").wysiwygPlugin("' . $execution . '", "' . $sourcepage . '", ' . $ckoption . ')';

		TikiLib::lib('header')
			->add_jsfile('lib/ckeditor_tiki/tiki-ckeditor.js')
			->add_jq_onready($js);
	}
	return $html;

}

