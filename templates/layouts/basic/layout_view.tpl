{* $Id: layout_view.tpl 48366 2013-11-08 16:12:24Z lphuberdeau $ *}<!DOCTYPE html>
<html lang="{if !empty($pageLang)}{$pageLang}{else}{$prefs.language}{/if}"{if !empty($page_id)} id="page_{$page_id}"{/if}>
	<head>
		{include file='header.tpl'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body {if $IsDashboard ne 1} {html_body_attributes} {/if} {if $IsDashboard eq 1} {/if}style="padding-top:0px;"{/if}>
		{$cookie_consent_html}

		{if $prefs.feature_ajax eq 'y'}
			{include file='tiki-ajax_header.tpl'}
		{/if}
		
		<div class="container">
			{if $IsDashboard ne 1}
            <div class="row page-header">
				<div class="col-md-12">
					{modulelist zone=top}
                </div>
			</div>
			<div class="row">
				<div class="col-md-12">
					{modulelist zone=topbar}
				</div>
			</div>
			{/if}
			<div class="row">
				{if zone_is_empty('left') and zone_is_empty('right')}
					 <div {if $IsDashboard ne 1} class="col-md-12" {/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
				{elseif zone_is_empty('left')}
					<div {if $IsDashboard ne 1}class="col-md-9"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					{if $IsDashboard ne 1}
					<div class="col-md-3" id="col3">
						{modulelist zone=right}
					</div>
					{/if}
				{elseif zone_is_empty('right')}
					<div {if $IsDashboard ne 1}class="col-md-9 col-md-push-3"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					{if $IsDashboard ne 1}
					<div class="col-md-3 col-md-pull-9" id="col2">
						{modulelist zone=left}
					</div>
					{/if}
				{else}
					<div {if $IsDashboard ne 1}class="col-md-8 col-md-push-2"{/if}{if $IsDashboard eq 1} style="left:0%; width:100%" {/if} id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					{if $IsDashboard ne 1}
					<div class="col-md-2 col-md-pull-8" id="col2">
						{modulelist zone=left}
					</div>
					<div class="col-md-2" id="col3">
						{modulelist zone=right}
					</div>
					{/if}
				{/if}
			</div>

			<div class="row">
				<div class="col-md-12 well">
					{modulelist zone=bottom}
				</div>
			</div>
		</div>

		{include file='footer.tpl'}
	</body>
</html>
{if !empty($smarty.request.show_smarty_debug)}
	{debug}
{/if}
