<ul class="nav">
	{foreach from=$list item=item}
		{if !empty($item.children)}
			<li class="{if !empty($item.selected)} active{/if}">
				<a href="#menu_option{$item.optionId|escape}" class="collapse-toggle" data-toggle="collapse">
					{tr}{$item.name|escape}{/tr}
					<b class="caret"></b>
				</a>
				<ul id="menu_option{$item.optionId|escape}" class="nav collapse">
					{foreach from=$item.children item=sub}
						<li{if !empty($sub.selected)} class="active"{/if}>
							<a href="{$sub.sefurl|escape}">{glyph name="minus"} {tr}{$sub.name|escape}{/tr}</a>
						</li>
					{/foreach}
				</ul>
			</li>
		{else}
			<li{if !empty($item.selected)} class="active"{/if}><a href="{$item.sefurl|escape}">{tr}{$item.name|escape}{/tr}</a></li>
		{/if}
	{/foreach}
</ul>
