<?php
/**
* @version		$Id: helper.php 11074 2008-10-13 04:54:12Z ian $
* @package		Joomla
* @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
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
        $document = & JFactory::getDocument();
        $LiveSite = JURI::base();

        $style = $params->get('style', 1);
        //$document->addCustomTag('<link rel="stylesheet" href="'.$LiveSite.'modules/mod_sections/style1.css" type="text/css" media="all"/>');

		$db		=& JFactory::getDBO();
		$user	=& JFactory::getUser();

		$contentConfig 	= &JComponentHelper::getParams( 'com_content' );
		$access	= !$contentConfig->get('show_noauth');
		$gid 	= $user->get('aid', 0);

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
			' WHERE published = 1 AND id > 1' . 
			($access ? ' AND access <= '.(int) $gid : '') .
			' GROUP BY id '.
			$disp_empty .
			' ORDER BY '.$order;
        //$count	= intval($params->get('count', 10));
		$db->setQuery($query, 0, $count);
		$rows = $db->loadObjectList();
		
        //$count = count( $rows );
        // number of Active Categories
    	/*for ( $i = 0; $i < $count; $i++ ) {
    		$query = 'SELECT COUNT( a.id )'
    		. ' FROM #__categories AS a'
    		. ' WHERE a.section = '.$db->Quote($rows[$i]->id)
    		. ' AND a.published <> -2'
    		;
    		$db->setQuery( $query );
    		$active = $db->loadResult();
    		$rows[$i]->categories = $active;
    	}
        // number of Active Items
    	for ( $i = 0; $i < $count; $i++ ) {
    		$query = 'SELECT COUNT( a.id )'
    		. ' FROM #__content AS a'
    		. ' WHERE a.sectionid = '.(int) $rows[$i]->id
    		. ' AND a.state <> -2'
    		;
    		$db->setQuery( $query );
    		$active = $db->loadResult();
    		$rows[$i]->active = $active;
    	}*/

		return $rows;
	}
}
