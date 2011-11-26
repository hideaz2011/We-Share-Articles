<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>

<?php
//$config =& JFactory::getConfig();
//$sef = $config->getValue( 'config.sef' );
//if ($sef == 1 ) { $amp = '?'; } else { $amp = '&'; }

//$display = $params->get('display');
//if ($display == 1){$display_mode =  $amp.'layout=blog';}
//if ($display == 2){$display_mode = '';}
?>
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