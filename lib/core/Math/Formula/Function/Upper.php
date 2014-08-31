<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: Upper.php 51785 2014-07-01 14:09:05Z lphuberdeau $

class Math_Formula_Function_Upper extends Math_Formula_Function
{
	function evaluate( $element )
	{
		$out = "";

		foreach ( $element as $child ) {
			$out .= strtoupper($this->evaluateChild($child));
		}

		return $out;
	}
}

