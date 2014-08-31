{* $Id: tiki-wizard_user.tpl 50970 2014-04-24 17:27:17Z lphuberdeau $ *}
{extends "layout_plain.tpl"}

{block name="title"}
{title}{tr}User Wizard{/tr}{/title}

{/block}

{block name="content"}
<form action="tiki-wizard_user.php" method="post">
{include file="wizard/wizard_bar_user.tpl"}
<div id="wizardBody"> 
<table class="adminWizardTable">
	<tr>
	{if !empty($wizard_toc)}
		<td class="adminWizardTOC">
			<span class="adminWizardTOCTitle">{tr}Wizard Steps{/tr}</span><br>
			{$wizard_toc}
		</td>
	{/if}
		<td class="adminWizardBody">
			{$wizardBody}
		</td>
	</tr>
</table>
</div>
{include file="wizard/wizard_bar_user.tpl"}
</form>
{/block}
