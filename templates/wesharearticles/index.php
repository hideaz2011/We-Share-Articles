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
	 <script type="text/javascript" src="<?php echo $this->baseurl ?>/media/system/js/validate.js"></script>		
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
     
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/ajax.js"></script>
   	<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/slide.js"></script>
	<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/tab-view.js"></script>
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/wesharearticles/js/jquery.placeholder.js"></script>
    
    
    <!-- PNG FIX for IE6 -->
    <!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
    <!--[if lte IE 6]>
        <script type="text/javascript" src="login_panel/js/pngfix/supersleight-min.js"></script>
    <![endif]-->
    
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
    
    
    <link rel="stylesheet" type="text/css" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/slide.css" media="screen" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/tab-view.css" type="text/css" media="screen">
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/blueprint/screen.css" type="text/css" media="screen">
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/wesharearticles/css/blueprint/ie.css" type="text/css" media="screen">

	
    <?php echo $script; ?>

</head>
<body id="page_bg" class="color_<?php echo $this->params->get('colorVariation'); ?> bg_<?php echo $this->params->get('backgroundVariation'); ?> width_<?php echo $this->params->get('widthStyle'); ?>">
<a name="up" id="up"></a>
    <div class="container showgrid">
           <div id="wrapper" class="span-24 last">
				<div id="wrapper_t" class="span-24 last">
                   <div id="wrapper_tl" class="span-24 last">
                      <div id="wrapper_tr" class="span-24 last">
                        <div id="wrapper_top" class="span-24 last">
                            	<jdoc:include type="modules" name="top" />
                        </div>
                        <div id="submitarticle" class="span-19">
                            	  <div id="article" class="prepend-15 span-1">
                                	<img  id="logoimg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/sus-button-icon.png" />
                                  </div>
                                
                                  <div id="article1" class="span-3 last">
                            		<span class="articleimg"><a href="#">Submit an article</a></span>
                            	 </div>
                       </div>   
                  </div>
     			</div>
		</div>
				<div id="wrapper_m" class="span-24 last">
                	<div id="header" class="span-24 last">
                    			<div id="logo" class="prepend-1 span-9 last"><img  id="logoimg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/we-shere-logo.png" /></div>
                     </div>
                     <div id="tabarea" class="span-24">
                     	<div id="tabarea_l" class="span-1">&nbsp;</div>
                         	 <div id="pillmenu" class="span-6">
                              <jdoc:include type="modules" name="user3" />
                             </div>
                             <div id="searchbox" class="prepend-1 span-15">
                               <jdoc:include type="modules" name="user4" />
                             </div>
                        <div id="tabarea_r" class="span-1 last">&nbsp;</div>
                    </div>
					                  

                    <div id="pathway" class="span-24 last">
                        <jdoc:include type="modules" name="breadcrumb" />
                    </div>

					<div class="clr"></div>

                        <div id="whitebox_m" class="span-24 last">
                            <div id="area" class="span-24 last">
                                            <jdoc:include type="message" />
        
                                <div id="leftcolumn" class="span-5">
                                <?php if($this->countModules('left')) : ?>
                                    <jdoc:include type="modules" name="left" style="rounded" />
                                <?php endif; ?>
                                </div>
        
                                <?php if($this->countModules('left')) : ?>
                                <div id="maincolumn" class="span-19 main">
                                <?php else: ?>
                                <div id="maincolumn_full" class="prepnd-5 span-19">
                                <?php endif; ?>
                                    <?php if($this->countModules('user1 or user2')) : ?>
                                        <table class="nopad user1user2">
                                            <tr valign="top">
                                                <?php if($this->countModules('user1')) : ?>
                                                    <td>
                                                        <jdoc:include type="modules" name="user1" style="xhtml" />
                                                    </td>
                                                <?php endif; ?>
                                                <?php if($this->countModules('user1 and user2')) : ?>
                                                    <td class="greyline">&nbsp;</td>
                                                <?php endif; ?>
                                                <?php if($this->countModules('user2')) : ?>
                                                    <td>
                                                        <jdoc:include type="modules" name="user2" style="xhtml" />
                                                    </td>
                                                <?php endif; ?>
                                            </tr>
                                        </table>
        
                                        <div id="maindivider"></div>
                                    <?php endif; ?>
        								
                                    <table class="nopad class="span-19">
                                        <tr valign="top" class="span-19">
                                            
                                            <td>
                                               <jdoc:include type="component" />
                                                <jdoc:include type="modules" name="footer" style="xhtml"/>
                                            </td>
                                            <?php if($this->countModules('right') and JRequest::getCmd('layout') != 'form') : ?>
                                                <td class="greyline">&nbsp;</td>
                                                <td width="170">
                                                    <jdoc:include type="modules" name="right" style="xhtml"/>
                                                </td>
                                            <?php endif; ?>
                                        </tr>
                                    </table>
        
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="clr"></div>
                        </div>
        
                        
        
                    <div id="footerspacer" class="span-24 last"></div>
                </div>

                   
                
                
                <div id="wrapper_b" class="span-24 last">
					<div id="wrapper_bl" class="span-24 last">
						<div id="wrapper_br" class="span-24 last"></div>
					</div>
				</div>
                
            </div>
          </div>     
    
   
   </body>
</html>
