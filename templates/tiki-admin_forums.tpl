{* $Id: tiki-admin_forums.tpl 51971 2014-07-16 12:05:43Z eromneg $ *}

{title help="Forums" admpage="forums"}{tr}Admin Forums{/tr}{/title}

<div class="t_navbar form-group">
	{if $tiki_p_admin_forum eq 'y' && $forumId > 0 or (isset($dup_mode) and $dup_mode eq 'y')}
		{button class="btn btn-default" href="?" _text="{tr}Create New Forum{/tr}"}
	{/if}
	{if $tiki_p_admin_forum eq 'y' && (!isset($dup_mode) or $dup_mode ne 'y')}
		{button class="btn btn-default" href="tiki-admin_forums.php?dup_mode=y" _text="{tr}Duplicate Forum{/tr}"}
	{/if}
	{if $forumId > 0}
		{button class="btn btn-default" href="tiki-view_forum.php?forumId=$forumId" _text="{tr}View this forum{/tr}"}
	{/if}
	{if $tiki_p_admin_forum eq 'y'}
		{button class="btn btn-default" href="tiki-forum_import.php" _text="{tr}Import forums{/tr}"}
	{/if}
	{if $tiki_p_forum_read eq 'y'}
		{button class="btn btn-default" href="tiki-forums.php" _text="{tr}List forums{/tr}"}
	{/if}
</div>

{tabset}

{tab name="{tr}Forums{/tr}"}
    <h2>{tr}Forums{/tr}</h2>

{if $channels or ($find ne '')}
	{include file='find.tpl'}
{/if}

<form action="#">
    <div class="table-responsive">
    <div>
	<table class="table normal">
		{assign var=numbercol value=8}
		<tr>
			{if $channels}
				{assign var=numbercol value=$numbercol+1}
				<th style="text-align:center">
					{select_all checkbox_names='checked[]'}
				</th>
			{/if}
			<th>
				{self_link _sort_arg='sort_mode' _sort_field='name'}{tr}Name{/tr}{/self_link}
			</th>
			<th>
				{self_link _sort_arg='sort_mode' _sort_field='threads'}{tr}Topics{/tr}{/self_link}
			</th>
			<th>
				{self_link _sort_arg='sort_mode' _sort_field='comments'}{tr}Coms{/tr}{/self_link}
			</th>
			<th>{tr}Users{/tr}</th>
			<th>{tr}Age{/tr}</th>
			<th>{tr}PPD{/tr}</th>
			<th>
				{self_link _sort_arg='sort_mode' _sort_field='hits'}{tr}Hits{/tr}{/self_link}
			</th>
			<th>{tr}Action{/tr}</th>
		</tr>

		{section name=user loop=$channels}
			<tr>
				<td style="text-align:center">
					<input type="checkbox" name="checked[]" value="{$channels[user].forumId|escape}" {if isset($smarty.request.checked) and $smarty.request.checked and in_array($channels[user].forumId,$smarty.request.checked)}checked="checked"{/if}>
				</td>
				<td>
					<a class="link" href="tiki-view_forum.php?forumId={$channels[user].forumId}" title="{tr}View{/tr}">{$channels[user].name|escape}</a>
				</td>
				<td class="integer">{$channels[user].threads}</td>
				<td class="integer">{$channels[user].comments}</td>
				<td class="integer">{$channels[user].users}</td>
				<td class="integer">{$channels[user].age}</td>
				<td class="integer">{$channels[user].posts_per_day|string_format:"%.2f"}</td>
				<td class="integer">{$channels[user].hits}</td>
				<td class="action">
					<a class="link" href="tiki-view_forum.php?forumId={$channels[user].forumId}" title="{tr}View{/tr}">{icon _id='table' alt="{tr}View{/tr}"}</a>

{if isset($tiki_p_forum_lock) and $tiki_p_forum_lock eq 'y'}
	{if $channels[user].is_locked eq 'y'}
		{self_link _icon='lock_break' _alt="{tr}Unlock{/tr}" lock='n' forumId=$channels[user].forumId}{/self_link}
	{else}
		{self_link _icon='lock_add' _alt="{tr}Lock{/tr}" lock='y' forumId=$channels[user].forumId}{/self_link}
	{/if}
{/if}

{if ($tiki_p_admin eq 'y')
	or ((isset($channels[user].individual) and $channels[user].individual eq 'n')
	and ($tiki_p_admin_forum eq 'y'))
	or ($channels[user].individual_tiki_p_admin_forum eq 'y')
}
						{self_link _icon='page_edit' cookietab='2' _anchor='anchor2' forumId=$channels[user].forumId}{tr}Edit{/tr}{/self_link}
						{permission_link mode=icon type=forum permType=forums id=$channels[user].forumId title=$channels[user].name}
						{self_link _icon='cross' remove=$channels[user].forumId}{tr}Delete{/tr}{/self_link}
					{/if}
				</td>
			</tr>
		{sectionelse}
			{norecords _colspan=$numbercol}
		{/section}
	</table>
    </div>
	</div>

	{if $channels}
		<div class="text-left">
			<br>
			{tr}Perform action with checked:{/tr}
			<select name="batchaction" onchange="show('groups');">
				<option value="">{tr}...{/tr}</option>
				{if $tiki_p_admin_forum eq 'y'}
					<option value="delsel_x">{tr}Delete{/tr}</option>
				{/if}
			</select>
			<input type="submit" class="btn btn-default btn-sm" name="batchaction" value="{tr}OK{/tr}">
		</div>
	{/if}
</form>

{pagination_links cant=$cant step=$maxRecords offset=$offset}{/pagination_links}
{/tab}

{tab name="{tr}Create/Edit Forums{/tr}"}

{if !isset($dup_mode) or $dup_mode != 'y'}
	{if $forumId > 0}
		<h2>{tr}Edit this Forum:{/tr} {$name|escape}</h2>
		{include file='object_perms_summary.tpl' objectName=$name objectType='forum' objectId=$forumId permType=$permsType}
	{else}
		<h2>{tr}Create New Forum{/tr}</h2>
	{/if}

	<form action="tiki-admin_forums.php" method="post" class="form-horizontal" role="form">
		<input type="hidden" name="forumId" value="{$forumId|escape}">
        <fieldset>
        <legend>{tr}Main details{/tr}</legend>
		    <div class="form-group">
                <label class="col-sm-4 control-label" for="name">{tr}Name{/tr}</label>
                <div class="col-sm-8">
				    <input type="text" name="name" class="form-control" id="name" value="{$name|escape}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="name">{tr}Description{/tr}</label>
                <div class="col-sm-8">
			        <textarea name="description" rows="4" class="form-control" id="description">{$description|escape}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="section">{tr}Section{/tr}</label>
                <div class="col-sm-4">
				    <select name="section" id="section" class="form-control">
					    <option value="" {if $forumSection eq ""}selected="selected"{/if}>{tr}None{/tr}</option>
					    <option value="__new__">{tr}Create new{/tr}</option>
					    {section name=ix loop=$sections}
						    <option {if $forumSection eq $sections[ix]}selected="selected"{/if} value="{$sections[ix]|escape}">{$sections[ix]|escape}</option>
					    {/section}
				    </select>
                </div>
                <div class="col-sm-4">
				    <input name="new_section" class="form-control"  type="text">
                </div>
            </div>

        {include file='categorize.tpl'}
        {if $prefs.feature_multilingual eq 'y'}
            <div class="form-group">
                <label class="col-sm-4 control-label" for="forumLanguage">{tr}Language{/tr}</label>
                <div class="col-sm-8">
                    <select name="forumLanguage" id="forumLanguage"  class="checkbox-inline">
                        <option value="">{tr}Unknown{/tr}</option>
                        {section name=ix loop=$languages}
                            <option value="{$languages[ix].value|escape}"{if $forumLanguage eq $languages[ix].value or (!($data.page_id) and $forumLanguage eq '' and $languages[ix].value eq $prefs.language)} selected="selected"{/if}>{$languages[ix].name}</option>
                        {/section}
                    </select>
                </div>
            </div>
        {/if}
        <div class="form-group">
            <label class="col-sm-4 control-label" for="is_flat">{tr}Only allow replies to the first message (flat forum){/tr}</label>
            <div class="col-sm-8 checkbox">
                <input type="checkbox" name="is_flat" id="is_flat" {if $is_flat eq 'y'}checked="checked"{/if}>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="moderator_user">{tr}Moderator user{/tr}</label>
            <div class="col-sm-8">
			    <input id="moderator_user" class="form-control" type="text" name="moderator" value="{$moderator|escape}">
				{autocomplete element='#moderator_user' type='username'}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="moderator_group">{tr}Moderator group{/tr}</label>
            <div class="col-sm-8">
				<input id="moderator_group" type="text" class="form-control" name="moderator_group" id="moderator_group" value="{$moderator_group|escape}">
				{autocomplete element='#moderator_group' type='groupname'}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="forum_use_password">{tr}Password protected{/tr}</label>
            <div class="col-sm-4">
		        {html_options name=forum_use_password options=$forum_use_password_options selected=$forum_use_password class=form-control}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="forum_password">{tr}Forum password{/tr}</label>
            <div class="col-sm-8">
				<input type="text" name="forum_password" id="forum_password" class="form-control" value="{$forum_password|escape}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="controlFlood">{tr}Prevent flooding{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
                <input type="checkbox" name="controlFlood" id="controlFlood" {if $controlFlood eq 'y'}checked="checked"{/if}>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="floodInterval">{tr}Minimum time between posts{/tr}</label>
            <div class="col-sm-4 checkbox-inline">
                {html_options name=floodInterval id=floodInterval class="form-control" options=$flood_options selected=$floodInterval}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="useMail"><input type="checkbox" name="useMail" id="useMail" {if $useMail eq 'y'}checked="checked"{/if}> {tr}Send this forums posts to this email{/tr} </label>
            <div class="col-sm-8">
				<input type="text" class="form-control" name="useMail" id="useMail" value="{$mail|escape}">
            </div>
		</div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="usePruneUnreplied">
				<input type="checkbox" name="usePruneUnreplied" id="usePruneUnreplied" {if $usePruneUnreplied eq 'y'}checked="checked"{/if}> {tr}Prune unreplied messages after{/tr}
			</label>
            <div class="col-sm-4 checkbox-inline">
                {html_options name=pruneUnrepliedAge options=$pruneUnrepliedAge_options selected=$pruneUnrepliedAge}
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="usePruneOld">
                <input type="checkbox" name="usePruneOld" id="usePruneOld" {if $usePruneOld eq 'y'}checked="checked"{/if}> {tr}Prune old messages after{/tr}
            </label>
            <div class="col-sm-4 checkbox-inline">
				{html_options name=pruneMaxAge options=$pruneMaxAge_options selected=$pruneMaxAge}
			</div>
		</div>
    </fieldset>
    <fieldset>
        <legend>{tr}Forum-Mailing list synchronization{/tr}</legend>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="outbound_address">{tr}Forward messages to this forum to this email address, in a format that can be used for sending back to the inbound forum email address{/tr}</label>
            <div class="col-sm-8">
                <input type="text" name="outbound_address" id="outbound_address" class="form-control" value="{$outbound_address|escape}">
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="outbound_mails_for_inbound_mails">{tr}Send mails even when the post is generated by inbound mail{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
			    <input type="checkbox" name="outbound_mails_for_inbound_mails" id="outbound_mails_for_inbound_mails" {if $outbound_mails_for_inbound_mails eq 'y'}checked="checked"{/if}>
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="outbound_mails_reply_link">{tr}Append a reply link to outbound mails{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
				<input type="checkbox" name="outbound_mails_reply_link" id="outbound_mails_reply_link" {if $outbound_mails_reply_link eq 'y'}checked="checked"{/if}>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="outbound_from">{tr}Originating email address for mails from this forum{/tr}</label>
            <div class="col-sm-8">
		    	<input type="text" name="outbound_from" id="outbound_from" class="form-control" value="{$outbound_from|escape}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">{tr}Add messages from this email to the forum{/tr}</label>
            <div class="col-sm-8">
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="inbound_pop_server">{tr}POP3 server{/tr}</label>
			    	<div class="col-sm-8">
				    	<input type="text" name="inbound_pop_server" id="inbound_pop_server" class="form-control" value="{$inbound_pop_server|escape}">
				    </div>
	            </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="inbound_pop_user">{tr}User{/tr}</label>
                    <div class="col-sm-8">
			    	    <input type="text" name="inbound_pop_user" id="inbound_pop_user" class="form-control"value="{$inbound_pop_user|escape}" autocomplete="off">
				    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="inbound_pop_password">{tr}Password{/tr}</label>
                    <div class="col-sm-8">
                        <input type="password" name="inbound_pop_password" id="inbound_pop_password" class="form-control" value="{$inbound_pop_password|escape}" autocomplete="off">
                    </div>
                </div>
			</div>
        </div>
    </fieldset>
    <fieldset>
        <legend>{tr}Forums list{/tr}</legend>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="show_description">{tr}Show description{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
                <input type="checkbox" name="show_description" id="show_description" {if $show_description eq 'y'}checked="checked"{/if}>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="forum_last_n">{tr}Display last post titles{/tr}</label>
            <div class="col-sm-4 checkbox-inline">
                {html_options name=forum_last_n id=forum_last_n options=$forum_last_n_options selected=$forum_last_n}
             </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>{tr}Forum topics (threads) list{/tr}</legend>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="topicOrdering">{tr}Default ordering for topics{/tr}</label>
                <div class="col-sm-8 checkbox-inline">
                    {html_options name=topicOrdering id=topicOrdering options=$topicOrdering_options selected=$topicOrdering}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="topicsPerPage">{tr}Topics per page{/tr}</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="topicsPerPage" id="topicsPerPage" value="{$topicsPerPage|escape}">
                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">{tr}Topic list configuration{/tr}</label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label for="topics_list_replies">
                        <input type="checkbox" name="topics_list_replies" id="topics_list_replies" {if $topics_list_replies eq 'y'}checked="checked"{/if}> {tr}Replies{/tr}
                    </label>
                </div>
                <div class="checkbox">
                    <label for="topics_list_reads">
                        <input type="checkbox" name="topics_list_reads" id="topics_list_reads" {if $topics_list_reads eq 'y'}checked="checked"{/if}> {tr}Reads{/tr}
                    </label>
                </div>
                    <div class="checkbox">
                        <label for="topics_list_pts">
                            <input type="checkbox" name="topics_list_pts" id="topics_list_pts" {if $topics_list_pts eq 'y'}checked="checked"{/if}> {tr}Points{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="topics_list_lastpost">
                            <input type="checkbox" name="topics_list_lastpost" id="topics_list_lastpost" {if $topics_list_lastpost eq 'y'}checked="checked"{/if}> {tr}Last post{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="topics_list_lastpost_title">
                            <input type="checkbox" name="topics_list_lastpost_title" id="topics_list_lastpost_title" {if $topics_list_lastpost_title eq 'y'}checked="checked"{/if}> {tr}Last post title{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="topics_list_lastpost_avatar">
                            <input type="checkbox" name="topics_list_lastpost_avatar" id="topics_list_lastpost_avatar" {if $topics_list_lastpost_avatar eq 'y'}checked="checked"{/if}> {tr}Last post avatar{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="topics_list_author">
                            <input type="checkbox" name="topics_list_author" id="topics_list_author" {if $topics_list_author eq 'y'}checked="checked"{/if}> {tr}Author{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="topics_list_author_avatar">
                            <input type="checkbox" name="topics_list_author_avatar" id="topics_list_author_avatar" {if $topics_list_author_avatar eq 'y'}checked="checked"{/if}> {tr}Author avatar{/tr}
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="topic_smileys">{tr}Use topic smileys{/tr}</label>
                <div class="col-sm-8 checkbox-inline">
                    <input type="checkbox" name="topic_smileys" id="topic_smileys" {if $topic_smileys eq 'y'}checked="checked"{/if}>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="topic_summary">{tr}Show topic summary{/tr}</label>
                <div class="col-sm-8 checkbox-inline">
                    <input type="checkbox" name="topic_summary" id="topic_summary" {if $topic_summary eq 'y'}checked="checked"{/if}>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>{tr}Forum threads{/tr}</legend>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="threadOrdering">{tr}Default ordering of threads{/tr}</label>
                <div class="col-sm-8">
                    {html_options name=threadOrdering id=threadOrdering options=$threadOrdering_options selected=$threadOrdering}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="threadStyle">{tr}Default style of threads{/tr}</label>
                <div class="col-sm-8">
                    {html_options name=threadStyle id=threadStyle options=$threadStyle_options selected=$threadStyle}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="commentsPerPage">{tr}Default number of comments per page{/tr}</label>
                <div class="col-sm-8">
                    {html_options name=commentsPerPage id=commentsPerPage options=$commentsPerPage_options selected=$commentsPerPage}
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>{tr}Posts{/tr}</legend>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="approval_type">{tr}Approval type{/tr}</label>
                <div class="col-sm-4 checkbox-inline">
                    {html_options name=approval_type for=approval_type id=approval_type class=form-control options=$approval_options selected=$approval_type}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label">{tr}User information display{/tr}</label>
                <div class="col-sm-8">
                    <div class="checkbox">
                        <label for="ui_avatar">
                            <input type="checkbox" name="ui_avatar" id="ui_avatar" {if $ui_avatar eq 'y'}checked="checked"{/if}> {tr}Avatar{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_rating_choice_topic">
                            <input type="checkbox" name="ui_rating_choice_topic" id="ui_rating_choice_topic" {if $ui_rating_choice_topic eq 'y'}checked="checked"{/if}> {tr}Topic Rating{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_flag">
                            <input type="checkbox" name="ui_flag" id="ui_flag" {if $ui_flag eq 'y'}checked="checked"{/if}> {tr}Flag{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_posts">
                            <input type="checkbox" name="ui_posts" id="ui_posts" {if $ui_posts eq 'y'}checked="checked"{/if}> {tr}Posts{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_level">
                            <input type="checkbox" name="ui_level" id="ui_level" {if $ui_level eq 'y'}checked="checked"{/if}> {tr}User Level{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_email">
                            <input type="checkbox" name="ui_email" id="ui_email" {if $ui_email eq 'y'}checked="checked"{/if}> {tr}eMail{/tr}
                        </label>
                    </div>
                    <div class="checkbox">
                        <label for="ui_online">
                            <input type="checkbox" name="ui_online" id="ui_online" {if $ui_online eq 'y'}checked="checked"{/if}> {tr}Online{/tr}
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="vote_threads">{tr}Posts can be rated{/tr}</label>
                <div class="col-sm-8 checkbox-inline">
                    <input type="checkbox" name="vote_threads" id="vote_threads" {if $vote_threads eq 'y'}checked="checked"{/if}>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>{tr}Attachments{/tr}</legend>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="att">{tr}Permission{/tr}</label>
                <div class="col-sm-8 checkbox-inline">
                    {html_options name=att id=att options=$attachment_options selected=$att}
                </div>
            </div>
            <div class="row">
                <label class="col-sm-4 control-label" for="att_store_db">{tr}Store attachments in{/tr}</label>
                <div class="col-sm-2 checkbox-inline">
                    <input type="radio" name="att_store" id="att_store_db" value="db" {if $att_store eq 'db'}checked="checked"{/if}> {tr}Database{/tr}
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-sm-offset-4 checkbox-inline">
                    <input type="radio"  name="att_store" value="dir" {if $att_store eq 'dir'}checked="checked"{/if}> {tr}File system{/tr}</div>
                <label class="control-label col-sm-2" for="att_store_dir">{tr}Path{/tr}</label>
                <div class="col-sm-4 checkbox-inline">
                    <input type="text" name="att_store_dir" id="att_store_dir" value="{$att_store_dir|escape}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="att_max_size">{tr}Max attachment size (bytes){/tr}</label>
                <div class="col-sm-8">
                    <input type="text" name="att_max_size" id="att_max_size" class="form-control" value="{$att_max_size|escape}">
                    <span class="help-block">{tr}Max:{/tr} {$maxAttachSize|escape} ({$maxAttachSize|kbsize})</span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="att_list_nb">{tr}Shows number of attachments of the all thread in forum list{/tr}
                    <input type="checkbox" class="checkbox-inline" id="att_list_nb" name="att_list_nb"{if $att_list_nb eq 'y'} checked="checked"{/if} id="att_list_nb"></label>
            </div>
        </fieldset>
   		<div class="text-center">
            <input type="submit" class="btn btn-default" name="save" value="{tr}Save{/tr}">
        </div>
	</form>

{else}{*duplicate*}
	<h2>{tr}Duplicate Forum{/tr}</h2>
	<form action="tiki-admin_forums.php" method="post" class="form-horizontal" role="form">
        <div class="form-group">
    		<label class="col-sm-4 control-label" for="duplicate_name">{tr}Name{/tr}</label>
            <div class="col-sm-8">
		    	<input type="text" name="duplicate_name" id="duplicate_name" class="form-control" value="{$name|escape}">
            </div>
		</div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="duplicate_description">{tr}Description{/tr}</label>
            <div class="col-sm-8">
                <textarea name="description" rows="4" id="duplicate_description" class="form-control">{$description|escape}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="duplicate_forumId">{tr}Forum{/tr}</label>
            <div class="col-sm-8">
					<select name="duplicate_forumId" id="duplicate_forumId" class="form-control">
						{section name=ix loop=$allForums}
							<option value="{$allForums[ix].forumId}">{$allForums[ix].name}</option>
						{/section}
					</select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="duplicate_categories">{tr}Duplicate categories{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
                <input type="checkbox" name="dupCateg" id="duplicate_categories">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="duplicate_perms">{tr}Duplicate permissions{/tr}</label>
            <div class="col-sm-8 checkbox-inline">
                <input type="checkbox" name="dupPerms" id="duplicate_perms">
            </div>
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-default" name="duplicate" value="{tr}Duplicate{/tr}">
        </div>
    </form>
{/if}
{/tab}

{/tabset}
