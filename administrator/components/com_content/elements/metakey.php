<?php
/**
* @version		$Id: author.php 14401 2010-01-26 14:10:00Z louis $
* @package		Joomla
* @subpackage	Articles
* @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

/**
 * Renders a author element
 *
 * @package 	Joomla
 * @subpackage	Articles
 * @since		1.5
 */
class JElementMetakey extends JElement
{
	/**
	 * Element name
	 * @access	protected
	 * @var		string
	 */
	var	$_name = 'Metakey';

	function fetchElement($name, $value, &$node, $control_name)
	{
		return JHTML::_('list.metakey', $control_name.'['.$name.'][]', $value);
		
	}
}