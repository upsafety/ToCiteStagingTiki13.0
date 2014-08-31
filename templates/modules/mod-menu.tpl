{* $Id: mod-menu.tpl 51327 2014-05-16 13:56:17Z jonnybradley $ *}

{tikimodule error=$module_error title=$tpl_module_title name=$tpl_module_name flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox notitle=$module_params.notitle type=$module_type}
	{if $module_params.bootstrap neq 'n'}
		{if $module_params.type eq 'horiz'}
			<nav class="navbar navbar-default" role="navigation">
				{* <div class="container"> *}
				{if $module_params.navbar_toggle neq 'n'}
		            <div class="navbar-header">
		                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		                    <span class="sr-only">Toggle navigation</span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                </button>
		            </div>
				{/if}
				<div class="collapse navbar-collapse">
					{menu params=$module_params bootstrap=navbar}
				</div>
		        {* </div> *}
			</nav>
		{else}
			{menu params=$module_params bootstrap=basic}
		{/if}
	{else}{* non bootstrap legacy menus *}
		<div class="clearfix {$module_params.menu_class}"{if !empty($module_params.menu_id)} id="{$module_params.menu_id}"{/if}>
			{menu params=$module_params}
		</div>
	{/if}
{/tikimodule}
