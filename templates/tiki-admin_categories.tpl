{* $Id: tiki-admin_categories.tpl 51000 2014-04-25 14:31:34Z lphuberdeau $ *}
{title help="Categories" admpage="category"}{tr}Admin Categories{/tr}{/title}

<div class="t_navbar form-group">
	{button href="tiki-browse_categories.php?parentId=$parentId" class="btn btn-default" _text="{tr}Browse Categories{/tr}" _title="{tr}Browse the category system{/tr}"}
	{button href="tiki-edit_categories.php" class="btn btn-default" _text="{tr}Organize Objects{/tr}" _title="{tr}Organize Objects{/tr}"}
</div>

{if !empty($errors)}
	<div class="alert alert-warning">{section name=ix loop=$errors}{$errors[ix]}{/section}</div>
{/if}

<div class="tree" id="top">
	<div class="treetitle">{tr}Current category:{/tr} 
		<a href="tiki-admin_categories.php?parentId=0" class="categpath">{tr}Top{/tr}</a>
		{if $parentId != 0}
		{foreach $path as $id=>$name}
			&nbsp;::&nbsp;
			<a class="categpath" href="tiki-admin_categories.php?parentId={$id}">{$name|escape}</a>
		{/foreach}
		<br>
		{tr}Current Category ID:{/tr} {$parentId}
		{/if}
	</div>
</div>

{$tree}

{tabset}
	{tab name="{tr}Create/Edit category{/tr}"}
		{if $categId > 0}
			<h2>{tr}Edit this category:{/tr} <b>{$categoryName|escape}</b> </h2>
			{button href="tiki-admin_categories.php?parentId=$parentId#editcreate" _text="{tr}Create New{/tr}" _title="{tr}Create New{/tr}"}
		{else}
			<h2>{tr}Add new category{/tr}</h2>
		{/if}
		<form action="tiki-admin_categories.php" method="post" class="form-horizontal" role="form">
			<input type="hidden" name="categId" value="{$categId|escape}">
			<div class="form-group">
                <label class="col-sm-3 control-label" for="parentId">{tr}Parent{/tr}</label>
				<div class="col-sm-9">
					<select name="parentId" id="parentId" class="form-control">
						{if $tiki_p_admin_categories eq 'y'}<option value="0">{tr}Top{/tr}</option>{/if}
							{foreach $categories as $category}
					    		<option value="{$category.categId}" {if $category.categId eq $parentId}selected="selected"{/if}>{$category.categpath|escape}</option>
							{/foreach}
					</select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="parentId">{tr}Name{/tr}</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="name" id="name" value="{$categoryName|escape}">
			    </div>
			</div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="description">{tr}Description{/tr}</label>
                <div class="col-sm-9">
					<textarea rows="2" class="form-control" name="description" id="description">{$description|escape}</textarea>
                </div>
            </div>
			{if $tiki_p_admin_categories == 'y'}
                <div class="form-group">
					<div class="col-sm-9 col-sm-offset-3">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="parentPerms" {if empty($categId)}checked="checked"{/if}>
								{tr}Apply parent category permissions{/tr}
							</label>
						</div>
				    </div>
                </div>
			{/if}
            <div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<input type="submit" class="btn btn-primary" name="save" value="{tr}Save{/tr}">
				</div>
            </div>
		</form>
	{/tab}

	{if $categId <= 0}
		{tab name="{tr}Batch upload{/tr}"}
			<h2>{tr}Batch upload{/tr}</h2>
			<form action="tiki-admin_categories.php" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
                <div class="form-group">
					<label class="control-label col-sm-3">{tr}CSV File{/tr}</label>
                    <div class="col-sm-9">
    				    <input type="file" class="form-control" name="csvlist">
						<div class="help-block">
{tr}Sample file content{/tr}
<pre>
category,description,parent
vegetable,vegetable
potato,,vegetable
</pre>
						</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3 col-sm-offset-3">
    				    <input type="submit" class="btn btn-primary" name="import" value="{tr}Upload{/tr}">
                    </div>
                </div>
            </form>
		{/tab}
	{/if}
	{if $parentId != 0}
	{tab name="{tr}Objects in category{/tr}"}
		<h2>{tr}Objects in category:{/tr} {$categ_name|escape}</h2>
		{if $objects}
			<form method="get" action="tiki-admin_categories.php">
				<label>{tr}Find:{/tr}<input type="text" name="find"></label>
				<input type="hidden" name="parentId" value="{$parentId|escape}">
				<input type="submit" class="btn btn-default btn-sm" value="{tr}Filter{/tr}" name="search">
				<input type="hidden" name="sort_mode" value="{$sort_mode|escape}">
				<input type="hidden" name="find_objects" value="{$find_objects|escape}">
			</form>
		{/if}
        <div class="table-responsive">
		<table class="table normal">
			<tr>
				<th>&nbsp;</th>
				<th>
					<a href="tiki-admin_categories.php?parentId={$parentId}&amp;offset={$offset}&amp;sort_mode={if $sort_mode eq 'name_desc'}name_asc{else}name_desc{/if}#objects">{tr}Name{/tr}</a>
				</th>
				<th>
					<a href="tiki-admin_categories.php?parentId={$parentId}&amp;offset={$offset}&amp;sort_mode={if $sort_mode eq 'type_desc'}type_asc{else}type_desc{/if}#objects">{tr}Type{/tr}</a>
				</th>
			</tr>

			{section name=ix loop=$objects}
				<tr>
					<td class="icon">
						<a href="tiki-admin_categories.php?parentId={$parentId}&amp;removeObject={$objects[ix].catObjectId}&amp;fromCateg={$parentId}" title="{tr}Remove from this Category{/tr}">{icon _id='link_delete' alt="{tr}Remove from this Category{/tr}"}</a>
					</td>
					<td class="text">
						<a href="{$objects[ix].href}" title="{$objects[ix].name}">{$objects[ix].name|truncate:80:"(...)":true|escape}</a>
					</td>
					<td class="text">{tr}{$objects[ix].type}{/tr}</td>
				</tr>
			{sectionelse}
				{norecords _colspan=3}
			{/section}
		</table>
        </div>

		{pagination_links cant=$cant_objects step=$prefs.maxRecords offset=$offset}{/pagination_links}
	{/tab}
	
		{tab name="{tr}Moving objects between categories{/tr}"}
			<h2>{tr}Moving objects between categories{/tr}</h2>
			<form method="get" action="tiki-admin_categories.php" name="move">
				<input type="hidden" name="parentId" value="{$parentId|escape}">
				<input type="submit" class="btn btn-default btn-sm" name="unassign" value="{tr}Unassign all objects from this category{/tr}">
				<hr>
				<select name="toId">
				{foreach $categories as $category}
					<option value="{$category.categId}" {if $category.categId eq $parentId}selected="selected"{/if}>{$category.categpath|escape}</option>
				{/foreach}
				</select>
				<input type="submit" class="btn btn-default btn-sm" name="move_to" value="{tr}Move all the objects from this category to this one{/tr}">
				<hr>
				<select name="to">
				{foreach $categories as $category}
					<option value="{$category.categId}" {if $category.categId eq $parentId}selected="selected"{/if}>{$category.categpath|escape}</option>
				{/foreach}				</select>
				<input type="submit" class="btn btn-default btn-sm" name="copy_from" value="{tr}Assign all objects of this category to this one{/tr}">
			</form>
		{/tab}
				
		{tab name="{tr}Add objects to category{/tr}"}
			<h2>{tr}Add objects to category:{/tr} <b>{$categ_name|escape}</b></h2>
			{if $prefs.feature_search eq 'y' and $prefs.unified_add_to_categ_search eq 'y'}
				<form id="add_object_form" method="post" action="{service controller=category action=categorize}">
					<label>Types of object
						<select id="add_object_type">
							<option value="">{tr}All{/tr}</option>
							{foreach $types as $type => $title}
								<option value="{$type|escape}">{$title|escape}</option>
							{/foreach}
						</select>
					</label>
					<label>
						{tr}Objects{/tr}
						<input type="text" id="add_object_selector" name="objects">
					</label>
					<div>
						<input type="hidden" name="categId" value="{$parentId|escape}">
						<input type="hidden" name="confirm" value="1">
						<input type="submit" class="btn btn-default btn-sm" value="{tr}Add{/tr}">
						<span id="add_object_message" style="display: none;"></span>
					</div>
				</form>
				{jq}
$("#add_object_form").unbind("submit").submit(function (e) {
	var form = this;
	$.ajax($(form).attr('action'), {
		type: 'POST',
		dataType: 'json',
		data: $(form).serialize(),
		success: function (data) {
			data = (data ? data : {});
			$("option:selected", "#add_object_selector ~ select").remove();
			var $table = $("input[name=sort_mode]").parents("form").next("table");
			oddeven = $("tr:last", $table).hasClass("odd") ? "even" : "odd";
			var $row = $("<tr />").addClass(oddeven);
			$row.append("<td class=\"icon\">" +
						"<a href=\"tiki-admin_categories.php?parentId=" + data.categId +
								"&amp;removeObject=" +  data.objects[0].catObjectId + "&amp;fromCateg=" + data.categId + "\">"+
							"<img width=\"16\" height=\"16\" class=\"icon\" src=\"img/icons/link_delete.png\">"+
						"</a></td>" +
						"<td class=\"text\">"+
							"<a href=\"#\">" + data.objects[0].id + "</a></td>" +
						"<td class=\"text\">" + data.objects[0].type + "</a></td>");
			$table.append($row);
			$("#add_object_message")
				.text(tr("Categorized..."))
				.fadeIn("fast", function () {
					setTimeout(function() {$("#add_object_message").fadeOut("slow");}, 3000);
				});
		},
		error: function (jqxhr) {
			$(form).showError(jqxhr);
		}
	});
	return false;
});
$("#add_object_type").change(function () {
	$("#add_object_selector")
		.object_selector(
			{
				type: $("#add_object_type").val(),
				categories: "not " + $("input[name=categId]", "#add_object_form").val()
			},
			{{$prefs.maxRecords|escape}}
		);
}).change();
				{/jq}
			{else}{* feature_search=n (not unified search) *}

			<form method="get" action="tiki-admin_categories.php">
				<label for="find_objects">{tr}Find:{/tr}<input type="text" name="find_objects" id="find_objects"></label>
				<input type="hidden" name="parentId" value="{$parentId|escape}">
				<input type="submit" class="btn btn-default btn-sm" value="{tr}Filter{/tr}" name="search_objects">
				<input type="hidden" name="sort_mode" value="{$sort_mode|escape}">
				<input type="hidden" name="offset" value="{$offset|escape}">
				<input type="hidden" name="find" value="{$find|escape}">
			</form>
			{pagination_links cant=$maximum step=$maxRecords offset=$offset}{/pagination_links}
			<form action="tiki-admin_categories.php" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="parentId" value="{$parentId|escape}">
					{if $prefs.feature_wiki eq 'y' and $pages}
                        <div class="form-group">
				            <label class="col-sm-3" for="pageName">{tr}Page{/tr}</label>
                            <div class="col-sm-7">
							    <select name="pageName[]" id="pageName" class="form-control" multiple="multiple" size="5">
								    {section name=ix loop=$pages}
									    <option value="{$pages[ix].pageName|escape}">{$pages[ix].pageName|truncate:80:"(...)":true|escape}</option>
								    {/section}
							    </select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default" name="addpage" value="{tr}Add{/tr}">
						    </div>
                        </div>
					{/if}
					
					{if $prefs.feature_articles eq 'y' and $articles}
                        <div class="form-group">
                            <label class="col-sm-3" for="articleId">{tr}Article{/tr}</label>
                            <div class="col-sm-7">
						        <select name="articleId" id="articleId">
							        {section name=ix loop=$articles}
						    		    <option value="{$articles[ix].articleId|escape}">{$articles[ix].title|truncate:80:"(...)":true|escape}</option>
							        {/section}
						        </select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default" name="addarticle" value="{tr}Add{/tr}"></td>
						    </div>
                        </div>
					{/if}
						
					{if $prefs.feature_blogs eq 'y' and $blogs}
                        <div class="form-group">
                            <label class="col-sm-3" for="blogId">{tr}Blog{/tr}</label>
                            <div class="col-sm-7">
								<select name="blogId" id="blogId">
									{section name=ix loop=$blogs}
										<option value="{$blogs[ix].blogId|escape}">{$blogs[ix].title|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addblog" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
					
					{if $prefs.feature_directory eq 'y'and $directories}
                        <div class="form-group">
                            <label class="col-sm-3" for="directoryId">{tr}Directory{/tr}</label>
                            <div class="col-sm-7">
						        <select name="directoryId" id="directoryId">
							        {section name=ix loop=$directories}
								        <option value="{$directories[ix].categId|escape}">{$directories[ix].name|truncate:40:"(...)":true|escape}</option>
							        {/section}
						        </select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="adddirectory" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}

					{if $prefs.feature_galleries eq 'y' and $galleries}
                        <div class="form-group">
                            <label class="col-sm-3" for="galleryId">{tr}image gal{/tr}</label>
                            <div class="col-sm-7">
								<select name="galleryId" id="galleryId">
									{section name=ix loop=$galleries}
										<option value="{$galleries[ix].galleryId|escape}">{$galleries[ix].name|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addgallery" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
			
					{if $prefs.feature_file_galleries eq 'y' and $file_galleries}
                        <div class="form-group">
                            <label class="col-sm-3" for="file_galleryId">{tr}File gal{/tr}</label>
                            <div class="col-sm-7">
								<select name="file_galleryId" id="file_galleryId">
									{section name=ix loop=$file_galleries}
										<option value="{$file_galleries[ix].id|escape}">{$file_galleries[ix].name|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addfilegallery" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
			
					{if $prefs.feature_forums eq 'y' and $forums}
                        <div class="form-group">
                            <label class="col-sm-3" for="forumId">{tr}Forum{/tr}</label>
                            <div class="col-sm-7">
								<select name="forumId" id="forumId">
									{section name=ix loop=$forums}
										<option value="{$forums[ix].forumId|escape}">{$forums[ix].name|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addforum" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
				
					{if $prefs.feature_polls eq 'y' and $polls}
                        <div class="form-group">
                            <label class="col-sm-3" for="pollId">{tr}Poll{/tr}</label>
                            <div class="col-sm-7">
								<select name="pollId" id="pollId">
									{section name=ix loop=$polls}
										<option value="{$polls[ix].pollId|escape}">{$polls[ix].title|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addpoll" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
					
					{if $prefs.feature_faqs eq 'y and $faqs'}
                        <div class="form-group">
                        <label class="col-sm-3" for="faqId">{tr}FAQ{/tr}</label>
                            <div class="col-sm-7">
								<select name="faqId" id="faqId">
									{section name=ix loop=$faqs}
										<option value="{$faqs[ix].faqId|escape}">{$faqs[ix].title|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addfaq" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
				
					{if $prefs.feature_trackers eq 'y' and $trackers}
                        <div class="form-group">
                        <label class="col-sm-3" for="trackerId">{tr}Tracker{/tr}</label>
                            <div class="col-sm-7">
							    <select name="trackerId" id="trackerId">
								    {section name=ix loop=$trackers}
										<option value="{$trackers[ix].trackerId|escape}">{$trackers[ix].name|truncate:80:"(...)":true|escape}</option>
									{/section}
								</select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" name="addtracker" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}
						
					{if $prefs.feature_quizzes eq 'y' and $quizzes}
                        <div class="form-group">
                            <label class="col-sm-3" for="quizId">{tr}quiz{/tr}</label>
                            <div class="col-sm-7">
						        <select name="quizId" id="quizId">
								    {section name=ix loop=$quizzes}
									    <option value="{$quizzes[ix].quizId|escape}">{$quizzes[ix].name|truncate:80:"(...)":true|escape}</option>
							    	{/section}
							    </select>
                            </div>
                            <div class="col-sm-2">
                                <input type="submit" class="btn btn-default btn-sm" name="addquiz" value="{tr}Add{/tr}">
                            </div>
                        </div>
					{/if}

			</form>
			{pagination_links cant=$maximum step=$maxRecords offset=$offset}{/pagination_links}
			{/if}
		{/tab}
	{/if}
{/tabset}
