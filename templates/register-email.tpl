{* $Id: register-email.tpl 50932 2014-04-23 21:44:58Z luciash $ *}
{if $prefs.user_register_prettytracker eq 'y' and $prefs.user_register_prettytracker_tpl and $prefs.socialnetworks_user_firstlogin != 'y'}
	<input type="text" id="email" name="email">
	&nbsp;<strong class='mandatory_star'>*</strong>
{else}
	{if $prefs.login_is_email ne 'y'}
		<div class="form-group">
			<label class="col-md-4 col-sm-3 control-label" for="email">{tr}Email:{/tr}</label>
			{if $trackerEditFormId}&nbsp;<strong class='mandatory_star'>*</strong>&nbsp;{/if}
			<div class="col-md-4 col-sm-6">
				<input class="form-control" type="text" id="email" name="email" value="{if !empty($smarty.post.email)}{$smarty.post.email}{/if}">
				{if $prefs.validateUsers eq 'y' and $prefs.validateEmail ne 'y'}
					<p class="help-block highlight">
						<em class='mandatory_note'>{tr}A valid email is mandatory to register{/tr}</em>
					</p>
				{/if}
			</div>
		</div>
	{/if}
{/if}
