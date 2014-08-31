{* $Id: attachments_tracker.tpl 49297 2014-01-02 15:07:29Z chibaguy $ *}
{strip}
{if $print_page ne 'y' and $tiki_p_attach_trackers eq 'y'}
	<h2>{tr}Attach a file to this item{/tr}</h2>
	<form enctype="multipart/form-data" action="tiki-view_tracker_item.php" method="post" class="form-horizontal" role="form">
		<input type="hidden" name="trackerId" value="{$trackerId|escape}">
		<input type="hidden" name="itemId" value="{$itemId|escape}">
		<input type="hidden" name="attId" value="{$attId|escape}">
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">
				{tr}Upload file{/tr}
            </label>
            <div class="col-sm-10">
                {if $attach_file}{tr}Edit:{/tr} {/if}<input type="hidden" name="MAX_FILE_SIZE" value="1000000000"><input name="userfile1" type="file">{if $attach_file}<br>{$attach_file|escape}{/if}
			</div>
        </div>
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">
                {tr}Comment{/tr}
            </label>
            <div class="col-sm-10">
				<input type="text" name="attach_comment" maxlength="250" value="{$attach_comment|escape}">
            </div>
        </div>
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">
                {tr}Version{/tr}
            </label>
            <div class="col-sm-10">
                <input type="text" name="attach_version" size="5" maxlength="10" value="{$attach_version|escape}">
			</div>
        </div>
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">
                {tr}Description{/tr}
            </label>
            <div class="col-sm-10">
                <textarea name="attach_longdesc" style="width:100%;" rows="10" >{$attach_longdesc|escape}</textarea>
			</div>
        </div>
        <div class="form-group">
            <div class="col-sm-10 col-sm-push-2">
                <input type="submit" class="btn btn-default btn-sm" name="attach" value={if $attach_file}"{tr}Edit{/tr}"{else}"{tr}Attach{/tr}"{/if}>
			</div>
        </div>
	</form>
{/if}

<h2>{tr}Attachments{/tr}</h2>
<div class="table-responsive">
    <table class="table normal">
	<tr>
		{assign var='nbcols' value=2}
		<th class="auto">&nbsp;</th>
		{section name=ix loop=$attfields}
			{assign var='nbcols' value=$nbcols+1}
			<th class="auto">{tr}{$attfields[ix]}{/tr}</th>
		{/section}
		<th>&nbsp;</th>
	</tr>

	{section name=ix loop=$atts}
		<tr>
		<td nowrap="nowrap" class="auto">
		{if $attextra eq 'y'}
			{assign var=link value='tiki-view_tracker_more_info.php?attId='|cat:$atts[ix].attId}
			<a class="tablename" href="#" title="{tr}more info{/tr}" onclick="javascript:window.open('{$link}','','menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,width=450,height=600');">
				{icon _id="information" alt="{tr}more info{/tr}"}
			</a>
		{/if}
		<a class="tablename" href="tiki-download_item_attachment.php?attId={$atts[ix].attId}" title="{tr}Download{/tr}">
		   	{icon _id='disk' alt="{tr}Download{/tr}"}
		</a>
		</td>
		{foreach key=k item=x from=$attfields}
			{if $x eq 'created'}
				<td>{$atts[ix].$x|tiki_short_datetime}</td>
			{elseif $x eq 'filesize'}
				<td nowrap="nowrap">{$atts[ix].$x|kbsize}</td>
			{elseif $x eq 'filetype'}
				<td>{$atts[ix].filename|iconify}</td>
			{else}
				<td>{$atts[ix].$x}</td>
			{/if}
		{/foreach}
		<td>
		{if $tiki_p_admin_trackers eq 'y' or ($user and ($atts[ix].user eq $user))}
			<a class="link" href="tiki-view_tracker_item.php?trackerId={$trackerId}&amp;itemId={$itemId}&amp;removeattach={$atts[ix].attId}&amp;offset={$offset}&amp;sort_mode={$sort_mode}" title="{tr}Delete{/tr}">
				{icon _id='cross' alt="{tr}Delete{/tr}"}
			</a>
			<a class="link" href="tiki-view_tracker_item.php?trackerId={$trackerId}&amp;itemId={$itemId}&amp;editattach={$atts[ix].attId}&amp;offset={$offset}&amp;sort_mode={$sort_mode}" title="{tr}Edit{/tr}">
				{icon _id='page_edit' alt="{tr}Edit{/tr}"}
			</a>
		{/if}
		</td>
	</tr>
	{sectionelse}
	<tr>
		<td colspan="{$nbcols}" class="formcontent">{tr}No attachments for this item{/tr}</td>
	</tr>
	{/section}
    </table>
</div>
    {/strip}
