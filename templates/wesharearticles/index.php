<?php
/**
 * @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant
 * to the GNU General Public License, and as distributed it includes or
 * is derivative of works licensed under the GNU General Public License or
 * other free or open source software licenses.
 * See COPYRIGHT.php for copyright notices and details.
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
<jdoc:include type="head" />

<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/template.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/<?php echo $this->params->get('colorVariation'); ?>.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/<?php echo $this->params->get('backgroundVariation'); ?>_bg.css" type="text/css" />
<!--[if lte IE 6]>
<link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/ieonly.css" rel="stylesheet" type="text/css" />
<![endif]-->
<?php if($this->direction == 'rtl') : ?>
	<link href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/template_rtl.css" rel="stylesheet" type="text/css" />
<?php endif; ?>
	<link rel="stylesheet" type="text/css" href="demo.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/slide.css" media="screen" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/tab-view.css" type="text/css" media="screen">
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/tab-view.css" type="text/css" media="screen">
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/blueprint/screen.css" type="text/css" media="screen">
    
	<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/ajax.js"></script>
    <script>
		var burl = "<?php echo $this->baseurl ?>";
	</script>
    
	<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/tab-view.js"></script>
    
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    
    <!-- PNG FIX for IE6 -->
    <!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
    <!--[if lte IE 6]>
        <script type="text/javascript" src="login_panel/js/pngfix/supersleight-min.js"></script>
    <![endif]-->
    
    <script src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/slide.js" type="text/javascript"></script>
    
    <?php echo $script; ?>

</head>
<body id="page_bg" class="color_<?php echo $this->params->get('colorVariation'); ?> bg_<?php echo $this->params->get('backgroundVariation'); ?> width_<?php echo $this->params->get('widthStyle'); ?>">
<a name="up" id="up"></a>
    <div class="container showgrid">
          <div id="wrapper" class="span-24 last">
            <div id="wrapper_r" class="span-24 last">
                <div id="header" class="span-24 last">
                    <div id="header_l" class="span-24 last">
                        <div id="header_r" class="span-24">
                        	<div id="logo" class="prepend-1 span-9"><img  id="logoimg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/we-shere-logo.png" /></div>
                              <jdoc:include type="modules" name="top" />
                              </div>
                         </div>
                    </div>
                </div>
            </div>
       </div>
</body>
</html>
