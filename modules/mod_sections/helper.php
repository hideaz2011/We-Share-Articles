<?php
/**
* @version		$Id: helper.php 14401 2010-01-26 14:10:00Z louis $
* @package		Joomla
* @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

/// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php');

class modSectionsHelper
{
	function getList(&$params)
	{
		global $mainframe;

		$db		=& JFactory::getDBO();
		$user	=& JFactory::getUser();

		$count	= intval($params->get('count', 20));
		$contentConfig 	= &JComponentHelper::getParams( 'com_content' );
		$access	= !$contentConfig->get('show_noauth');

		$gid 		= $user->get('aid', 0);
		$now		= date('Y-m-d H:i:s', time() + $mainframe->getCfg('offset') * 60 * 60);
		$nullDate	= $db->getNullDate();


	 $ordering = intval($params->get('ordering', 1));
        if ($ordering == 1){ $order = 'ordering';}
        if ($ordering == 2){ $order = 'title ASC';}
        if ($ordering == 3){ $order = 'title DESC';}
		if ($ordering == 4){ $order = 'id ASC';}

        $display_empty = intval($params->get('display_empty', 0));
        if ($display_empty == 0){ $disp_empty = 'HAVING COUNT( id ) > 0';}
        if ($display_empty == 1){ $disp_empty = 'HAVING COUNT( id ) >= 0';}
		$query = 'SELECT id, title' .
			' FROM #__sections' .
			' WHERE published = 1' .
			($access ? ' AND access <= '.(int) $gid : '') .
			' GROUP BY id '.
			$disp_empty .
			' ORDER BY '.$order;
		$db->setQuery($query, 0, $count);
		$rows = $db->loadObjectList();

		return $rows;
	}
}
