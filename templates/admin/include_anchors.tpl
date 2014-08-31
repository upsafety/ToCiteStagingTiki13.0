{*$Id: include_anchors.tpl 50912 2014-04-23 16:54:05Z lphuberdeau $*}

{foreach from=$icons key=page item=info}
	{if ! $info.disabled and $info.icon}
		{self_link _icon=$info.icon _icon_class="reflect" _width="32" _height="32" _alt=$info.title page=$page _class="icon tips bottom" _title="`$info.title`|`$info.description`"}{/self_link}
	{/if}
{/foreach}
