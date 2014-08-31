<h1><a class="pagetitle" href="tiki-admin_keywords.php">{tr}Admin keywords{/tr}</a></h1>

{if $keywords_updated}
	<div class="alert alert-warning">
		{if $keywords_updated == 'y'}{tr}Keywords have been updated{/tr} 
		{else}{tr}Updating keywords has failed. Page probably doesn't exist.{/tr}{/if}
		{if $keywords_updated_on} ({$keywords_updated_on|escape}){/if}
	</div>
{/if}
{if $edit_on}
	<div id="current_keywords" class="clearfix">
		<h2>{tr}Edit page keywords{/tr} ({$edit_keywords_page|escape})</h2>
		<form action="tiki-admin_keywords.php" method="post">
			<input name="page" value="{$edit_keywords_page|escape}" type="hidden">
			<table class="formcolor">
				<tbody>
					<tr>
						<td style="padding-right: 25px;">{tr}Keywords:{/tr}</td>
						<td><input name="new_keywords" size="65" value="{$edit_keywords|escape}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" class="btn btn-default btn-sm" name="save_keywords" value="{tr}Save{/tr}"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
{/if}

<h2>{tr}Current Page Keywords{/tr}</h2>
<form method="get" action="tiki-admin_keywords.php">
	<label for="q">{tr}Search by page:{/tr}</label>
	<input type="text" name="q" value="{if $smarty.request.q}{$smarty.request.q|escape}{/if}">
	<input type="submit" class="btn btn-default btn-sm" name="search" value="{tr}Go{/tr}">
</form>
{if $search_on}
	<strong>{$search_cant|escape} {tr}results found!{/tr}</strong>
{/if}

{if $existing_keywords}
<div class="table-responsive">
	<table class="table normal">
		<tbody>	
			<tr>
				<th>{tr}Page{/tr}</th>
				<th>{tr}Keywords{/tr}</th>
				<th>{tr}Actions{/tr}</th>	
			</tr>	

			{section name=i loop=$existing_keywords}
				<tr>
					<td class="text"><a href="{$existing_keywords[i].page|sefurl}">{$existing_keywords[i].page|escape}</a></td>
					<td class="text">{$existing_keywords[i].keywords|escape}</td>
					<td class="action">
						<a class="link" href="tiki-admin_keywords.php?page={$existing_keywords[i].page|escape:"url"}">{icon _id=page_edit}</a>
						<a class="link" href="tiki-admin_keywords.php?page={$existing_keywords[i].page|escape:"url"}&amp;remove_keywords=1">{icon _id=cross}</a>
					</td>	
				</tr>
			{/section}
		</tbody>
	</table>
    </div>
{else}
	<h2>{tr}No pages found{/tr}</h2>
{/if}

{pagination_links cant=$pages_cant step=$prefs.maxRecords offset=$offset}{/pagination_links}
