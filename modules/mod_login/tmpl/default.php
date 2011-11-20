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
	<script type="text/javascript">

		Window.onDomReady(function(){
			document.formvalidator.setHandler('passverify', function (value) { 
				return (document.getElementById('password').value == value); 
			}	);
		
		});

	</script>


			<?php
                if(isset($this->message)){
                    $this->display('message');
                }
            ?>
	
	
	<script type="text/javascript">
							   d(document).ready(function() {
								   
                                   initTabs('dhtmlgoodies_tabView1',Array('Login','Register'),0,400,230);
								   d('#tabViewdhtmlgoodies_tabView1_0').css("height","205px").css("overflow","hidden");
								   d('#tabViewdhtmlgoodies_tabView1_1').css("height","205px").css("overflow","hidden");
								   d('#dhtmlgoodies_tabView1').css("overflow","hidden").css("height","230px");
							   		
							   });
                                                            
    </script>
    
    

	<div id="toppanel" class="span-11 last">
		<div id="panel" class="span-11 last">
        	<div id="panelBR"  class="span-11 last">
            	<div id="panelBL"  class="span-11 last">
               		<div id="panelTR"  class="span-11 last">
                    	<div id="panelTL"  class="span-11 last">
                           <div id="panelcont" class="content clearfix span-11 last" >
                           	  <div id="panelinnerdiv" class="span-11">
                                 	<div id="dhtmlgoodies_tabView1">
                                       <div class="dhtmlgoodies_aTab">
                                        	<div id="divtop">&nbsp;</div>
                                            	
                                                <form action="<?php echo JRoute::_( 'index.php', true, $params->get('usesecure')); ?>" method="post" name="login" id="form-login" >
                                                    <?php echo $params->get('pretext'); ?>
                                                              <div id="lostyourpassword" class="prepend-4 span-3 last">
                                                                    <a href="<?php echo JRoute::_( 'index.php?option=com_user&view=reset' ); ?>">
                                                                    <?php echo JText::_('Lost Your Password?'); ?></a>
                                                               </div>
                                                           
                                                               <div class="span-10 last login"> 
                                                                    <div id="form-login-username" class="prepend-1 span-3 ">       
                                                                    
                                                                        <input id="modlgn_username" type="text" name="username" class="inputbox" placeholder="<?php echo JText::_('Email') ?>"  alt="username"  />
                                                                     </div>
                                                                    <div id="form-login-password" class="span-3">
                                                                        <input id="modlgn_passwd" type="password" name="passwd" class="inputbox"  placeholder="<?php echo JText::_('Password') ?>" alt="password" />
                                                                    </div>
                                                                    <div id="submitbutton" class="span-1 last">
                                                                        <input id="submit" type="submit" name="Submit" class="button" value="<?php echo JText::_('GO') ?>" />			</div>
                                                                        
                                                              </div>  
                                                              <div class="span-10 last login">
                                                                 <?php if(JPluginHelper::isEnabled('system', 'remember')) : ?>
                                                                <div id="form-login-remember" class="prepend-1 span-3 last">
                                                                <input id="modlgn_remember" type="checkbox" name="remember" class="input" value="yes" alt="Remember Me" />
                                                                <span class="modlgn_remember"><?php echo JText::_('Remember me') ?></span>												<?php endif; ?>
                                                                </div>                                                            </div>
                                                                
                                                             <div class="span-10 last login">
                                                                <div id="ortext" class="prepend-3 span-1 login">or</div>
                                                                <div id="loginimg" class="prepend-3 span-3 last login"><img src="<?php echo JURI::base()?>/templates/wesharearticles/images/login-icon.png" /></div>
                                                            </div>
                                                      
                                                      
                                                            <div class="login prepend-1 span-5 ">
                                                                <div class="prepend-1 span-5 login" id="faceimgdiv"><a href="#" class="facelink">Login with facebook</a></div>
                                                            </div>  
                                                            <?php echo $params->get('posttext'); ?>
                                                            <input type="hidden" name="option" value="com_user" />
                                                            <input type="hidden" name="task" value="login" />
                                                            <input type="hidden" name="return" value="<?php echo $return; ?>" />
                                                            <?php echo JHTML::_( 'form.token' ); ?>
                                                            
                                                            
                                           </form>
								</div>                                       
                                  
                                <div class="dhtmlgoodies_aTab">
                                   <div id="divtop">&nbsp;</div>
                                     <form action="<?php echo JRoute::_( 'index.php?option=com_user' ); ?>" method="post" id="josForm" name="josForm" class="form-validate">
                                                	<div id="register" class="span-7">
                                                    	<div id="emailid" class="prepend-1 span-6 last">
                                                        	<input type="text" id="email" name="email" size="40" value="" class="inputbox required validate-email reg" placeholder="<?php echo JText::_( 'Email' ); ?>" premaxlength="100" /> 
                                                    	</div>
                                                        <div id="password1" class="prepend-1 span-6 last">
                                                        	<input class="inputbox required validate-password reg" type="password" id="password" name="password" size="40" value="" placeholder="<?php echo JText::_( 'Password' );?>"  />
                                                        </div>
                                                        
                                                        <div id="confirmpassword" class="prepend-1 span-6 last ">
                                                        	<input class="inputbox required validate-passverify reg" type="password" id="password2" name="password2" size="40" value="" placeholder="<?php echo JText::_( 'Confirm Password' );?> />
                                                        </div>
                                                        <div class="prepend-1 span-6">
                                                        	<div class="span-4 reg"><button id="imgdiv" class="button validate" type="submit"><span class="regtext"><?php echo JText::_('Register Now'); ?></span></button></div>
                                                        </div>
                                                    </div>
                                                    <div id="regimgdiv" class="span-3 last">
                                             			<img  id="regimg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/Register-icon.png" />
                                          			</div>
                                                    
                                                <input type="hidden" name="task" value="register_save" />
                                                <input type="hidden" name="id" value="0" />
                                                <input type="hidden" name="gid" value="0" />
                                                <?php echo JHTML::_( 'form.token' ); ?>
                                                                                               
                                          </form>       
                                                    
                               </div>
                                        
                               <div id="divbottom">
                               		<img  id="logoimg" src="<?php echo JURI::base()?>/templates/wesharearticles/images/white-bg-bottom-l.png" />
                               </div>      
                               
                                 
                       </div>
                   </div>
                 </div>
               </div>
             </div>
           </div>             
        </div>    
     </div>
                        <div id="tab" class="prepend-6 span-5 append-1 last">
                             <ul class="login">
                                 <li class="left">&nbsp;</li>
                                 <li id="toggle">
                                     <a id="open" class="open" href="#"><?php echo $_SESSION['id']?'Open Panel':'LogIn';?></a>
                                     <a id="close" style="display: none;" class="close" href="#">Close</a>			
                                 </li>
                                 <li class="right">&nbsp;</li>
                            </ul> 
                       </div> <!-- / top -->
          
		  <?php endif; ?>          
			
			
         
</div>   
			<script>
                jQuery('input[placeholder], textarea[placeholder]').placeholder();
     		</script> 