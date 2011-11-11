<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<?php if($type == 'logout') : ?>
<form action="index.php" method="post" name="login" id="form-login">
<?php if ($params->get('greeting')) : ?>
	<div>
	<?php if ($params->get('name')) : {
		echo JText::sprintf( 'HINAME', $user->get('name') );
	} else : {
		echo JText::sprintf( 'HINAME', $user->get('username') );
	} endif; ?>
	</div>
<?php endif; ?>
	<div align="center">
		<input type="submit" name="Submit" class="button" value="<?php echo JText::_( 'BUTTON_LOGOUT'); ?>" />
	</div>

	<input type="hidden" name="option" value="com_user" />
	<input type="hidden" name="task" value="logout" />
	<input type="hidden" name="return" value="<?php echo $return; ?>" />
</form>
<?php else : ?>
<?php if(JPluginHelper::isEnabled('authentication', 'openid')) :
		$lang->load( 'plg_authentication_openid', JPATH_ADMINISTRATOR );
		$langScript = 	'var JLanguage = {};'.
						' JLanguage.WHAT_IS_OPENID = \''.JText::_( 'WHAT_IS_OPENID' ).'\';'.
						' JLanguage.LOGIN_WITH_OPENID = \''.JText::_( 'LOGIN_WITH_OPENID' ).'\';'.
						' JLanguage.NORMAL_LOGIN = \''.JText::_( 'NORMAL_LOGIN' ).'\';'.
						' var modlogin = 1;';
		$document = &JFactory::getDocument();
		$document->addScriptDeclaration( $langScript );
		JHTML::_('script', 'openid.js');
endif; ?>

	<div id="toppanel">
		<div id="panel">
        	<!--div id="panelL">
        	<div id="panelM">
            	<div id="panelR"-->
        	<div id="panelBR">
            	<div id="panelBL">
               		<div id="panelTR">
                    	<div id="panelTL">
                        
                     <div class="content clearfix">
			   <div id="dhtmlgoodies_tabView1">
					<div class="dhtmlgoodies_aTab">
		        <form action="<?php echo JRoute::_( 'index.php', true, $params->get('usesecure')); ?>" method="post" name="login" id="form-login" >
	<?php echo $params->get('pretext'); ?>
	<fieldset class="input">
    <p id="form-login-lostpassword">
    	<a href="<?php echo JRoute::_( 'index.php?option=com_user&view=reset' ); ?>">
		<?php echo JText::_('Lost Your password?'); ?></a>
	</p>

    <p id="form-login-username">
		<input id="modlgn_username" type="text" name="username" class="inputbox" alt="username" placeholder="Username" size="17" />
	</p>
	<p id="form-login-password">
			<input id="modlgn_passwd" type="password" name="passwd" class="inputbox"  placeholder="Password" size="17" alt="password" />
	</p>
    <!--p id="submit">Go</p-->
	<input type="submit" name="Submit" id ="submit" class="button" value="<?php echo JText::_('GO') ?>" />
	
	<?php if(JPluginHelper::isEnabled('system', 'remember')) : ?>
	<p id="form-login-remember">
		<input id="modlgn_remember" type="checkbox" name="remember" class="inputbox" value="yes" alt="Remember Me" />
  	</p>
   <p id="remember"><?php echo JText::_('Remember me') ?></p>
	
	<?php endif; ?>
	</fieldset>
	<div id="loginlogo">
    	<p id="orlogin">or</p>
    	<p id="loginimg">&nbsp;</p>
        
    </div>
    <div id="facebookimg">
    <p id="faceimg">&nbsp;</p>
    <p id="facetext"><a href="#">Login with facebook</a></p>
    </div>
    <!--ul>
				<li>
			<a href="<?php echo JRoute::_( 'index.php?option=com_user&view=remind' ); ?>">
			<?php echo JText::_('FORGOT_YOUR_USERNAME'); ?></a>
		</li>
		<?php
		$usersConfig = &JComponentHelper::getParams( 'com_users' );
		if ($usersConfig->get('allowUserRegistration')) : ?>
		<li>
			<a href="<?php echo JRoute::_( 'index.php?option=com_user&view=register' ); ?>">
				<?php echo JText::_('REGISTER'); ?></a>
		</li>
		<?php endif; ?>
	</ul-->
	<?php echo $params->get('posttext'); ?>

	<input type="hidden" name="option" value="com_user" />
	<input type="hidden" name="task" value="login" />
	<input type="hidden" name="return" value="<?php echo $return; ?>" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
	</div>
	<div class="dhtmlgoodies_aTab">
		<div id="Registerform">
        <ul>
        <li><p>
		<input id="modlgn_username" type="text" name="emailid" class="inputbox" alt="username" placeholder="E-mail id" size="28" /></p></li>
		
	<li><p>
			<input id="modlgn_passwd" type="password" name="passwd" class="inputbox"  placeholder="Password" size="17" alt="password" />
	</p></li>
    <li><p>
			<input id="modlgn_passwd" type="confirmpassword" name="confirmpasswd" class="inputbox"  placeholder="Confirm Password" size="17" alt="password" />
	</p></li>
    </ul>
    <p id="regimg">&nbsp;</p>
	</div>
    <div id="Register">
     <p id="regstext"><a href="#">Register Now</a></p>
         <p id="regsimg">&nbsp;</p>
    </div>
	</div>
    </div>
    </div>
<script type="text/javascript">
initTabs('dhtmlgoodies_tabView1',Array('Login','Register'),0,426,188,Array(true,true));
</script>
  
  
     </div>
     </div>
     </div>  
      </div>
      </div>
               

    <div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li id="toggle">
				<a id="open" class="open" href="#"><?php echo $_SESSION['id']?'Open Panel':'LogIn';?></a>
				<a id="close" style="display: none;" class="close" href="#">Close</a>			
			</li>
	    	<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div>



<?php endif; ?>