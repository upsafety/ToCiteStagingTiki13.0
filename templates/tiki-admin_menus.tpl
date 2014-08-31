{* $Id: tiki-admin_menus.tpl 52165 2014-07-28 12:32:06Z xavidp $ *}
{title help="Menus" admpage="general&amp;cookietab=3"}{tr}Menus{/tr}{/title}

{if $tiki_p_admin eq 'y'}
	<div class="navbar">
		<a class="btn btn-primary" href="{service controller=menu action=manage modal=true}" data-toggle="modal" data-target="#bootstrap-modal">
			{glyph name="plus"} {tr}Create Menu{/tr}
		</a>
		{button href="tiki-admin_modules.php" _text="{glyph name="cog"} {tr}Admin Modules{/tr}"}
	</div>
{/if}
{include file='find.tpl'}
<div class="table-responsive">
<div class="menu-table">
	<table class="table table-hover">
		<tr>
			<th>{self_link _sort_arg='sort_mode' _sort_field='menuId'}{tr}ID{/tr}{/self_link}</th>
			<th>{self_link _sort_arg='sort_mode' _sort_field='name'}{tr}Name{/tr}{/self_link}</th>
			<th>{self_link _sort_arg='sort_mode' _sort_field='type'}{tr}Type{/tr}{/self_link}</th>
			<th>{tr}Options{/tr}</th>
			<th>{tr}Action{/tr}</th>
		</tr>

		{section name=user loop=$channels}
			<tr>
				<td class="id">{$channels[user].menuId}</td>
				<td class="text">
					{if $tiki_p_edit_menu_option eq 'y' and $channels[user].menuId neq 42}
						<a class="link" href="tiki-admin_menu_options.php?menuId={$channels[user].menuId}" title="{tr}Configure/Options{/tr}">{$channels[user].name|escape}</a>
					{else}
						{$channels[user].name|escape}
					{/if}
					<br>
					{$channels[user].description|escape|nl2br}
				</td>
				<td class="text">{$channels[user].type}</td>
				<td><span class="badge">{$channels[user].options}</span></td>
				<td class="action">
					{if $channels[user].menuId neq 42}
						{if $tiki_p_edit_menu eq 'y'}
							<a class="btn btn-default btn-sm" href="{service controller=menu action=manage menuId={$channels[user].menuId} modal=true}" data-toggle="modal" data-target="#bootstrap-modal" title="{tr}Edit Menu{/tr}">
								{glyph name="edit"}
							</a>
						{/if}
						{if $tiki_p_edit_menu_option eq 'y'}
							<a class="btn btn-default btn-sm" href="tiki-admin_menu_options.php?menuId={$channels[user].menuId}" title="{tr}Menu Options{/tr}">{glyph name="list"}</a>
						{/if}
						{if $tiki_p_edit_menu eq 'y'}
							{self_link remove=$channels[user].menuId _title="{tr}Delete{/tr}" _class="btn btn-default btn-sm"}{glyph name="remove"}{/self_link}
						{/if}
					{else}
						{if $tiki_p_admin eq 'y'}
							{button reset="y" menuId=$channels[user].menuId _text="{tr}RESET{/tr}" _auto_args="reset,menuId" _class="btn btn-warning btn-sm"}
						{/if}
					{/if}
					{if $tiki_p_edit_menu eq 'y'}
						<a class="btn btn-default btn-sm" href="{service controller=menu action=clone menuId={$channels[user].menuId} modal=true}" data-toggle="modal" data-target="#bootstrap-modal" title="{tr}Clone Menu{/tr}">
								{glyph name="flash"}
							</a>
					{/if}
				</td>
			</tr>
		{sectionelse}
			{norecords _colspan=5}
		{/section}
	</table>
</div>
</div>
{pagination_links cant=$cant step=$maxRecords offset=$offset}{/pagination_links}
