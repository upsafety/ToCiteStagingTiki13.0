<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: Eval.php 49197 2013-12-20 16:34:03Z lphuberdeau $

class Math_Formula_Function_Eval extends Math_Formula_Function
{
	function evaluate( $element )
	{
		$out = array();

		foreach ( $element as $child ) {
			$out[] = $this->evaluateChild($child);
		}

		return implode(' ', $out);
	}
}

