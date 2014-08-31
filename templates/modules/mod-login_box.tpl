{* $Id: mod-login_box.tpl 51769 2014-06-29 01:26:10Z chibaguy $ *}
{jq notonready=true}
function capLock(e, el){
	kc = e.keyCode ? e.keyCode : e.which;
	sk = e.shiftKey ? e.shiftKey : (kc == 16 ? true : false);
	if ((kc >= 65 && kc <= 90 && !sk) || (kc >= 97 && kc <= 122 && sk)) {
		$('.divCapson', $(el).parents('div:first')).show();
	} else {
		$('.divCapson', $(el).parents('div:first')).hide();
	}
}
{/jq}
{jq}
$("#loginbox-{{$module_logo_instance}}").submit( function () {
	if ($("#login-user_{{$module_logo_instance}}").val() && $("#login-pass_{{$module_logo_instance}}").val()) {
		return true;
	} else {
		$("#login-user_{{$module_logo_instance}}").focus();
		return false;
	}
});
if (jqueryTiki.no_cookie) {
	$('.box-login_box input').each(function(){
		$(this).change(function() {
			if (jqueryTiki.no_cookie && $(this).val()) {
				alert(jqueryTiki.cookie_consent_alert);
			}
		});
	});
}
{/jq}
{if !isset($tpl_module_title)}{assign var=tpl_module_title value="{tr}Log in{/tr}"}{/if}{* Left for performance, since tiki-login_scr.php includes this template directly. *}
{if !isset($module_params)}{assign var=module_params value=' '}{/if}
{if isset($nobox)}{$module_params.nobox = $nobox}{/if}
{if isset($style)}{$module_params.style = $style}{/if}
{tikimodule error=$module_params.error title=$tpl_module_title name="login_box" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox notitle=$module_params.notitle style=$module_params.style}
	{if $mode eq "header"}<div class="siteloginbar{if $user} logged-in{/if}">{/if}
	{if $user}
		{if empty($mode) or $mode eq "module"}
			<div class="form-group">{tr}Logged in as:{/tr} <span style="white-space: nowrap">{$user|userlink}</span></div>
			<div class="text-center form-group">
				{button href="tiki-logout.php" _text="{tr}Log out{/tr}"}
			</div>
			{if $login_module.can_revert}
				<form action="{$login_module.login_url|escape}" method="post">
					<fieldset>
						<legend>{tr}Return to Main User{/tr}</legend>
						<input type="hidden" name="su" value="revert" />
						<input type="hidden" name="username" value="auto" />
						<div class="text-center"><button type="submit" class="btn btn-primary" name="actsu">{tr}Switch{/tr}</button></div>
					</fieldset>
				</form>
			{elseif $tiki_p_admin eq 'y'}
				<form action="{$login_module.login_url|escape}" method="post"{if $prefs.desactive_login_autocomplete eq 'y'} autocomplete="off"{/if} role="form">
					<fieldset>
						<legend>{tr}Switch User{/tr}</legend>
                        <div class="form-group">
						    <label for="login-switchuser_{$module_logo_instance}">{tr}Username:{/tr}</label>
						    <input type="hidden" name="su" value="1" class="form-control" />
						    {if $prefs.feature_help eq 'y'}
							    {help url="Switch+User" desc="{tr}Help{/tr}" desc="{tr}Switch User:{/tr}{tr}Enter user name and click 'Switch'.<br>Useful for testing permissions.{/tr}"}
						    {/if}
						    <input type="text" name="username" class="form-control" id="login-switchuser_{$module_logo_instance}" {* size="{if empty($module_params.input_size)}15{else}{$module_params.input_size}{/if}" *} />
                        </div>
                        <div class="text-center"><button type="submit" class="btn btn-primary" name="actsu">{tr}Switch{/tr}</button></div>
						{autocomplete element="#login-switchuser_"|cat:$module_logo_instance type="username"}
					</fieldset>
				</form>
			{/if}
		{elseif $mode eq "header"}
			<span style="white-space: nowrap">{$user|userlink}</span> <a href="tiki-logout.php" title="{tr}Log out{/tr}">{tr}Log out{/tr}</a>
		{elseif $mode eq "popup"}
			<div class="siteloginbar_popup dropdown pull-right">
				<a href="tiki-logout.php" class="dropdown-toggle login_link" data-toggle="dropdown">
					{tr}Log out{/tr}
                    <span class="caret"></span>
				</a>
				<ul class="clearfix dropdown-menu pull-right">
					<li>
						{$user|userlink}
					</li>
					<li>
						<a href="tiki-logout.php" title="{tr}Log out{/tr}">{tr}Log out{/tr}</a>
					</li>
				</ul>
			</div>
		{/if}
		{if $prefs.auth_method eq 'openid' and $openid_userlist|@count gt 1}
		<form method="get" action="tiki-login_openid.php">
			<fieldset>
				<legend>{tr}Switch user{/tr}</legend>
				<select name="select">
				{foreach item=username from=$openid_userlist}
					<option{if $username eq $user} selected="selected"{/if}>{$username}</option>
				{/foreach}
				</select>
				<input type="hidden" name="action" value="select"/>
				<input type="submit" class="btn btn-primary" value="{tr}Go{/tr}"/>
			</fieldset>
		</form>
		{/if}
	{elseif $prefs.auth_method eq 'cas' && $showloginboxes neq 'y'}
		<b><a class="linkmodule" href="tiki-login.php?cas=y">{tr}Log in through CAS{/tr}</a></b>
		{if $prefs.cas_skip_admin eq 'y'}
			<br><a class="linkmodule" href="tiki-login_scr.php?user=admin">{tr}Log in as admin{/tr}</a>
		{/if}
	{elseif $prefs.auth_method eq 'shib' && $showloginboxes neq 'y'}
		<b><a class="linkmodule" href="tiki-login.php">{tr}Log in through Shibboleth{/tr}</a></b>
		{if $prefs.shib_skip_admin eq 'y'}
			<br><a class="linkmodule" href="tiki-login_scr.php?user=admin">{tr}Log in as admin{/tr}</a>
		{/if}
	{else}
		{assign var='close_tags' value=''}
		{if $mode eq "popup"}
			<div class="siteloginbar_popup dropdown btn-group pull-right">
                <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
				    <a href="tiki-login.php"></a>
					    {tr}Log in{/tr}
					    <span class="caret"></span>
                </button>
				<div class="siteloginbar_poppedup {*panel panel-body*} dropdown-menu pull-right">
						{capture assign="close_tags"}</div></div></div></div>{$close_tags}{/capture}
		{/if}
		<form name="loginbox" class="form" id="loginbox-{$module_logo_instance}" action="{$login_module.login_url|escape}"
				method="post" {if $prefs.feature_challenge eq 'y'}onsubmit="doChallengeResponse()"{/if}
				{if $prefs.desactive_login_autocomplete eq 'y'} autocomplete="off"{/if}> 
		{if $prefs.feature_challenge eq 'y'}
			<script type='text/javascript' src="lib/md5.js"></script>
			{jq notonready=true}
function doChallengeResponse() {
	hashstr = document.loginbox.user.value +
				document.loginbox.pass.value +
				document.loginbox.email.value;
	str = document.loginbox.user.value + 
			MD5(hashstr) + document.loginbox.challenge.value;
	document.loginbox.response.value = MD5(str);
	document.loginbox.pass.value='';
	document.loginbox.submit();
	return false;
}
			{/jq}
			<input type="hidden" name="challenge" value="{$challenge|escape}" />
			<input type="hidden" name="response" value="" />
		{/if}
		{if !empty($urllogin)}<input type="hidden" name="url" value="{$urllogin|escape}" />{/if}
		{if $module_params.nobox neq 'y'}
			<fieldset>
				{capture assign="close_tags"}</fieldset>{$close_tags}{/capture}
		{/if}
		{if !empty($error_login)}
			{remarksbox type='errors' title="{tr}Error{/tr}"}
				{if $error_login == -5}{tr}Invalid username or password{/tr}
				{elseif $error_login == -3}{tr}Invalid username or password{/tr}
				{else}{$error_login|escape}{/if}
			{/remarksbox}
		{/if}
		<div class="user form-group">
			{if !isset($module_logo_instance)}{assign var=module_logo_instance value=' '}{/if}
			<label for="login-user_{$module_logo_instance}">{if $prefs.login_is_email eq 'y'}{tr}Email:{/tr}{else}{tr}Username:{/tr}{/if}</label>
			{if !isset($loginuser) or $loginuser eq ''}
				<input class="form-control" type="text" name="user" id="login-user_{$module_logo_instance}" {*size="{if empty($module_params.input_size)}15{else}{$module_params.input_size}{/if}"*} {if !empty($error_login)} value="{$error_user|escape}"{elseif !empty($adminuser)} value="{$adminuser|escape}"{/if}/>
				{jq}if ($('#login-user_{{$module_logo_instance}}:visible').length) {if ($("#login-user_{{$module_logo_instance}}").offset().top < $(window).height()) {$('#login-user_{{$module_logo_instance}}')[0].focus();} }{/jq}
			{else}
				<input class="form-control" type="hidden" name="user" id="login-user_{$module_logo_instance}" value="{$loginuser|escape}" /><b>{$loginuser|escape}</b>
			{/if}
		</div>
		{if $prefs.feature_challenge eq 'y'} <!-- quick hack to make challenge/response work until 1.8 tiki auth overhaul -->
			<div class="email form-group">
				<label for="login-email_{$module_logo_instance}">{tr}eMail:{/tr}</label>
				<input class="form-control" type="text" name="email" id="login-email_{$module_logo_instance}" {*size="{if empty($module_params.input_size)}15{else}{$module_params.input_size}{/if}"*} />
			</div>
		{/if}
		<div class="pass form-group">
			<label for="login-pass_{$module_logo_instance}">{tr}Password:{/tr}</label>
			<input onkeypress="capLock(event, this)" type="password" name="pass" class="form-control" id="login-pass_{$module_logo_instance}" size="{if empty($module_params.input_size)}15{else}{$module_params.input_size}{/if}" />
			<div class="divCapson" style="display:none;">
				{icon _id=error style="vertical-align:middle"} {tr}CapsLock is on.{/tr}
			</div>
		</div>
		{if $prefs.rememberme ne 'disabled' and (empty($module_params.remember) or $module_params.remember neq 'n')}
			{if $prefs.rememberme eq 'always'}
				<input type="hidden" name="rme" id="login-remember-module-input_{$module_logo_instance}" value="on" />
			{else}
			<div class="form-group">
				<div class="checkbox rme">
					<label for="login-remember-module_{$module_logo_instance}"><input type="checkbox" name="rme" id="login-remember-module_{$module_logo_instance}" value="on" />
{tr}Remember me{/tr}
					({tr}for{/tr}
					{if $prefs.remembertime eq 300}
						5 {tr}minutes{/tr})
					{elseif $prefs.remembertime eq 900}
						15 {tr}minutes{/tr})
					{elseif $prefs.remembertime eq 1800}
						30 {tr}minutes{/tr})
					{elseif $prefs.remembertime eq 3600}
						1 {tr}hour{/tr})
					{elseif $prefs.remembertime eq 7200}
						2 {tr}hours{/tr})
					{elseif $prefs.remembertime eq 36000}
						10 {tr}hours{/tr})
					{elseif $prefs.remembertime eq 72000}
						20 {tr}hours{/tr})
					{elseif $prefs.remembertime eq 86400}
						1 {tr}day{/tr})
					{elseif $prefs.remembertime eq 604800}
						1 {tr}week{/tr})
					{elseif $prefs.remembertime eq 2629743}
						1 {tr}month{/tr})
					{elseif $prefs.remembertime eq 31556926}
						1 {tr}year{/tr})
					{/if}
					</label>
				</div>
			</div>
			{/if}
		{/if}
		<div class="form-group text-center">
			<button class="btn btn-primary button submit" type="submit" name="login">{tr}Log in{/tr} <!--span class="glyphicon glyphicon-circle-arrow-right"></span--></button>
		</div>
		{if $module_params.show_forgot eq 'y' or $module_params.show_register eq 'y'}
			<div {if $mode eq 'header'}class="text-right" style="display:inline;"{/if}>
				{strip}
				{if $module_params.show_forgot eq 'y' && $prefs.forgotPass eq 'y'}
					<div class="navbar-default"><ul {if $mode eq 'popup'}class="navbar-nav"{/if}><li class="pass"><a {*class="linkmodule"*} href="tiki-remind_password.php" title="{tr}Click here if you've forgotten your password{/tr}">{tr}I forgot my password{/tr}</a></li>
				{/if}
				{if $module_params.show_register eq 'y' && $prefs.allowRegister eq 'y'}
						{if $mode eq 'header' && $module_params.show_forgot eq 'y' && $prefs.forgotPass eq 'y'}
							&nbsp;|&nbsp;
						{/if}
					<li class="register"><a {*class="linkmodule"*} href="tiki-register.php{if !empty($prefs.registerKey)}?key={$prefs.registerKey|escape:'url'}{/if}" title="{tr}Click here to register{/tr}">{tr}Register{/tr}</a></li></ul></div>
				{/if}
				{/strip}
			</div>
		{else}
			&nbsp;
		{/if}
		{if $prefs.feature_switch_ssl_mode eq 'y' && ($prefs.https_login eq 'allowed' || $prefs.https_login eq 'encouraged')}
			<div>
				<a class="linkmodule" href="{$base_url_http|escape}{$prefs.login_url|escape}" title="{tr}Click here to login using the default security protocol{/tr}">{tr}Standard{/tr}</a>
				<a class="linkmodule" href="{$base_url_https|escape}{$prefs.login_url|escape}" title="{tr}Click here to login using a secure protocol{/tr}">{tr}Secure{/tr}</a>
			</div>
		{/if}
		{if $prefs.feature_show_stay_in_ssl_mode eq 'y' && $show_stay_in_ssl_mode eq 'y'}
			<div>
				<label for="login-stayssl_{$module_logo_instance}">{tr}Stay in SSL mode:{/tr}</label>?
				<input type="checkbox" name="stay_in_ssl_mode" id="login-stayssl_{$module_logo_instance}" {if $stay_in_ssl_mode eq 'y'}checked="checked"{/if} />
			</div>
		{/if}
		{* This is needed as unchecked checkboxes are not sent. The other way of setting hidden field with same name is potentially non-standard *}
		<input type="hidden" name="stay_in_ssl_mode_present" value="y" />
		{if $prefs.feature_show_stay_in_ssl_mode neq 'y' || $show_stay_in_ssl_mode neq 'y'}
			<input type="hidden" name="stay_in_ssl_mode" value="{$stay_in_ssl_mode|escape}" />
		{/if}
		
		{if isset($use_intertiki_auth) and $use_intertiki_auth eq 'y'}
			<select name='intertiki'>
				<option value="">{tr}local account{/tr}</option>
				<option value="">-----------</option>
				{foreach key=k item=i from=$intertiki}
					<option value="{$k}">{$k}</option>
				{/foreach}
			</select>
		{/if}
			{if $prefs.socialnetworks_facebook_login eq 'y' and $mode neq "header" and empty($user)}
				<div style="text-align: center"><a href="tiki-socialnetworks.php?request_facebook=true"><img src="http://developers.facebook.com/images/devsite/login-button.png"></a></div>
			{/if}
		{$close_tags}
	</form>
			{if $prefs.auth_method eq 'openid' and !$user and (!isset($registration) || $registration neq 'y')}
				<form method="get" action="tiki-login_openid.php">
					<fieldset>
						<legend>{tr}OpenID Log in{/tr}</legend>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" name="openid_url"/>
								<span class="input-group-btn"><button type="submit" class="btn btn-default" title="{tr}Go{/tr}"><img alt="{tr}OpenID Login{/tr}" class="img-circle" src="img/icons/login-OpenID-bg.gif"></button></span>
							</div>
							<span class="help-block"><a class="linkmodule tikihelp" target="_blank" href="http://doc.tiki.org/OpenID">{tr}What is OpenID?{/tr}</a></span>
						</div>
					</fieldset>
				</form>
			{/if}
{/if}
{if $mode eq "header"}</div>{/if}
{/tikimodule}
