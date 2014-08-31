{* $Id: mod-switch_theme.tpl 49239 2013-12-24 14:34:13Z chibaguy $ *}
{if empty($group_style)}
{if !isset($tpl_module_title)}
	{capture assign=tpl_module_title}{tr}Theme{/tr}{/capture}
{/if}
{tikimodule error=$module_params.error title=$tpl_module_title name="switch_theme" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox notitle=$module_params.notitle}
	<form method="get" action="tiki-switch_theme.php"{if !empty($tc_theme)} class="disabled"{/if}>
        <div class="form-group">
		<select name="theme" size="1" onchange="this.form.submit();"{if !empty($tc_theme)} disabled="disabled"{/if} class="form-control">
			<option value="" style="font-style:italic;border-bottom:1px dashed #666;">{tr}Site default{/tr}</option>
		{section name=ix loop=$styleslist}
			{if (count($prefs.available_styles) == 0 || empty($prefs.available_styles[0]) || in_array($styleslist[ix], $prefs.available_styles)) and $styleslist[ix] neq 'empty.css'}
			<option value="{$styleslist[ix]|escape}" {if $style eq $styleslist[ix]}selected="selected"{/if}>{$styleslist[ix]|replace:'.css':''|truncate:15|ucwords}</option>
			{/if}
		{/section}
		</select>
        </div>
        {if $style_options}
            <div class="form-group">
        		<select name="theme-option" onchange="this.form.submit();"{if !empty($tc_theme)} disabled="disabled"{/if} class="form-control">
		    		<option value="">{tr}None{/tr}</option>
		         	{section name=ix loop=$style_options}
			        	<option value="{$style_options[ix]|escape}"{if $prefs.style_option eq $style_options[ix]} selected="selected"{/if}>{$style_options[ix]|replace:'.css':''|truncate:15|ucwords}</option>
			        {/section}
		        </select>
            </div>
        {/if}
    		{if $prefs.themegenerator_feature eq "y"}
        <div class="form-group">
			<select name="theme-themegen" onchange="this.form.submit();"{if !empty($tc_theme)} disabled="disabled"{/if} class="form-control">
					<option value="">{tr}None{/tr}</option>
					{section name=ix loop=$themegen_list}
						{if !empty($themegen_list[ix])}
							<option value="{$themegen_list[ix]|escape}"{if $prefs.themegenerator_theme eq $themegen_list[ix]} selected="selected"{/if}>{$themegen_list[ix]|truncate:15|ucwords}</option>
						{/if}
					{/section}
			</select>
      </div>
		{/if}
		<noscript>
			<button type="submit" class="btn btn-default btn-sm">{tr}Switch{/tr}</button>
		</noscript>
	</form>
{/tikimodule}
{/if}
