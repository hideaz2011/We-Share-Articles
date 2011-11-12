<?php
defined('_JEXEC') or die('Restricted access'); 
jimport( 'joomla.plugin.plugin' );
session_start();	
include_once $_SERVER['DOCUMENT_ROOT'] . '/plugins/captcha/securimage.php';

//echo $_SERVER['DOCUMENT_ROOT'] . '/test1/captcha/securimage.php';

$securimage = new Securimage();
if ($securimage->check($_POST['textboxvalue']) == false) {
  echo "The security code entered was incorrect.<br /><br />";
}
?>