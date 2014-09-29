{* $Id: layout_view.tpl 52205 2014-07-31 16:21:16Z chibaguy $ *}<!DOCTYPE html>
<html lang="{if !empty($pageLang)}{$pageLang}{else}{$prefs.language}{/if}"{if !empty($page_id)} id="page_{$page_id}"{/if}>
	<head>
		{include file='header.tpl'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body {if $IsDashboard ne 1} {html_body_attributes} {/if} {if $IsDashboard eq 1} style="padding-top:0px;"{/if}>
		{$cookie_consent_html}
		{if $IsDashboard ne 1}
		{if $prefs.feature_ajax eq 'y'}
			{include file='tiki-ajax_header.tpl'}
		{/if}
		
        <div class="header_outer">
            <div class="header_container">
		        <header class="container header page-header">
			        <div class="row">
				        <div class="col-md-12">
					        {modulelist zone=top}
				        </div>
                    </div>
                </header>
			</div>
        </div>
		{/if}
        <div class="middle_outer">
            <div class="container clearfix middle" id="middle">
                {if $IsDashboard ne 1}
				<div id="tiki-top" class="topbar">
		        	<div class="row">
				        <div class="col-md-12">
					        {modulelist zone=topbar}
				        </div>
			        </div>
                </div>
				{/if}
                <div class="row">
   			        {if zone_is_empty('left') and zone_is_empty('right')}
                        {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
    			        <div {if $IsDashboard ne 1} class="col-md-12" {/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                                {modulelist zone=pagetop}
                            {/if}
							{error_report}
					        {block name=title}{/block}
                            {block name=navigation}{/block}
					        {block name=content}{/block}
                            {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                                {modulelist zone=pagebottom}
                            {/if}
				        </div>
                        {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
			        {elseif zone_is_empty('left')}
                    {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
				        <div {if $IsDashboard ne 1}class="col-md-9"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                                {modulelist zone=pagetop}
                            {/if}
							{error_report}
					        {block name=title}{/block}
                            {block name=navigation}{/block}
					        {block name=content}{/block}
                            {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                                {modulelist zone=pagebottom}
                            {/if}
				        </div>
                    {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
				        {if $IsDashboard ne 1}
						<div class="col-md-3" id="col3">
					        {modulelist zone=right}
				        </div>
						{/if}
			        {elseif zone_is_empty('right')}
                        {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
				        <div {if $IsDashboard ne 1}class="col-md-9 col-md-push-3"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                                {modulelist zone=pagetop}
                            {/if}
							{error_report}
					        {block name=title}{/block}
                            {block name=navigation}{/block}
					        {block name=content}{/block}
                            {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                                {modulelist zone=pagebottom}
                            {/if}
				        </div>
                        {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
                        {if $IsDashboard ne 1}
						<div class="col-md-3 col-md-pull-9" id="col2">
                            {modulelist zone=left}
                            </div>
						{/if}
			        {else}
                    {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
			        <div {if $IsDashboard ne 1}class="col-md-6 col-md-push-3"{/if} {if $IsDashboard eq 1} style="left:0%; width:100%" {/if} id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						{error_report}
					        {block name=title}{/block}
                            {block name=navigation}{/block}
					        {block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
				    </div>
                        {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
                        {if $IsDashboard ne 1}
						<div class="col-md-3 col-md-pull-6" id="col2">
                            {modulelist zone=left}
                        </div>
                        <div class="col-md-3" id="col3">
		    		        {modulelist zone=right}
				        </div>
						{/if}
			        {/if}
			    </div>
            </div>
		</div>
                {if $IsDashboard ne 1}
				<footer class="footer" id="footer">
                    <div class="footer_liner">
                        <div class="footerbgtrap container">
		        	        <div class="row">
				                <div class="col-md-12">
					                {modulelist zone=bottom}
				                </div>
                            </div>
                        </div>
			        </div>
		        </footer>

		{include file='footer.tpl'}
		{/if}
		{if isset($prefs.socialnetworks_user_firstlogin) && $prefs.socialnetworks_user_firstlogin == 'y'}
			{include file='tiki-socialnetworks_firstlogin_launcher.tpl'}
		{/if}

		{if $prefs.site_google_analytics_account}
			{wikiplugin _name=googleanalytics account=$prefs.site_google_analytics_account}{/wikiplugin}
		{/if}

		{interactivetranslation}
		<!-- Put JS at the end -->
		{if $headerlib}
			{$headerlib->output_js_config()}
			{$headerlib->output_js_files()}
			{$headerlib->output_js()}
		{/if}
        {if $prefs.feature_endbody_code}
            {eval var=$prefs.feature_endbody_code}
        {/if}
	</body>
</html>
{if !empty($smarty.request.show_smarty_debug)}
	{debug}
{/if}
