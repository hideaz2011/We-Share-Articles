<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<div class="backgd">
<div class="sectionheading">&nbsp;</div>
<div class="sec1">
<h3>Section</h3>
<ul class="mod_sec<?php echo $params->get('moduleclass_sfx'); ?>"><?php
foreach ($list as $item) :
?>
 
<li>
	<a href="<?php echo JRoute::_(ContentHelperRoute::getSectionRoute($item->id)); //echo $display_mode;?>">
			<?php
        
        $menus = &JSite::getMenu();
        
        $currentMenu  = $menus->getActive();
        
        $menuOption=$currentMenu->query['option'];
        
        if($menuOption=='com_content'){
        
        $menuView=$currentMenu->query['view'];
        
        //if($menuView=='section'){
        
        //$secid=$currentMenu->query['id'];
        
        echo "<img src=\"./images/section/".$item->id.".png\">";
        
        //}else
        
        //echo "<img src=\"./templates/frontpage/images/header/frontpage.png\">";
        
        }

?>
	<?php echo $item->title;?>
    <?php echo $counter; ?>
    </a>
</li>

<?php endforeach; ?>
</ul>
<div class="moresec"><a href="#"><img id="limg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/d-ws.jpg" />More Categories<a/></div>
</div>
</div>