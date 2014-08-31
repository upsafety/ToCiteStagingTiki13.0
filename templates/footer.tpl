{* $Id: footer.tpl 51385 2014-05-19 16:15:37Z jonnybradley $ *}
{* ==> put in this file what is not displayed in the layout (javascript, debug..)*}
<div id="bootstrap-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		</div>
	</div>
</div>
{if (! isset($display) or $display eq '')}
	{if count($phpErrors)}
		{if ($prefs.error_reporting_adminonly eq 'y' and $tiki_p_admin eq 'y') or $prefs.error_reporting_adminonly eq 'n'}
		{button _ajax="n" _id="show-errors-button" _onclick="flip('errors');return false;" _text="{tr}Show php error messages{/tr}"}
		<div id="errors" class="alert alert-warning" style="display:{if (isset($smarty.session.tiki_cookie_jar.show_errors) and $smarty.session.tiki_cookie_jar.show_errors eq 'y') or $prefs.javascript_enabled ne 'y'}block{else}none{/if};">
			&nbsp;{listfilter selectors='#errors>div'}
			{foreach item=err from=$phpErrors}
				{$err}
			{/foreach}
		</div>
		{/if}
	{/if}

	{if $tiki_p_admin eq 'y' and $prefs.feature_debug_console eq 'y'}
		{* Include debugging console.*}
		{debugger}
	{/if}

{/if}

{if isset($prefs.socialnetworks_user_firstlogin) && $prefs.socialnetworks_user_firstlogin == 'y'}
	{include file='tiki-socialnetworks_firstlogin_launcher.tpl'}
{/if}

{if $prefs.site_google_analytics_account}
	{wikiplugin _name=googleanalytics account=$prefs.site_google_analytics_account}{/wikiplugin}
{/if}
{if $prefs.feature_endbody_code}
	{eval var=$prefs.feature_endbody_code}
{/if}
{interactivetranslation}
<!-- Put JS at the end -->
{if $headerlib}
	{$headerlib->output_js_config()}
	{$headerlib->output_js_files()}
	{$headerlib->output_js()}
{/if}
