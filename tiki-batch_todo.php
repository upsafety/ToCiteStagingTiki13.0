<?php
/**
 * @package tikiwiki
 */
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: tiki-batch_todo.php 51050 2014-04-29 20:28:26Z lphuberdeau $

include('tiki-setup.php');
$todolib = TikiLib::lib('todo');

$access->check_feature('feature_trackers');	// TODO add more features as the lib does more

$todos = $todolib->listTodoObject();
foreach ($todos as $todo) {
	$todolib->applyTodo($todo);
}

