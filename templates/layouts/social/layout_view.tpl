{* $Id: layout_view.tpl 48366 2013-11-08 16:12:24Z lphuberdeau $ *}<!DOCTYPE html>
<html lang="{if !empty($pageLang)}{$pageLang}{else}{$prefs.language}{/if}"{if !empty($page_id)} id="page_{$page_id}"{/if}>
	<head>
		{include file='header.tpl'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body{html_body_attributes class="navbar-padding"}>
		{$cookie_consent_html}

		{if $prefs.feature_ajax eq 'y'}
			{include file='tiki-ajax_header.tpl'}
		{/if}
		
		<div class="container">

			<div class="row">
				{if zone_is_empty('left') and zone_is_empty('right')}
					<div class="col-md-12" id="col1">
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
				{elseif zone_is_empty('left')}
					<div class="col-md-9" id="col1">
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-3" id="col3">
						{modulelist zone=right}
					</div>
				{elseif zone_is_empty('right')}
					<div class="col-md-9 col-md-push-3" id="col1">
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-3 col-md-pull-9" id="col2">
						{modulelist zone=left}
					</div>
				{else}
					<div class="col-md-8 col-md-push-2" id="col1">
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-2 col-md-pull-8" id="col2">
						{modulelist zone=left}
					</div>
					<div class="col-md-2" id="col3">
						{modulelist zone=right}
					</div>
				{/if}
			</div>

			<div class="row">
				<div class="col-md-12 well">
					{modulelist zone=bottom}
				</div>
			</div>
		</div>

		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="./">
                        {if $prefs.sitelogo_icon}
                            <img src="{$prefs.sitelogo_icon}" style="max-height: 100%;" /> 
                        {/if}
                        {$prefs.sitetitle|escape}</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					{if $prefs.feature_search eq 'y'}
						<form class="navbar-form navbar-left" role="search" action="tiki-searchindex.php">
							<div class="form-group">
								<input name="filter~content" type="search" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">{glyph name=search}</button>
						</form>
					{/if}
					<ul class="nav navbar-nav navbar-right">
						{if $user}
							<li>{notification_link}</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">{tr}Account{/tr} <b class="caret"></b></a>
								<ul class="dropdown-menu">
									{* TODO : Add more links here *}
									<li class="divider"></li>
                                    <li><a href="tiki-user_preferences.php">{tr}Preferences{/tr}</a></li>
									<li><a href="{if $prefs.feature_sefurl eq 'y'}logout{else}tiki-logout.php{/if}">{tr}Log out{/tr}</a></li>
								</ul>
							</li>
						{else}
							<li><a href="{if $prefs.feature_sefurl eq 'y'}login{else}tiki-login_scr.php{/if}">{tr}Log in{/tr}</a></li>
							{if $prefs.allowRegister eq 'y'}
								<li><a href="{if $prefs.feature_sefurl eq 'y'}register{else}tiki-register.php{/if}">{tr}Register{/tr}</a></li>
							{/if}
						{/if}
					</ul>
				</div>
			</div>
		</nav>

		{include file='footer.tpl'}
	</body>
</html>
{if !empty($smarty.request.show_smarty_debug)}
	{debug}
{/if}
