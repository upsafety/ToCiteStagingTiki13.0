{* $Id: include_look.tpl 52071 2014-07-22 05:03:45Z chibaguy $ *}
<form action="tiki-admin.php?page=look" id="look" name="look" class="form-horizontal labelColumns" class="admin" method="post">
	<div class="row">
		<div class="form-group col-lg-12">
			<div class="pull-right">
                <input type="submit" class="btn btn-primary btn-sm" name="looksetup" title="{tr}Apply Changes{/tr}" value="{tr}Apply{/tr}" />
		    </div>
		</div>
	</div>
	{tabset name="admin_look"}
		{tab name="{tr}Theme{/tr}"}
			<h2>{tr}Theme{/tr}</h2>

			<div class="row">
				<div class="col-md-3 col-md-push-9">
					<div  class="thumbnail">
						<img src="{$thumbfile}" alt="{tr}Theme Screenshot{/tr}" id="style_thumb">
					</div>
				</div>
				<div class="col-md-9 col-md-pull-3 adminoptionbox">
					{preference name=theme_active}

					<div class="adminoptionbox theme_active_childcontainer custom">
						{preference name=theme_custom}
					</div>

					<div class="adminoptionbox theme_active_childcontainer legacy">
						{preference name=style}
						{preference name=style_option}

						{preference name=style_admin}
						{preference name=style_admin_option}
					</div>

					{preference name=site_layout}
					{preference name=site_layout_per_object}

					{if $prefs.javascript_enabled eq 'n' or $prefs.feature_jquery eq 'n'}
						<input type="submit" class="btn btn-default btn-sm" name="changestyle" value="{tr}Go{/tr}" />
					{/if}
				</div>
			</div>
			<div class="adminoptionbox">
				{if $prefs.feature_jquery_ui eq 'y'}
					{preference name=feature_jquery_ui_theme}
				{/if}

				{if $prefs.change_theme eq 'y' and ($user_prefs.theme neq '' and $prefs.site_style neq $user_prefs.theme) or ($prefs.style neq '' and $prefs.site_style neq $prefs.style)}
					{remarksbox type="warning" title="{tr}Admin{/tr}"}{tr}The "users can change theme" feature will override the theme displayed.{/tr}{/remarksbox}
				{/if}

				{if $prefs.site_style != $a_style}
					{remarksbox type="note" title="{tr}Note{/tr}"}{tr}Theme not saved yet - click "Apply"{/tr}{/remarksbox}
				{/if}
			</div>


			{preference name=change_theme}
			<div class="adminoptionboxchild" id="change_theme_childcontainer">
				{tr}Restrict available themes{/tr}
				{preference name=available_styles}
			</div>

			{preference name=feature_fixed_width}
			<div class="adminoptionboxchild" id="feature_fixed_width_childcontainer">
				{preference name=layout_fixed_width}
			</div>

			{preference name=useGroupTheme}
			{preference name=feature_theme_control}
				<div class="adminoptionboxchild" id="feature_theme_control_childcontainer">
					{button _text="{tr}Theme Control{/tr}" href="tiki-theme_control.php"}
					{preference name=feature_theme_control_savesession}
					{preference name=feature_theme_control_parentcategory}
					{preference name=feature_theme_control_autocategorize}
				</div>

		{/tab}

		{tab name="{tr}General Layout{/tr}"}
			<h2>{tr}General Layout{/tr}</h2>

			{remarksbox type="tip" title="{tr}Tip{/tr}"}
				{tr}&quot;Modules&quot; are the items of content at the top &amp; bottom and in the right &amp; left columns of the site.{/tr} {tr}Select{/tr}
				<a class="rbox-link" href="tiki-admin_modules.php">{tr}Admin &gt; Modules{/tr}</a> {tr}from the menu to create and edit modules{/tr}.
			{/remarksbox}


			{preference name=feature_sitelogo}
			<div class="adminoptionboxchild" id="feature_sitelogo_childcontainer">
				<fieldset>
					<legend>{tr}Logo{/tr}</legend>
					{preference name=sitelogo_src}
					{preference name=sitelogo_bgcolor}
					{preference name=sitelogo_title}
					{preference name=sitelogo_alt}
					{preference name=sitelogo_icon}
				</fieldset>

				<fieldset>
					<legend>{tr}Title{/tr}</legend>
					{preference name=sitetitle}
					{preference name=sitesubtitle}
				</fieldset>
			</div>

			<div class="adminoptionbox">
				<fieldset>
					<legend>{tr}Module zone visibility{/tr}</legend>
					{if !$smarty.get.Zone_options}
						{remarksbox type="tip" title="{tr}Hint{/tr}"}
							Module zone visibility options may not be supported anymore from Tiki 13+, but you can still access them in case you are upgrading from an earlier version.
						<a href="tiki-admin.php?page=look&Zone_options=y#contentadmin_look-2">Click here for module visibility options</a>
						{/remarksbox}
					{else}
						{preference name=module_zones_top}
						{preference name=module_zones_topbar}
						{preference name=module_zones_pagetop}
						{preference name=feature_left_column}
						{preference name=feature_right_column}
						{preference name=module_zones_pagebottom}
						{preference name=module_zones_bottom}
					{/if}
					{preference name=module_file}
					{preference name=module_zone_available_extra}
				</fieldset>
			</div>

			<div class="adminoptionbox">
				<fieldset>
					<legend>{tr}Site Report Bar{/tr}</legend>
					{preference name=feature_site_report}
					{preference name=feature_site_report_email}
					{preference name=feature_site_send_link}
				</fieldset>
			</div>
		{/tab}

		{tab name="{tr}Shadow layer{/tr}"}
			<h2>{tr}Shadow layer{/tr}</h2>
			{preference name=feature_layoutshadows}
			<div class="adminoptionboxchild" id="feature_layoutshadows_childcontainer">
				{preference name=main_shadow_start}
				{preference name=main_shadow_end}

				{preference name=header_shadow_start}
				{preference name=header_shadow_end}

				{preference name=middle_shadow_start}
				{preference name=middle_shadow_end}

				{preference name=center_shadow_start}
				{preference name=center_shadow_end}

				{preference name=footer_shadow_start}
				{preference name=footer_shadow_end}

				{preference name=box_shadow_start}
				{preference name=box_shadow_end}
			</div>
		{/tab}

		{tab name="{tr}Pagination{/tr}"}
			<h2>{tr}Pagination{/tr}</h2>
			{preference name=user_selector_threshold}
			{preference name=maxRecords}
			{preference name=nextprev_pagination}
			{preference name=direct_pagination}
			<div class="adminoptionboxchild" id="direct_pagination_childcontainer">
				{preference name=direct_pagination_max_middle_links}
				{preference name=direct_pagination_max_ending_links}
			</div>

			{preference name=pagination_firstlast}
			{preference name=pagination_fastmove_links}
			{preference name=pagination_hide_if_one_page}
			{preference name=pagination_icons}
		{/tab}

		{tab name="{tr}UI Effects{/tr}"}
			<h2>{tr}UI Effects{/tr}</h2>
			<div class="adminoptionbox">
				<fieldset class="table">
					<legend>{tr}Standard UI effects{/tr}</legend>
					{preference name=jquery_effect}
					{preference name=jquery_effect_speed}
					{preference name=jquery_effect_direction}
				</fieldset>
			</div>

			<div class="adminoptionbox">
				<fieldset class="table">
					<legend>{tr}Tab UI effects{/tr}</legend>
					{preference name=jquery_effect_tabs}
					{preference name=jquery_effect_tabs_speed}
					{preference name=jquery_effect_tabs_direction}
				</fieldset>
			</div>

			<fieldset>
				<legend>{tr}Other{/tr}</legend>
				<div class="admin featurelist">
					{preference name=feature_shadowbox}
						<div class="adminoptionboxchild" id="feature_shadowbox_childcontainer">
							{preference name=jquery_colorbox_theme}
						</div>
					{preference name=feature_jscalendar}
					{preference name=feature_hidden_links}
				</div>
			</fieldset>
		{/tab}

		{tab name="{tr}Customization{/tr}"}
			<h2>{tr}Customization{/tr}</h2>
			<fieldset>
				<legend>{tr}Theme Generator{/tr} <em>({tr}Experimental{/tr})</em></legend>
				{preference name="themegenerator_feature"}
				<div class="adminoptionboxchild" id="themegenerator_feature_childcontainer">
					<div class="adminoptionbox">
						{preference name="themegenerator_theme"}
						<div  class="adminoptionboxchild" id="themegenerator_feature_childcontainer">

							<input type="text" name="tg_edit_theme_name" value="{$tg_edit_theme_name|default:''|escape}"{if !empty($prefs.themegenerator_theme)} style="display:none;"{/if} />
							<input type="submit" class="btn btn-default btn-sm" name="tg_new_theme" value="{tr}New{/tr}"{if !empty($prefs.themegenerator_theme)} style="display:none;"{/if} />
							<input type="submit" class="btn btn-default btn-sm" name="tg_delete_theme" value="{tr}Delete{/tr}"{if empty($prefs.themegenerator_theme)} style="display:none;"{/if} />
							{jq}$("select[name=themegenerator_theme]").change(function(){
	if ($(this)[0].selectedIndex === 0) {
		$("input[name=tg_edit_theme_name]").keyup(function(e){
			if (e.keyCode === 13 && $(this).val()) {
				$("input[name=tg_new_theme]").click();
			}
		}).show();
		$("input[name=tg_new_theme]").show();
		$("input[name=tg_delete_theme]").hide();
	}
							}).change();{/jq}
							{if $prefs.feature_jquery_ui eq "y" and $prefs.feature_ajax eq "y" and not empty($prefs.themegenerator_theme)}
								{* TODO make non-live themes editable & previewable *}
								{button _text="{tr}Open editor{/tr}" _class="tgFloatDialog" href="#"}
							{/if}
						</div>
					</div>
					<div class="adminoptionbox">
						{if $prefs.feature_jquery_ui neq "y" or $prefs.feature_ajax neq "y"}
							<div id="themegenerator_container">
								{include file="themegen.tpl"}
								<div class="input_submit_container clear" style="text-align: center">
									<input type="submit" class="btn btn-default btn-sm" name="tg_preview" value="{tr}Preview Theme{/tr}">
								</div>
							</div>
							{if $prefs.themegenerator_feature eq 'y'}
								{jq}initThemeGenDialog();{/jq}
							{/if}
						{/if}
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>{tr}Custom Codes{/tr}</legend>
				{preference name="header_custom_css" syntax="css"}
				<div class="adminoptionboxchild">
					{self_link _onclick="show_brosho();return false;" _ajax="n"}{icon _id="bricks"}{tr}Experimental: CSS assistant (work in progress - click the x to remove){/tr}{/self_link}
				</div>
				{$headerlib->add_jsfile('lib/jquery_tiki/brosho/tiki_brosho.js')}

				{preference name=feature_custom_html_head_content syntax="htmlmixed"}
				{preference name=feature_endbody_code syntax="tiki"}
				{preference name=site_google_analytics_account}

				{preference name="header_custom_js" syntax="javascript"}

				{preference name="layout_add_body_group_class"}
			</fieldset>

			<fieldset>
				<legend>{tr}Editing{/tr}</legend>
				{preference name=feature_editcss}
				{if $prefs.feature_editcss eq 'y'}
					<div class="adminoptionboxchild">
						{if $tiki_p_create_css eq 'y'}
							{button _text="{tr}Edit CSS{/tr}" href="tiki-edit_css.php"}
						{/if}
					</div>
				{/if}

				{preference name=feature_view_tpl}
				{if $prefs.feature_view_tpl eq 'y'}
					<div class="adminoptionboxchild">
						{button href="tiki-edit_templates.php" _text="{tr}View Templates{/tr}"}
					</div>
				{/if}

				{preference name=feature_edit_templates}
				{if $prefs.feature_edit_templates eq 'y'}
					<div class="adminoptionboxchild">
						{button href="tiki-edit_templates.php" _text="{tr}Edit Templates{/tr}"}
					</div>
				{/if}
			</fieldset>

		{/tab}

		{tab name="{tr}Miscellaneous{/tr}"}
			<h2>{tr}Miscellaneous{/tr}</h2>
			{preference name=feature_tabs}
			<div class="adminoptionboxchild" id="feature_tabs_childcontainer">
				{preference name=layout_tabs_optional}
			</div>
			{preference name=layout_section}
			{if $prefs.layout_section eq 'y'}
				{button _text="{tr}Admin layout per section{/tr}" href="tiki-admin_layout.php"}
			{/if}

			{preference name=feature_iepngfix}
			<div class="adminoptionboxchild" id="feature_iepngfix_childcontainer">
				{preference name=iepngfix_selectors}
				{preference name=iepngfix_elements}
			</div>

			<div class="adminoptionbox">
				<fieldset>
					<legend>{tr}Favicon{/tr}</legend>
					{preference name=site_favicon}
					{preference name=site_favicon_type}
				</fieldset>
			</div>

			<div class="adminoptionbox">
				<fieldset class="table">
					<legend>{tr}Context Menus{/tr} (<em>{tr}Currently used in File Galleries only{/tr}.</em>)</legend>
					{preference name=use_context_menu_icon}
					{preference name=use_context_menu_text}
				</fieldset>
			</div>

			<fieldset>
				<legend>{tr}Separators{/tr}</legend>
				{preference name=site_crumb_seper}
				<div class="adminoptionboxchild">
					<em>{tr}Examples:{/tr} &nbsp; &raquo; &nbsp; / &nbsp; &gt; &nbsp; : &nbsp; -> &nbsp; &#8594;</em>
				</div>

				{preference name=site_nav_seper}
				<div class="adminoptionboxchild">
					<em>{tr}Examples:{/tr} &nbsp; | &nbsp; / &nbsp; &brvbar; &nbsp; :</em>
				</div>
			</fieldset>

			{preference name=log_tpl}
			{preference name=smarty_compilation}
			{preference name=smarty_cache_perms}
			{preference name=categories_used_in_tpl}

			{preference name=feature_html_head_base_tag}

		{/tab}
	{/tabset}
	<div class="row">
		<div class="form-group col-lg-12">
			<div class="text-center">
				<input type="submit" class="btn btn-primary btn-sm" name="looksetup" title="{tr}Apply Changes{/tr}" value="{tr}Apply{/tr}" />
            </div>
		</div>
	</div>
</form>
