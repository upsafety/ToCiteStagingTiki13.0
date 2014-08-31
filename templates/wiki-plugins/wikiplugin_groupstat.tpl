{* $Id: wikiplugin_groupstat.tpl 49297 2014-01-02 15:07:29Z chibaguy $ *}
<div class="table-responsive">
<table class="table normal">
<tr>
<th>{tr}Group Name{/tr}</th>
<th>{tr}Number of Users{/tr}</th>
<th>{tr}Percentage of Total{/tr}</th>
</tr>

{foreach from=$stats item=stat}
	{if $stat.group ne 'Anonymous' and $stat.group ne 'Registered'}
		<tr>
		<td>{$stat.group|escape}</td>
		<td>{$stat.nb}</td>
		<td>
			{if $params.show_bar eq 'y'}
				{if !empty($stat.percent)}
					{quotabar length=$stat.percent}
				{/if}
			{else}
				{$stat.percent|string_format:"%.2f"}%
			{/if}
		</td>
		</tr>
	{/if}
{/foreach}
</table>
</div>