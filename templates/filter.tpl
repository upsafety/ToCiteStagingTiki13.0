{* $Id: filter.tpl 51382 2014-05-19 15:12:21Z nkoth $ *}
<form method="get" action="{$filter_action|escape}" class="filter form-horizontal">
	<div class="form-group">
		<label class="col-sm-2 control-label">{tr}Content{/tr}</label>
		<div class="col-sm-4">
		    <input type="search" name="filter~content" class="form-control" value="{$filter_content|escape}">
		</div>
    </div>
	{if $prefs.search_show_sort_order eq 'y'}
        <div class="form-group">
			<label class="col-sm-2 control-label">{tr}Sort By{/tr}</label>
			<div class="col-sm-3">
				<select name="sort_mode" class="sort_mode form-control">
					{$sort_found = false}
					{foreach from=$sort_modes key=k item=t}
						<option value="{$k|escape}"{if $k eq $sort_mode} selected="selected"{$sort_found = true}{/if}>{$t|escape}</option>
					{/foreach}
				</select>
			</div>
			{if preg_match('/desc$/',$sort_mode)}
				{icon _id='arrow_up' width='16' height='16' class='icon sort_invert' title="{tr}Sort direction{/tr}" href='#'}
			{else}
				{icon _id='arrow_down' width='16' height='16' class='icon sort_invert' title="{tr}Sort direction{/tr}" href='#'}
			{/if}
        </div>
	{else}
		<input type="hidden" name="sort_mode" value="{$sort_mode}">
		{/if}
		{if $prefs.feature_search_show_object_filter eq 'y'}
			<div class="form-group">
				<label class="col-sm-2 control-label" for="filter-type">{tr}Type{/tr}</label>
				<div class="col-sm-4">
					<select name="filter~type" id="filter-type" class="form-control">
						<option value="">{tr}Any{/tr}</option>
						{foreach from=$filter_types key=k item=t}
							<option value="{$k|escape}"{if $t eq $filter_type} selected="selected"{/if}>{$t|escape}</option>
						{/foreach}
					</select>
				</div>
			</div>
		{else}
			{if is_array($filter_type)}
				{foreach from=$filter_type item=t}
					<input type="hidden" name="filter~type[]" value="{$t|escape}">
				{/foreach}
			{else}
				<input type="hidden" name="filter~type" value="{$filter_type|escape}">
			{/if}
		{/if}

		{if $prefs.feature_categories eq 'y' and $tiki_p_view_category eq 'y' and $prefs.search_show_category_filter eq 'y'}
			<div class="form-group">
				<label class="col-sm-2 control-label" for="filter-categories">{tr}Categories{/tr}</label>
				<div class="col-sm-4">
					<a class="category-lookup btn btn-default" href="#">{tr}Lookup{/tr}</a>
					<input type="text" name="filter~categories" id="filter-categories" class="category-wizard form-control" value="{$filter_categories|escape}">
				</div>
				<div class="col-sm-2 checkbox">
					<label for="filter-deep">
						<input type="checkbox" name="filter~deep" id="filter-deep" {if $filter_deep} checked="checked"{/if}> {tr}Deep search{/tr}
					</label>
				</div>
			</div>

			<div class="category-picker" title="{tr}Select Categories{/tr}" style="display:none;">
				{$filter_category_picker}
			</div>
		{/if}
		{if $prefs.feature_freetags eq 'y' and $tiki_p_view_freetags eq 'y' and $prefs.search_show_tag_filter eq 'y'}
			<div class="form-group">
				<label class="col-sm-2 control-label" for="filter-tags">{tr}Tags{/tr}</label>
				<div class="col-sm-4">
					<a class="tag-lookup btn btn-default" href="#">{tr}Lookup{/tr}</a>
					<input type="text" name="filter~tags" class="tag-wizard" id="filter-tags" value="{$filter_tags|escape}">
				</div>
				<div class="tag-picker" title="{tr}Select Tags{/tr}" style="display:none;">
					{$filter_tags_picker}
				</div>
			</div>
		{/if}
		{if $prefs.feature_multilingual eq 'y'}
			{if $prefs.search_default_interface_language neq 'y'}
				<div class="form-group">
					<label class="col-sm-2 control-label" for="filter-language">{tr}Language{/tr}</label>
					<div class="col-sm-4">
						<select name="filter~language" class="form-control" id="filter-language">
							<option value="">{tr}Any{/tr}</option>
							{foreach from=$filter_languages item=l}
								<option value="{$l.value|escape}"{if $filter_language eq $l.value} selected="selected"{/if}>{$l.name|escape}</option>
							{/foreach}
						</select>
					</div>
					<div class="col-sm-5 checkbox-inline">
						<input type="checkbox" name="filter~language_unspecified"{if $filter_language_unspecified} checked="checked"{/if}>
						{tr}Include objects without a specified language{/tr}
					</div>
				</div>
			{else}
				<input type="hidden" name="filter~language" value="{$prefs.language}">
				<input type="hidden" name="filter~language_unspecified" value="1">
			{/if}
		{/if}
	
	<div class="text-center">
		<input type="submit" class="btn btn-primary" value="{tr}Search{/tr}">
		{if $prefs.storedsearch_enabled eq 'y' and $user}
			<input type="hidden" name="storeAs" value=""/>
			<a href="{service controller=search_stored action=select modal=true}" id="store-query" class="btn btn-default">{tr}Save Search{/tr}</a>
			<a href="{service controller=search_stored action=list}" class="btn btn-link">{tr}View Saved Searches{/tr}</a>
			{jq}
				$('#store-query').clickModal({
					success: function (data) {
						var form = $(this).closest('form')[0];

						$(form.storeAs).val(data.queryId);
						$(form).attr('method', 'post');
						$(form).submit();
					}
				});
			{/jq}
		{/if}
		<a href="{service controller=search action=help modal=1}" data-toggle="modal" data-target="#bootstrap-modal">{tr}Search Help{/tr} {icon _id=help}</a>
	</div>
</form>
{jq}
	$('.filter:not(.init)').addClass('init').each(function () {

{{if $prefs.feature_categories eq 'y'}}
		var categoryInput = $('.category-wizard', this).fancy_filter('init', {
			map: {{$filter_categmap|json_encode}}
		});

		var categoryPicker = $('.category-picker', this).dialog({
			height: $(window).height()-200,
			width: 'auto',
			autoOpen: false,
			modal: true,
			buttons: {
				"{tr}Add to filter{/tr}": function () {
					$(':checked', this).each(function () {
						categoryInput.fancy_filter('add', {
							token: $(this).val(),
							label: $(this).parent().text(),
							join: ' or '
						});
					});
					$(this).dialog('close');
				},
				"{tr}Cancel{/tr}": function () {
					$(this).dialog('close');
				}
			},
			close: function () {
				$(':checked', this).prop('checked', false);
			}
		});

		$('.category-lookup', this).click(function () {
			categoryPicker.dialog('open');
			return false;
		});
{{/if}}

{{if $prefs.feature_freetags eq 'y'}}
		var tagInput = $('.tag-wizard', this).fancy_filter('init', {
			map: {{$filter_tagmap}}
		});

		$('.tag-picker a', this).click(function () {
			$(this).toggleClass('highlight');

			return false;
		});
		var tagPicker = $('.tag-picker', this).dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				"{tr}Add to filter{/tr}": function () {
					$('.highlight', this).each(function () {
						tagInput.fancy_filter('add', {
							token: $(this).attr('href'),
							label: $(this).text(),
							join: ' and '
						});
					});
					$(this).dialog('close');
				},
				"{tr}Cancel{/tr}": function () {
					$(this).dialog('close');
				}
			},
			close: function () {
				$(':checked', this).prop('checked', false);
			}
		});

		$('.tag-lookup', this).click(function () {
			tagPicker.dialog('open');
			return false;
		});
{{/if}}

{{if $prefs.search_show_sort_order eq 'y'}}
		var $invert = $(".sort_invert", this);
		var $sort_mode = $(".sort_mode", this);
{{if not $sort_found}}
		var opts = $sort_mode.prop("options");
		for (var o = 0; o < opts.length; o++) {	// sort_mode not in intially rendered list, so try and find the opposite direction
			var tofind = "{{$sort_mode}}";
			tofind = tofind.replace(/(:?asc|desc)$/, "");
			if (opts[o].value.search(tofind) === 0) {
				opts[o].value = "{{$sort_mode}}";
				$sort_mode.prop("selectedIndex", o);
				if (typeof $sort_mode.selectmenu == "function") {
					$sort_mode.selectmenu();	// seems to need a prod
				}
				break;
			}
		}
{{/if}}

		$sort_mode.change(function () {		// update direction arrow
			if ($(this).val().search(/desc$/) > -1) {
				$invert.attr("src", $invert.attr("src").replace("down", "up"));
			} else {
				$invert.attr("src", $invert.attr("src").replace("up", "down"));
			}
		}).trigger("change");
		$invert.parent().click(function () {	// change the value of the option to opposite direction
			var v = $sort_mode.prop("options")[$sort_mode.prop("selectedIndex")].value;
			if (v.search(/desc$/) > -1) {
				$sort_mode.prop("options")[$sort_mode.prop("selectedIndex")].value = v.replace(/desc$/, "asc");
				$invert.attr("src", $invert.attr("src").replace("up", "down"));
			} else {
				$sort_mode.prop("options")[$sort_mode.prop("selectedIndex")].value = v.replace(/asc$/, "desc");
				$invert.attr("src", $invert.attr("src").replace("down", "up"));
			}
			return false;
		});
{{/if}}

	});
{/jq}
