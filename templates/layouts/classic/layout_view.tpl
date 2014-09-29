{* $Id: layout_view.tpl 51626 2014-06-11 08:25:39Z chibaguy $ *}<!DOCTYPE html>
<html lang="{if !empty($pageLang)}{$pageLang}{else}{$prefs.language}{/if}"{if $prefs.feature_bidi eq 'y'} dir="rtl"{/if}{if !empty($page_id)} id="page_{$page_id}"{/if}>
	<head>
		{include file='header.tpl'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body {if $IsDashboard ne 1} {html_body_attributes} {/if} {if $IsDashboard eq 1} {/if}style="padding-top:0px;"{/if}>
		{$cookie_consent_html}

		{if $prefs.feature_ajax eq 'y'}
			{include file='tiki-ajax_header.tpl'}
		{/if}
        {if $prefs.feature_layoutshadows eq 'y'}<div id="main-shadow">{eval var=$prefs.main_shadow_start}{/if}
            {if $prefs.feature_layoutshadows eq 'y'}<div id="header-shadow">{eval var=$prefs.header_shadow_start}{/if}
                {if $IsDashboard ne 1}
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
            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.header_shadow_end}</div>{/if}
            <div class="middle_outer">
                <div class="container clearfix middle" id="middle">
                    <div id="tiki-top" class="topbar">
		        	    <div class="row">
				            <div class="col-md-12">
					            {modulelist zone=topbar}
				            </div>
			            </div>
                    </div>
                    <div class="row">
   			        {if zone_is_empty('left') and zone_is_empty('right')}
    			        <div {if $IsDashboard ne 1} class="col-md-12" {/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
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
                            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
				        </div>
			        {elseif zone_is_empty('left')}
				        <div {if $IsDashboard ne 1}class="col-md-9"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
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
                            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
				        </div>
				        <div class="col-md-3" id="col3">
					        {modulelist zone=right}
						</div>
			        {elseif zone_is_empty('right')}
				        <div {if $IsDashboard ne 1}class="col-md-9 col-md-push-3"{/if} id="col1" {if $IsDashboard eq 1} style="left:0%; width:100%" {/if}>
                            {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
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
                            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
				        </div>
						{if $IsDashboard ne 1}
                        <div class="col-md-3 col-md-pull-9" id="col2">
                            {modulelist zone=left}
                        </div>
						{/if}
			        {else}
		    	        <div {if $IsDashboard ne 1}class="col-md-8 col-md-push-2"{/if}{if $IsDashboard eq 1} style="left:0%; width:100%" {/if} id="col1">
                            {if $prefs.feature_layoutshadows eq 'y'}<div id="tiki-center-shadow">{eval var=$prefs.center_shadow_start}{/if}
                            {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                                {modulelist zone=pagetop}
                            {/if}
                            {error_report}
					        {block name=title}{/block}
							{block name=navigation}{/block}
					        {block name=content}{/block}
							{if $IsDashboard ne 1}
                            {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                                {modulelist zone=pagebottom}
                            {/if}
							{/if}
                            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.center_shadow_end}</div>{/if}
    		            </div>
						{if $IsDashboard ne 1}
                        <div class="col-md-2 col-md-pull-8" id="col2">
                            {modulelist zone=left}
                        </div>
						{/if}
						{if $IsDashboard ne 1}
                        <div class="col-md-2" id="col3">
	       		            {modulelist zone=right}
			            </div>
						{/if}
		            {/if}
					</div>
	            </div>
            </div>
            {if $prefs.feature_layoutshadows eq 'y'}<div id="footer-shadow">{eval var=$prefs.footer_shadow_start}{/if}
                {if $IsDashboard ne 1}
				<footer class="footer" id="footer">
				
                    <div class="footer_liner">
                        <div class="footerbgtrap container">
		        	        <div class="row">
				                <div class="col-md-12">
					               <!-- {modulelist zone=bottom}-->
								   United Public Safety / Ph. 215-394-1906 / Fax. 215-394-1908 /<a href='mailto:support@upsafety.net'>
            support@upsafety.net</a> / <a target="_blank" href="http://www.upsafety.net">www.upsafety.net</a>
				                </div>
                            </div>
                        </div>
			        </div>
		        </footer>
				{/if}
            {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.footer_shadow_end}</div>{/if}
        {if $prefs.feature_layoutshadows eq 'y'}{eval var=$prefs.main_shadow_end}</div>{/if}

		{include file='footer.tpl'}
	</body>
</html>
{if !empty($smarty.request.show_smarty_debug)}
	{debug}
{/if}
