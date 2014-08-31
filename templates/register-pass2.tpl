{* $Id: register-pass2.tpl 50934 2014-04-23 22:29:25Z luciash $ *}
{if $prefs.user_register_prettytracker eq 'y' and $prefs.user_register_prettytracker_tpl}
	<input id='pass2' type="password" name="passAgain" onkeypress="regCapsLock(event)">
	&nbsp;<strong class='mandatory_star'>*</strong>
{else}
	{if $openid_associate neq 'y'}
		<div class="form-group">
			<label class="col-md-4 col-sm-3 control-label" for="pass2">{tr}Repeat password:{/tr}</label>
			{if $trackerEditFormId}&nbsp;<strong class='mandatory_star'>*</strong>&nbsp;{/if}
			<div class="col-md-4 col-sm-6">
				<input class="form-control" id='pass2' type="password" name="passAgain" onkeypress="regCapsLock(event)" value="{if !empty($smarty.post.passAgain)}{$smarty.post.passAgain}{/if}"
					   onkeyup="{if $prefs.feature_jquery_validation neq 'y' && !$userTrackerData}checkPasswordsMatch('#pass2', '#pass1', '#mypassword2_text');{/if}">
				<div style="float:right;margin-left:5px;">
					<div id="mypassword2_text"></div>
				</div>
				{if $prefs.feature_jquery_validation neq 'y' && !$userTrackerData}<span id="checkpass"></span>{/if}
			</div>
		{if $prefs.generate_password eq 'y'}
				{*if !$reg_in_module}<td>&nbsp;</td>{/if*}
				<div class="col-md-4 col-sm-3 text-center{*if $reg_in_module} inmodule{/if*}">
					<input id='genepass' name="genepass" type="text" tabindex="0" style="display: none">
					<span id="genPass">
						{if 0 and $prefs.feature_ajax eq 'y'}
							{button href="#" _onclick="check_pass();" _text="{tr}Generate a password{/tr}"}
						{else}
							{button href="#" _onclick="" _text="{tr}Generate a password{/tr}"}
						{/if}
					</span>
				</div>
		{/if}
		</div>
	{/if}
{/if}
