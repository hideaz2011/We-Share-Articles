<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<html>
<head>
<title>Signup Form - Advanced Ajax Validation with Captcha</title>
<link rel="stylesheet" type="text/css" href="plugins/ajaxform/css.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="./includes/js/validate.js"></script>
<script type="text/javascript">

	$.validator.addMethod('myEqual', function (value, element) {
     if ($('#password-password').val() == $('#password-password-confirm').val()) {
	 	  return true;
	 }    else return false;
	}, 'Your password does not match.');




  $(document).ready(function() {

     $('#password-clear').show();
	$('#password-password').hide();

	$('#password-clear').focus(function() {
		$('#password-clear').hide();
		$('#password-password').show();
		$('#password-password').focus();
	});
	$('#password-password').blur(function() {
		if($('#password-password').val() == '') {
			$('#password-clear').show();
			$('#password-password').hide();
		}
	});

        $('#password-clear-confirm').show();
	$('#password-password-confirm').hide();

	$('#password-clear-confirm').focus(function() {
		$('#password-clear-confirm').hide();
		$('#password-password-confirm').show();
		$('#password-password-confirm').focus();
	});
	$('#password-password-confirm').blur(function() {
		if($('#password-password-confirm').val() == '') {
			$('#password-clear-confirm').show();
			$('#password-password-confirm').hide();
		}
	});

  
	var validator = $("#signupform").validate({

		//ignore: ".ignore",

		rules: {

			username: {
				required: true,
				minlength: 5
			},

			
			password: {
				required: true,
				minlength: 5
			},
			passwordconfirm: {
				required: true,
				minlength: 5,
				myEqual: true
			},

			email: {
				required: true,
				email: true
			}
		},
		messages: {
			

				username: {
				required: "Enter a username",
				minlength: jQuery.format("Enter at least {0} characters"),
				
			},
			password: {
				required: "Provide a password",
				rangelength: jQuery.format("Enter at least {0} characters")
			},
			passwordconfirm: {
				required: "Provide a password",
				rangelength: jQuery.format("Enter at least {0} characters")
			},
		email: {
				required: "Please enter a valid email address",
				minlength: "Please enter a valid email address"
			}

			
		},
		// the errorPlacement has to take the table layout into account
		errorPlacement: function(error, element) {
			if ( element.is(":radio") )
				error.appendTo( element.parent().next().next() );
			else if ( element.is(":checkbox") )
				error.appendTo ( element.next() );
			else

				error.appendTo( element.parent().next() );
		},

                submitHandler: function() {
			alert("submitted!");
		},

		// specifying a submitHandler prevents the default submit, good for the demo
		// set this class to error-labels to indicate valid fields
		success: function(label) {
			// set &nbsp; as text for IE
			label.html("").addClass("checked");
                          //  form.submit();
		}
	});
        
  });
</script>
<script language="JavaScript" src="jquery-1.7.min.js" type="text/javascript"></script>
<script>
var url = '<?php echo JURI::base(); ?>components/com_user/views/register/tmpl/myphp.php';
function checkCaptcha($val) {
	//alert($val);
	var request = $.ajax({
	  url: url,
	  type: "POST",
	  data: {textboxvalue : $val},
	  success: function(data) {
		$('#returnmessage').html(data);
		//alert(data);
	  }
	});

}
</script>
</head>
    <body>

					<form  name="signup" id="signupform" method="post">
					
						<p class="signUpText"><input type="text" name="username" value="Username" onFocus="if(this.value=='Username'){this.value=''}" onBlur="if(this.value==''){this.value='Username'}"/></p><div class="status"></div>
					<p class="signUpText"><input type="text" name="email" value="Email Address"  onfocus="if(this.value=='Email Address'){this.value=''}" onBlur="if(this.value==''){this.value='Email Address'}"/></p><div class="status"></div>
						<p class="signUpText"><input id="password-clear" type="text" name="notused" value="Password" autocomplete="off" />
						
						<input id="password-password" type="password" name="password"  autocomplete="off" />

						</p><div class="status"></div>
						<p class="signUpText">
						<input id="password-clear-confirm" type="text" name="notused1" value="Confirm Password" autocomplete="off" />
						
						<input id="password-password-confirm" type="password" name="passwordconfirm" autocomplete="off" />
						
						</p>
						
<div id="returnmessage" style="border:#F00 solid">captcha message</div>
<label for="captcha">Type the text from the image</label>
<div>
<img id="siimage" style="border: 1px solid #000; margin-right: 15px" src="./plugins/captcha/securimage_show.php?sid=<?php echo md5(uniqid()) ?>" alt="CAPTCHA Image" align="left">
    <object type="application/x-shockwave-flash" data="./plugins/captcha/securimage_play.swf?audio_file=./plugins/captcha/securimage_play.php&amp;bgColor1=#fff&amp;bgColor2=#fff&amp;iconColor=#777&amp;borderWidth=1&amp;borderColor=#000" height="32" width="32">
    <param name="movie" value="./captcha/securimage_play.swf?audio_file=./plugins/captcha/securimage_play.php&amp;bgColor1=#fff&amp;bgColor2=#fff&amp;iconColor=#777&amp;borderWidth=1&amp;borderColor=#000">
    </object>
    &nbsp;
    <a tabindex="-1" style="border-style: none;" href="#" title="Refresh Image" onClick="document.getElementById('siimage').src = './plugins/captcha/securimage_show.php?sid=' + Math.random(); this.blur(); return false"><img src="./plugins/captcha/images/refresh.png" alt="Reload Image" onClick="this.blur()" align="bottom" border="0"></a><br />
    <strong>Enter Code*:</strong><br />
     <?php echo @$_SESSION['ctform']['captcha_error'] ?>
    <input type="text" name="ct_captcha" size="12" maxlength="8" onChange="checkCaptcha(this.value);" />
</div>
						
						<p class="clearfix">
							
							<span class="rfloat">
							<input class="submit" type="submit" value="Submit">
							</span>
						</p>
<input type="hidden" name="task" value="register_save" />
	<input type="hidden" name="id" value="0" />
	<input type="hidden" name="gid" value="0" />
					</form>
      			
</body>
</html>