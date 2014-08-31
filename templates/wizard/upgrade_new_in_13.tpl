{* $Id: upgrade_new_in_13.tpl 51562 2014-06-01 15:52:26Z chibaguy $ *}

<div class="media">
    <img class="pull-left" src="img/icons/large/wizard_upgrade48x48.png" alt="{tr}Upgrade Wizard{/tr}" title="{tr}Upgrade Wizard{/tr}"/>
    <div class="media-body">
        {tr}Main new features and settings in Tiki 13{/tr}.
        <a href="http://doc.tiki.org/Tiki13" target="tikihelp" class="tikihelp" title="{tr}Tiki13:{/tr}
	        {tr}Tiki13 is a post-LTS version{/tr}.
            {tr}It will be supported until 14.1 is released{/tr}.
            {tr}The requirements increased (IE9, PHP 5.5){/tr}.
            {tr}Major changes have happened, including moving to Bootstrap{/tr}.
            <br/><br/>
            {tr}Click to read more{/tr}
	    ">
        <img src="img/icons/help.png" alt="" width="16" height="16" class="icon" />
        </a>
        <fieldset class="table clearfix featurelist">
            <legend>{tr}New Themes{/tr} & {tr}Site layouts (based on 'Bootstrap'){/tr}</legend>
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
        </fieldset>
        <fieldset class="table clearfix featurelist">
            <legend>{tr}Goal, Recognition and Rewards{/tr}</legend>
            {preference name=goal_enabled}
                <div class="adminoptionboxchild" id="goal_enabled_childcontainer">
		            {preference name=goal_badge_tracker}
		            {preference name=goal_group_blacklist}
	            </div>
        </fieldset>
        <fieldset class="table clearfix featurelist">
            <legend>{tr}Notifications{/tr}</legend>
            {preference name=monitor_enabled}
            <div class="adminoptionboxchild" id="monitor_enabled_childcontainer">
                {preference name=monitor_individual_clear}
                {preference name=monitor_count_refresh_interval}
                {preference name=monitor_reply_email_pattern}
                {preference name=monitor_digest}
                <div class="alert alert-warning">
                    <p>{tr}For the digest emails to be sent out, you will need to set-up a cron job.{/tr}</p>
                    <p>{tr}Adjust the command parameters for your digest frequency. Default frequency is 7 days.{/tr}</p>
                    <strong>{tr}Sample command:{/tr}</strong>
                    <code>/usr/bin/php {$monitor_command|escape}</code>
                </div>
            </div>
        </fieldset>
        <fieldset class="table clearfix featurelist">
            <legend>{tr}Jitsi{/tr}</legend>
            <div class="form-row">
                <label for="jitsi-url">{tr}Provision URL{/tr}</label>
                <input id="jitsi-url" readonly type="text" value="{$jitsi_url|escape}" class="form-control">
            </div>
            {preference name=suite_jitsi_provision}
            {preference name=suite_jitsi_configuration}
        </fieldset>
    </div>
</div>