{section show=$forward_info}
    <div class="message-error">
        <h2>{'The requested URL forwarding could not be created.'|i18( 'design/admin/content/urltranslator' )}<span class="time">{currentdate()|l10n(shortdatetime)}</span></h2>
         <ul>
             <li>
                {'The destination URL <%destination_url> does not exist in the system.'|i18n( 'design/admin/content/urltranslator',, hash( '%destination_url', $forward_info.destination ) )|wash}
            </li>
         </ul>
    </div>
{/section}

<form name="urltranslator" action={concat( 'content/urltranslator/' )|ezurl} method="post" >

{* New URL translation *}
<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{'New URL translation'|i18n( 'design/admin/content/urltranslator' )}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<table class="list" cellspacing="0">
<tr>
<th width="40%">{'Virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th>{'System URL'|i18n( 'design/admin/content/urltranslator' )}</th>

<th class="tight">&nbsp;</th>
</tr>
<tr>
<td>
{'Example: /services'|i18n( 'design/admin/content/urltranslator' )}
</td>
<td>
{'Example: /content/view/full/42'|i18n( 'design/admin/content/urltranslator' )}
</td>
<td>
&nbsp;
</td>
</tr>
<tr>
<td>
<input type="text" name="NewURLAliasSource" value="{cond(and($translation_info,$translation_info.error),$translation_info.source, '')|wash}" />
</td>
<td>
<input type="text" name="NewURLAliasDestination" value="{cond(and($translation_info,$translation_info.error),$translation_info.destination, '')|wash}" />
</td>
<td>
<input class="button" type="submit" name="NewURLAliasButton" value="{'Add'|i18n( 'design/admin/content/urltranslator' )}" />
</td>
</tr>
</table>
{* DESIGN: Content END *}</div></div></div></div></div></div>
</div>



{* New URL forwarding *}
<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{'New URL forwarding'|i18n( 'design/admin/content/urltranslator' )}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<table class="list" cellspacing="0">
<tr>
<th width="40%">{'Existing virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th>{'Old virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th class="tight">&nbsp;</th>
</tr>
<tr>
<td>
{'Example: /services'|i18n( 'design/admin/content/urltranslator' )}
</td>
<td>
{'Example: /about/service'|i18n( 'design/admin/content/urltranslator' )}
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
<input type="text" name="NewForwardURLAliasSource" value="{cond(and($forward_info,$forward_info.error),$forward_info.source, '')|wash}" />
</td>
<td>
<input type="text" name="NewForwardURLAliasDestination" value="{cond(and($forward_info,$forward_info.error),$forward_info.destination, '')|wash}" />
</td>
<td>
<input class="button" type="submit" name="NewForwardURLAliasButton" value="{'Add'|i18n( 'design/admin/content/urltranslator' )}" />
</td>
</tr>
</table>
{* DESIGN: Content END *}</div></div></div></div></div></div>
</div>


{* New URL wildcard *}
<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{'New URL wildcard'|i18n( 'design/admin/content/urltranslator' )}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<table class="list" cellspacing="0">
<tr>
<th>{'Existing virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th>{'Old virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th>{'Forwarding URL'|i18n( 'design/admin/content/urltranslator' )}</th>
<th class="tight">&nbsp;</th>
</tr>
<tr>
<td>
{'Example: /developer/*'|i18n( 'design/admin/content/urltranslator' )}
</td>
<td>
{'Example:'|i18n( 'design/admin/content/urltranslator' )}&nbsp;{literal}/dev/{1}{/literal}
</td>
<td>
&nbsp;
</td>
<td>
&nbsp;
</td>
</tr>
<tr>
<td>
<input type="text" name="NewWildcardURLAliasSource" value="{cond(and($wildcard_info,$wildcard_info.error),$wildcard_info.destination, '')|wash}" />
</td>
<td>
<input type="text" name="NewWildcardURLAliasDestination" value="{cond(and($wildcard_info,$wildcard_info.error),$wildcard_info.source, '')|wash}" />
</td>
<td>
<input type="checkbox" name="NewWildcardURLAliasIsForwarding" value="1" checked="checked" />
</td>
<td>
<input class="button" type="submit" name="NewWildcardURLAliasButton" value="{'Add'|i18n( 'design/admin/content/urltranslator' )}" />
</td>
</tr>
</table>
{* DESIGN: Content END *}</div></div></div></div></div></div>
</div>




{* Custom URL translations  *}
<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{'Custom URL translations [%alias_count]'|i18n( 'design/admin/content/urltranslator' ,, hash( '%alias_count', $alias_list|count ) )}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

{section show=$alias_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/admin/content/urltranslator' )}" onclick="ezjs_toggleCheckboxes( document.urltranslator, 'URLAliasSelection[]' ); return false;" title="{'Invert selection.'|i18n( 'design/admin/content/urltranslator' )}" /></th>
    <th>{'Virtual URL'|i18n( 'design/admin/content/urltranslator' )}</th>
    <th>{'System URL'|i18n( 'design/admin/content/urltranslator' )}</th>
    <th>{'Type'|i18n( 'design/admin/content/urltranslator' )}</th>
</tr>
{section name=Alias loop=$alias_list show=$alias_list sequence=array( bglight, bgdark )}
<tr class="{$Alias:sequence}">
    <td><input type="checkbox" name="URLAliasSelection[]" value="{$Alias:item.id}" /></td>
    <td>
        <input type="text" name="URLAliasSourceValue[{$Alias:item.id}]" value="{$Alias:item.source_url|wash}" />
    </td>
    <td>
    {section show=$Alias:item.forward_to_id|eq(0)}
        <input type="text" name="URLAliasDestinationValue[{$Alias:item.id}]" value="{$Alias:item.destination_url|wash}" />
    {section-else}
        {section show=$Alias:item.forward_to_id|eq( -1 )}
            {'Forwards to'|i18n( 'design/admin/content/urltranslator' )}&nbsp;<a href={$Alias:item.destination_url|ezurl}>{$Alias:item.destination_url|wash}</a><br/>
        {section-else}
            {'Forwards to'|i18n( 'design/admin/content/urltranslator' )}&nbsp;<a href={$Alias:item.forward_url.destination_url|ezurl}>{$Alias:item.forward_url.source_url|wash}</a><br/>
        {/section}
    {/section}
    </td>
    <td>
    {section show=$Alias:item.is_wildcard|gt(0)}
        {'Wildcard'|i18n( 'design/admin/content/urltranslator' )}
    {section-else}
        {section show=$Alias:item.forward_to_id|eq(0)}
            {'Translation'|i18n( 'design/admin/content/urltranslator' )}
        {section-else}
            {'Forwarding'|i18n( 'design/admin/content/urltranslator' )}
        {/section}
    {/section}
    </td>
</tr>
{/section}
</table>

<div class="context-toolbar">
{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri='/content/urltranslator'
         item_count=$alias_count
         view_parameters=$view_parameters
         item_limit=$alias_limit}
</div>
{section-else}
<div class="block">
<p>{'There are no custom URL translations.'|i18n( 'design/admin/content/urltranslator' )}</p>
</div>
{/section}

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
{section show=$alias_list}
<input class="button" type="submit" name="RemoveURLAliasButton" value="{'Remove selected'|i18n( 'design/admin/content/urltranslator' )}" />
<input class="button" type="submit" name="StoreURLAliasButton"  value="{'Apply changes'|i18n( 'design/admin/content/urltranslator' )}" />
{section-else}
<input class="button-disabled" type="submit" name="RemoveURLAliasButton" value="{'Remove selected'|i18n( 'design/admin/content/urltranslator' )}" disabled="disabled" />
<input class="button-disabled" type="submit" name="StoreURLAliasButton"  value="{'Apply changes'|i18n( 'design/admin/content/urltranslator' )}" disabled="disabled" />
{/section}
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

</form>
