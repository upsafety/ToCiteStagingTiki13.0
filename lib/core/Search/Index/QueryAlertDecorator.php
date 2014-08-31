<?php
// (c) Copyright 2002-2013 by authors of the Tiki Wiki CMS Groupware Project
// 
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
// $Id: QueryAlertDecorator.php 49853 2014-02-12 16:38:22Z lphuberdeau $

class Search_Index_QueryAlertDecorator extends Search_Index_AbstractIndexDecorator
{
	function addDocument(array $document)
	{
		$matches = $this->parent->getMatchingQueries($document);

		if (count($matches)) {
			$raw = TikiLib::lib('unifiedsearch')->getRawArray($document);
			foreach ($matches as $match) {
				list($priority, $id) = explode('-', $match, 2);
				TikiLib::events()->trigger('tiki.query.' . $priority, array(
					'query' => $id,
					'priority' => $priority,
					'user' => $GLOBALS['user'],
					'type' => $raw['object_type'],
					'object' => $raw['object_id'],
				));
			}
		}
		return $this->parent->addDocument($document);
	}
}

