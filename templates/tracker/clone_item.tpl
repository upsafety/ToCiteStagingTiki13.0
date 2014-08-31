{extends 'layout_view.tpl'}

{block name="title"}
	{title}{$title|escape}{/title}
{/block}

{block name="content"}
<form class="simple" method="post" action="{service controller=tracker action=clone_item}">
	{trackerfields trackerId=$trackerId fields=$fields}
	<div class="submit">
		<input type="hidden" name="itemId" value="{$itemId|escape}">
		<input type="hidden" name="trackerId" value="{$trackerId|escape}">
		<input type="submit" class="btn btn-default btn-sm" value="{tr}Clone{/tr}">
	</div>
</form>
{/block}
