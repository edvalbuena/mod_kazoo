<div class="row text-center" style="padding-right: 195px;">
<h3>Callflow Builder</h3>
</div>
<div class="row" style="padding: 1em;">
  <div class="col-xs-2">
    {% wire id="callflow_manager_selector" type="change" action={ postback postback={cf_load}  delegate="inno"} %}
    <select id="callflow_manager_selector" name="selected" class="col-xs-12 form-control margin-bottom-xs" style="text-align:center;">
      <option value="">-Select to edit-</option>
      <option value="new">-Add new Callflow-</option>
      {% for option in m.inno.kz_list_account_callflows %}
        {% if not option["featurecode"] and ( option["numbers"][1]|match:"^\\+?\\d+$" or option["patterns"][1] ) %}
          <option value="{{ option["id"] }}" {% if m.session.current_callflow[1]["id"] == option["id"] %}selected{% endif %}>
            {% if option["name"] %}{{ option["name"] }}{% elseif option["numbers"][1] %}{{ option["numbers"][1] }}{% else %}{{ option["patterns"][1] }}{% endif %}
          </option>
        {% endif %}
      {% endfor %}
    </select>
  </div>
  {% wire id="cf_reload_btn" action={confirm text="Do you really want to reload this callflow?"
                                   action={postback postback={cf_reload cf="current_callflow"} delegate="inno"}
                           }
  %}
  <div class="col-xs-2">
    <button id="cf_reload_btn" class="col-xs-12 btn btn-zprimary margin-bottom-xs">Reload</button>
  </div>
  {% wire id="cf_details_btn" action={ dialog_open title=_"Callflow details" template="_cf_current_callflow_details.tpl" class="iamclass" width="auto" } %}
  <div class="col-xs-2">
    <button id="cf_details_btn" class="col-xs-12 btn btn-zprimary margin-bottom-xs">Details</button>
  </div>
  {% wire id="cf_save_btn" action={confirm text="Do you really want to save this callflow?"
                                   action={postback postback={cf_save cf="current_callflow"} delegate="inno"}
                           }
  %}
  <div class="col-xs-2">
    <button id="cf_save_btn" class="col-xs-12 btn btn-zprimary margin-bottom-xs">Save</button>
  </div>
  {% wire id="cf_delete_btn" action={confirm text="Do you really want to delete this callflow?"
                                     action={postback postback={cf_delete cf="current_callflow"} delegate="inno"}
                             } 
  %}
  <div class="col-xs-2">
    <button id="cf_delete_btn" class="col-xs-12 btn btn-onnet-orange margin-bottom-xs">Delete</button>
  </div>
</div>

<div id="callflow_container" style="width:100%!important">
  <div class="callflow-view clearfix">
    <div class="real-content">
      <div id="ws_callflow" class="clearfix">
        {% include "kzui_cf_tools.tpl" %}
        <div class="flowchart">
          <div class="callflow">
            <div>
              <span class="flow">
                <div id="ws_cf_flow">
                  <div class="child">
                    {% droppable id="flow0" tag={drop_args drop_id="flow" drop_parent="root"} delegate="inno" %}
                    <div id="flow0" class="branch">
                      <div name="root" class="node">
                        <div class="root">
                          <div class="top_bar">
                            {% wire action={connect signal={update_cf_edit_name} action={update target="cf_edit_name" template="_cf_name.tpl"}} %}
                            <span id="cf_edit_name" class="name">
                              {% include "_cf_name.tpl" %}
                            </span>
                            {% wire id="cf_edit_name_icon" action={ dialog_open title=_"Edit callflow name" template="_cf_edit_name.tpl" } %}
                            <span id="cf_edit_name_icon" class="edit_icon">
                            </span>
                            <div class="tooltip">
                            </div>
                          </div>
                          {% wire action={connect signal={update_cf_numbers_div} action={update target="cf_numbers_div" template="_cf_numbers.tpl"}} %}
                          <div id="cf_numbers_div" class="content">
                              {% include "_cf_numbers.tpl" %}
                          </div>
                        </div>
                      </div>
                      <div id="flow-root" class="children">
                      {% wire action={postback postback={check_children id="flow0" drop_id="flow" drop_parent="root"} delegate="inno"} %}
                      </div>
                    </div>
                  </div>
                </div>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
