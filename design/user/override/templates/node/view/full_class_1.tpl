{let page_limit=8
     list_count=fetch('content','list_count',hash(parent_node_id,$node.node_id,class_filter_type,exclude,class_filter_array,array(1,24)))}

{attribute_view_gui attribute=$node.object.data_map.description}

<table width="100%" border="0" align="top" cellpadding="0" cellspacing="0">
{section name=Child loop=fetch('content','list',hash(parent_node_id,$node.node_id,limit,$page_limit,offset,$view_parameters.offset,class_filter_type,exclude,class_filter_array,array(1,24))))}
<tr>
    <td valign="top">
    {node_view_gui view=line content_node=$Child:item}
    </td>
</tr>
{/section}
</table>