<form method="post" action={concat( 'content/versionview/', $object.id, '/', $object_version, '/', $language, '/', $from_language )|ezurl}>

<div id="leftmenu">
<div id="leftmenu-design">

<div class="objectinfo">

<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h4>{'Object information'|i18n( 'design/admin/content/view/versionview' )}</h4>

</div></div></div></div></div></div>

<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-br"><div class="box-bl"><div class="box-content">

{* Object ID *}
<p>
<label>{'ID'|i18n( 'design/admin/content/view/versionview' )}:</label>
{$object.id}
</p>

{* Created *}
<p>
<label>{'Created'|i18n( 'design/admin/content/view/versionview' )}:</label>
{section show=$object.published}
{$object.published|l10n( shortdatetime )}<br />
{$object.current.creator.name}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/view/versionview' )}
{/section}
</p>

{* Modified *}
<p>
<label>{'Modified'|i18n( 'design/admin/content/view/versionview' )}:</label>
{section show=$object.modified}
{$object.modified|l10n( shortdatetime )}<br />
{fetch( content, object, hash( object_id, $object.content_class.modifier_id ) ).name}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/view/versionview' )}
{/section}
</p>

{* Published version *}
<p>
<label>{'Published version'|i18n( 'design/admin/content/view/versionview' )}:</label>
{section show=$object.status|eq( 1 )} {* status equal to 1 means it is published *}
{$object.main_node.contentobject_version}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/view/versionview' )}
{/section}
</p>

{* Manage versions *}
<div class="block">
{section show=$allow_versions_button}
{section show=$object.versions|count|gt( 1 )}
<input class="button" type="submit" name="VersionsButton" value="{'Manage versions'|i18n( 'design/admin/content/view/versionview' )}" title="{'View and manage (copy, delete, etc.) the versions of this object.'|i18n( 'design/admin/content/view/versionview' )}" />
{section-else}
<input class="button-disabled" type="submit" name="VersionsButton" value="{'Manage versions'|i18n( 'design/admin/content/view/versionview' )}" disabled="disabled" {'You can not manage the versions of this object because there is only one version available (the one that is being displayed).'|i18n( 'design/admin/content/view/versionview' )} />
{/section}
{section-else}
<input class="button-disabled" type="submit" name="VersionsButton" value="{'Manage versions'|i18n( 'design/admin/content/view/versionview' )}" disabled="disabled" title="{'You do not have permissions to manage the versions of this object.'i18n( 'design/admin/content/view/versionview' )}" />
{/section}
</div>

</div></div></div></div></div></div>

</div>
<br />



<div class="versioninfo">

<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h4>{'Version information'|i18n( 'design/admin/content/view/versionview' )}</h4>

</div></div></div></div></div></div>

<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-content">

{* Created *}
<p>
<label>{'Created'|i18n( 'design/admin/content/view/versionview' )}:</label>
{$version.created|l10n( shortdatetime )}<br />
{$version.creator.name}
</p>

{* Last modified *}
<p>
<label>{'Last modified'|i18n( 'design/admin/content/view/versionview' )}:</label>
{$version.modified|l10n( shortdatetime )}<br />
{$version.creator.name}
</p>

{* Status *}
<p>
<label>{'Status'|i18n( 'design/admin/content/view/versionview' )}:</label>
{$version.status|choose( 'Draft'|i18n( 'design/admin/content/view/versionview' ), 'Published / current'|i18n( 'design/admin/content/view/versionview' ), 'Pending'|i18n( 'design/admin/content/view/versionview' ), 'Archived'|i18n( 'design/admin/content/view/versionview' ), 'Rejected'|i18n( 'design/admin/content/view/versionview' ) )}
</p>

{* Version *}
<p>
<label>{'Version'|i18n( 'design/admin/content/view/versionview' )}:</label>
{$version.version}
</p>

</div></div></div></div></div>


{* View control *}
<div class="view-control">
<div class="box-header"><div class="box-ml"><div class="box-mr">
<h4>{'View control'|i18n( 'design/admin/content/view/versionview' )}</h4>
</div></div></div>
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

{* Translation *}
{section show=fetch( content, translation_list )|count|gt( 1 )}
<label>{'Translation'|i18n( 'design/admin/content/view/versionview' )}:</label>
<div class="block">
{section show=$version.language_list|count|gt( 1 )}
{section var=Translations loop=$version.language_list}
<p>
<input type="radio" name="SelectedLanguage" value="{$Translations.item.language_code}" {section show=eq( $Translations.item.locale.locale_code, $object_languagecode )}checked="checked"{/section} />
{section show=$Translations.item.locale.is_valid}
<img src="{$Translations.item.language_code|flag_icon}" alt="{$Translations.item.language_code}" style="vertical-align: middle;" /> {$Translations.item.locale.intl_language_name|shorten( 16 )}
{section-else}
{'%1 (No locale information available)'|i18n( 'design/admin/content/view/versionview',, array( $Translations.item.language_code ) )}
{/section}
</p>
{/section}
{section-else}
<input type="radio" name="SelectedLanguage" value="{$version.language_list[0].language_code}" checked="checked" disabled="disabled" />
{section show=$version.language_list[0].locale.is_valid}
<img src="{$version.language_list[0].language_code|flag_icon}" alt="{$version.language_list[0].language_code}" style="vertical-align: middle;" /> {$version.language_list[0].locale.intl_language_name|shorten( 16 )}
{section-else}
{'%1 (No locale information available)'|i18n( 'design/admin/content/view/versionview',, array( $version.language_list[0].language_code ) )}
{/section}
{/section}
</div>
{/section}

{* Location *}
{section show=$version.node_assignments|count|gt( 0 )}
<label>{'Location'|i18n( 'design/admin/content/view/versionview' )}:</label>
<div class="block">
{section show=$version.node_assignments|count|gt( 1 )}
{section var=Locations loop=$version.node_assignments}
<p>
<input type="radio" name="SelectedPlacement" value="{$Locations.item.id}" {section show=eq( $Locations.item.id, $placement )}checked="checked"{/section} />&nbsp;{$Locations.item.parent_node_obj.name|wash}
</p>
{/section}
{section-else}
<p>
<input type="radio" name="SelectedPlacement" value="{$version.node_assignments[0]}" checked="checked" disabled="disabled" />&nbsp;{$version.node_assignments[0].parent_node_obj.name|wash}
</p>
{/section}
</div>
{/section}

{* Design *}
{let site_designs=fetch( layout, sitedesign_list )}
<label>{'Design'|i18n( 'design/admin/content/view/versionview' )}:</label>
<div class="block">
{section show=$site_designs|count|gt( 1 )}
{section var=Designs loop=$site_designs}
<p>
<input type="radio" name="SelectedSitedesign" value="{$Designs.item}" {section show=eq( $Designs.item, $sitedesign )}checked="checked"{/section} />&nbsp;{$Designs.item|wash}
</p>
{/section}
{section-else}
<p>
<input type="radio" name="SelectedSitedesign" value="{$site_designs[0]}" checked="checked" disabled="disabled" />&nbsp;{$site_designs[0]|wash}
</p>
{/section}
</div>
{/let}

<input type="hidden" name="ContentObjectID" value="{$object.id}" />
<input type="hidden" name="ContentObjectVersion" value="{$object_version}" />
<input type="hidden" name="ContentObjectLanguageCode" value="{$object_languagecode}" />
<input type="hidden" name="ContentObjectPlacementID" value="{$placement}" />

<div class="block">
<input class="button" type="submit" name="ChangeSettingsButton" value="{'Update view'|i18n( 'design/admin/content/view/versionview' )}" title="{'View the version that is currently being displayed using the selected language, location and design.'|i18n( 'design/admin/content/view/versionview' )}" />
</div>

</div>
</div></div></div></div></div></div>
</div>


</div></div></div></div>
</div>


</div></div>

</div>

</div>
</div>

</form>


<div id="maincontent"><div id="fix">
<div id="maincontent-design">
<!-- Maincontent START -->

{* Content window. *}
<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title"><a href={concat( '/class/view/', $node.object.contentclass_id )|ezurl} onclick="ezpopmenu_showTopLevel( event, 'ClassMenu', ez_createAArray( new Array( '%classID%', {$node.object.contentclass_id}) ), '{$node.class_name|wash(javascript)}', -1 ); return false;">{$node.class_identifier|class_icon( normal, $node.class_name )}</a>&nbsp;{$node.name|wash}&nbsp;[{$node.class_name|wash}]</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

<div class="box-ml"><div class="box-mr">

<div class="context-information">
<p class="modified">&nbsp;</p>
<p class="translation">
{$object_languagecode|locale().intl_language_name} <img src="{$object_languagecode|flag_icon}" alt="{$object_languagecode}" style="vertical-align: middle;" />
</p>
<div class="break"></div>
</div>

{* Content preview in content window. *}
<div class="mainobject-window">
    {node_view_gui content_node=$node view=admin_preview}
</div>


</div></div>

{* Buttonbar for content window. *}
<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
<form method="post" action={concat( 'content/versionview/', $object.id, '/', $object_version, '/', $language, '/', $from_language )|ezurl}>
{section show=and( eq( $version.status, 0 ), $is_creator, $object.can_edit )}
<input class="button" type="submit" name="EditButton" value="{'Edit'|i18n( 'design/admin/content/view/versionview' )}" title="{'Edit the draft that is being displayed.'|i18n( 'design/admin/content/view/versionview' )}" />
{section-else}
<input class="button-disabled" type="submit" name="EditButton" value="{'Edit'|i18n( 'design/admin/content/view/versionview' )}" disabled="disabled" title="{'This version is not a draft and thus it can not be edited.'|i18n( 'design/admin/content/view/versionview' )}" />
{/section}
</form>
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>
</div>



<!-- Maincontent END -->
</div>
<div class="break"></div>
</div></div>
