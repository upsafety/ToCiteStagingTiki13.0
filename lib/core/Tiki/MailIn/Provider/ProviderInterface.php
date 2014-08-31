<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
//
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: ProviderInterface.php 50766 2014-04-11 17:33:10Z lphuberdeau $

namespace Tiki\MailIn\Provider;

interface ProviderInterface
{
	function isEnabled();
	function getType();
	function getLabel();
	function getActionFactory(array $acc);
}
