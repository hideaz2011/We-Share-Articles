<?php
/**
 * @version		$Id: controller.php 11633 2009-02-19 23:59:09Z willebil $
 * @package		Joomla
 * @subpackage	Content
 * @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant to the
 * GNU General Public License, and as distributed it includes or is derivative
 * of works licensed under the GNU General Public License or other free or open
 * source software licenses. See COPYRIGHT.php for copyright notices and
 * details.
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.controller');

/**
 * Content Component Controller
 *
 * @package		Joomla
 * @subpackage	Content
 * @since 1.5
 */
class AkseoController extends JController
{
	/**
	 * Add keyword
	 */
	 
	function editTags()
	{		
    	JRequest::checkToken() or die( 'Invalid Token' );
    	
    	//$user =& JFactory::getUser();
    	//$model =& $this->getModel('akseo');
    	
    	$id = JRequest::getInt('artid');
    	$newTag = JRequest::getWord('newTag');
    	$tagArray = JRequest::getVar('tags','','post','array');
    	$tagEdit = JRequest::getInt('tagEdit');
    	
		$row = & JTable::getInstance('content');
		$row->load($id);
		
		//if tags selected, remove from keywords
		if(isset($tagArray) AND !empty($tagArray)) {
			$keywordArray = explode(",", $row->metakey);
			$newKeys = array_diff($keywordArray,$tagArray);
			$row->metakey = implode(",", $newKeys);
		}
		
		if(isset($newTag)) {
	    	$row->metakey = $row->metakey.', '.$newTag;
		}
		
		if(isset($newTag) OR isset($newKeys)) {
			if(!$row->save($row)) {
				return JError::raiseWarning( 500, $row->getError() );
			}
		}
    	
    	//$article = $model->getOptions($user->id);
    	
		return plgSystemAddKeywords::tagList($row,$addkeyParams=null,$tagEdit,$ajax=1);
	}
}