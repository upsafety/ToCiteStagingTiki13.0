{* $Id: tiki-information.tpl 48667 2013-11-22 13:55:11Z chibaguy $ *}
<div id="tiki-center">
<br>
<div class="panel panel-default">
	 <div class="panel-heading">
	 {tr}Information{/tr}
	 </div>

	<div class="alert alert-warning">
	{if is_array($msg)}
		{foreach from=$msg item=line}
	 		{$line|escape}<br>
	 	{/foreach}
	{else}
		{$msg|escape}
	{/if}
	</div>

	<p>

	{if $show_history_back_link eq 'y'}
		<a href="javascript:history.back()" class="linkmenu">{tr}Go back{/tr}</a><br><br>
	{/if}
	 &nbsp;<a href="{$prefs.tikiIndex}" class="linkmenu">{tr}Return to home page{/tr}</a>
	</p>
</div>
</div>
