{* $Id: wikiplugin_invite.tpl 48719 2013-11-24 03:07:07Z chibaguy $ *}
{if $errors}
	{remarksbox type="feedback"}
		{foreach from=$errors item=error}
			{$error|escape}<br>
		{/foreach}
	{/remarksbox}
{/if}

<form method="post">
<div class="table-responsive">
<table class="table normal invite">
<tr>
	<td>
		<label for="email">{tr}Email address the person you want to invite{/tr}</label>
	</td>
	<td>
		<input name="email" id="email" type="text" value="{$email}">
	</td>
</tr>
<tr>
	<td>
		<label for="message">{tr}Message{/tr}
	</td>
	<td>
		<textarea name="message" id="message" rows="10" cols="60">{$message|escape}</textarea>
	</td>
</tr>
<tr>
	<td>
		<label for="groups">{tr}Set in these groups{/tr}</label>
	</td>
	<td>
		<select name="groups[]" id="groups" multiple="multiple">
			{foreach from=$userGroups key=gx item=gi}
				<option value="{$gx|escape}"{if (isset($groups) && in_array($gx, $groups)) or (!isset($groups) && $gx eq $params.defaultgroup)} selected="selected"{/if}>{$gx|escape}</option>
			{/foreach}
		</select>
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td><input type="submit" class="btn btn-default btn-sm" name="invite" value="{tr}Invite{/tr}"></td>
</tr>
</table>
</div>
</form>
