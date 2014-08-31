{* $Id: mod-babelfish_links.tpl 49461 2014-01-20 11:21:34Z chibaguy $ *}
{strip}
{tikimodule error=$module_params.error title=$tpl_module_title name=$tpl_module_name flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox notitle=$module_params.notitle}
		<ul>
			{section loop=$babelfish_links name=i}
				<li>
					<a href="{$babelfish_links[i].href}" target="{$babelfish_links[i].target}">{$babelfish_links[i].msg}</a>
				</li>
			{sectionelse}
				{if $tiki_p_admin eq 'y'}
					<li class="alert-warning">Babelfish ({tr}debug{/tr}): {tr}Fatal error{/tr}</li>
				{/if}
			{/section}
		</ul>
{/tikimodule}
{/strip}
