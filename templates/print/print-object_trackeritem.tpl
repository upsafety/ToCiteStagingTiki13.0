<h1>{$title|escape}</h1>
<div class="table-responsive">
<table class="table normal">
	{foreach from=$tracker.fields item=field}
		<tr class="formcolor">
			<td class="formlabel">
				{$field.name|escape}
			</td>
			<td class="formcontent">
				{trackeroutput field=$field}
			</td>
		</tr>
	{/foreach}
</table>
</div>