{% with m.kazoo[{kz_list_account_list_entries list_id=list_id}] as entries %}
<ul "list_entries_ul" class="list-group">
  {% for entry in entries %}
    <li class="list-group-item text-center">
      <table style="width: 100%;">
        <tr>
          <td style="width: 40%; text-align: left;">{{ entry["value"][1]["number"] }}</td>
          <td>{{ entry["value"][1]["displayname"] }}</td>
          {% wire id="delete_"++entry["id"] action={postback postback={delete_account_list_entry 
                                                                       list_id=list_id 
                                                                       entry_id=entry["id"] 
                                                                       template_name="_list_entries_dialog.tpl"
                                                                      } 
                                                    delegate="mod_kazoo"} 
          %}
          <td><i id='delete_{{ entry["id"] }}' class="fa fa-trash-o pointer" title="Delete" style="float: right;"></i></td>
        </tr>
      </table>
    </li>
  {% endfor %}
</ul>
{% endwith %}
