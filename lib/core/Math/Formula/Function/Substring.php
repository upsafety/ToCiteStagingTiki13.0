<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: Substring.php 51785 2014-07-01 14:09:05Z lphuberdeau $

class Math_Formula_Function_Substring extends Math_Formula_Function
{
	function evaluate( $element )
	{
		$args = [];

		foreach ( $element as $child ) {
			$args[] = $this->evaluateChild($child);
		}

		if (count($args) < 2) {
			$this->error('Not enough arguments');
		}

		return call_user_func_array('substr', $args);
	}
}

