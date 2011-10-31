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
class ContentController extends JController
{
	/**
	 * Articles element
	 */
	function element()
	{
		$model	= &$this->getModel( 'element' );
		$view	= &$this->getView( 'element');
		$view->setModel( $model, true );
		$view->display();
	}
}
