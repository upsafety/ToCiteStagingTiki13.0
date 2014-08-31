{* $Id: tiki-send_objects.tpl 49314 2014-01-06 07:30:33Z chibaguy $ *}

{title help="Communication+Center"}{tr}Send objects{/tr}{/title}

{if $msg}
	<div class="panel panel-default">
		<div class="panel-heading">
			{tr}Transmission results{/tr}
		</div>
		<div class="panel-body">
			{$msg}
		</div>
	</div>
{/if}

<br>
<br>

<form method="post" action="tiki-send_objects.php">
	<div class="panel panel-default">
		<div class="panel-heading">
			{tr}Filter{/tr}
		</div>
		<div class="panel-body">
			{tr}Filter:{/tr}<input type="text" name="find" value="{$find|escape}"><input type="submit" class="btn btn-default btn-sm" name="filter" value="{tr}Filter{/tr}"><br>
		</div>
	</div>
	
	<br>
	<br>

	{if $tiki_p_send_pages eq 'y'}
		<div class="panel panel-default">
			<div class="panel-heading">
				{tr}Send Wiki Pages{/tr}
			</div>
			<div class="panel-body">
				<div class="panel panel-default"><div class="panel-body">
					<b>{tr}Pages{/tr}</b>:
					{section name=ix loop=$sendpages}
						{$sendpages[ix]}&nbsp;
					{/section}
				</div></div>
				<select name="pageName">
					{section name=ix loop=$pages}
						<option value="{$pages[ix].pageName|escape}">{$pages[ix].pageName|escape}</option>
					{/section}
				</select>
				<input type="submit" class="btn btn-default btn-sm" name="addpage" value="{tr}Add Page{/tr}">
				<input type="submit" class="btn btn-default btn-sm" name="clearpages" value="{tr}Clear{/tr}">
			</div>
		</div>

	<br>
	<br>

		{if count($structures)}
			<div class="panel panel-default">
				<div class="panel-heading">
					{tr}Send a structure{/tr}
				</div>
					<div class="panel panel-default"><div class="panel-body">
						<b>{tr}Structures{/tr}</b>:
						{section name=ix loop=$sendstructures_names}
							{$sendstructures_names[ix]}&nbsp;
						{/section}
					</div></div>
					<select name="structure">
						{foreach item=struct from=$structures}
							<option value="{$struct.page_ref_id|escape}">{$struct.pageName|escape}{if $struct.page_alias} (alias: {$struct.page_alias}){/if}</option>
						{/foreach}
					</select>
					<input type="submit" class="btn btn-default btn-sm" name="addstructure" value="{tr}Add Structure{/tr}">
					<input type="submit" class="btn btn-default btn-sm" name="clearstructures" value="{tr}Clear{/tr}">
				</div>
			</div>
		{/if}
	{/if}
	
	<br>
	<br>

	{if $tiki_p_send_articles eq 'y'}
		<div class="panel panel-default">
			<div class="panel-heading">
				{tr}Send Articles{/tr}
			</div>
			<div class="panel panel-default">
                <div class="panel-body">
				    <b>{tr}Articles{/tr}</b>:
				    {section name=ix loop=$sendarticles}
				    {$sendarticles[ix]}&nbsp;
					{/section}
				</div>
            </div>
				<select name="articleId">
					{section name=ix loop=$articles}
						<option value="{$articles[ix].articleId|escape}">{$articles[ix].articleId}: {$articles[ix].title|escape}</option>
					{/section}
				</select>
				<input type="submit" class="btn btn-default btn-sm" name="addarticle" value="{tr}Add Article{/tr}">
				<input type="submit" class="btn btn-default btn-sm" name="cleararticles" value="{tr}Clear{/tr}">
			</div>
		</div>
	{/if}

	<br>
	<br>

	<div class="panel panel-default">
		<div class="panel-heading">
			{tr}Send objects to this site{/tr}
		</div>
		<div class="panel-body">
			<input type="hidden" name="sendpages" value="{$form_sendpages|escape}">
			<input type="hidden" name="sendstructures" value="{$form_sendstructures|escape}">
			<input type="hidden" name="sendarticles" value="{$form_sendarticles|escape}">
			<table class="formcolor">
				<tr>
					<td>{tr}Site:{/tr}</td>
					<td>
						<input type="text" name="site" value="{$site|escape}">
						<br>
						<i>{tr}Ex: http://tiki.org or localhost{/tr}</i>
					</td>
				</tr>
				<tr>
					<td>{tr}Path:{/tr}</td>
					<td>
						<input type="text" name="path" value="{$path|escape}">
						<br>
						<i>{tr}Use /commxmlrpc.php if your Tiki site is installed at the root, otherwise adapt /tiki to your need{/tr}</i>
					</td>
				</tr>
				<tr>
					<td>{tr}Username:{/tr}</td>
					<td><input type="text" name="username" value="{$username|escape}"></td>
				</tr>
				<tr>
					<td>{tr}Password:{/tr}</td>
					<td><input type="password" name="password" value="{$password|escape}"></td>
				</tr>
				<tr>
					<td>{tr}Debug:{/tr}</td>
					<td><input type="checkbox" name="dbg"{if $dbg eq 'on'} checked="checked"{/if}></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" class="btn btn-default btn-sm" name="send" value="{tr}Send{/tr}"></td>
				</tr>
			</table>
		</div>
	</div>
</form>
