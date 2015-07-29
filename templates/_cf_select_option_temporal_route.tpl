{% wire id="form_cf_select_option_temporal_route" type="submit" postback="cf_select_option_temporal_route" delegate="inno" %}
<form id="form_cf_select_option_temporal_route" method="post" action="postback">
    <div class="form-group">
      <div class="row">
        <div class="col-sm-6 text-center">
            Choose menu option
        </div>
        <div class="col-sm-6">
            <select id="menu_key_selector" name="switch" class="form-control margin-bottom-xs" style="text-align:center;">
              {% for key in available_keys %}
                  <option value="{{ key }}">{% if key=="_" %}Default action{% else %}{{ m.inno[{kz_get_temporal_rule rule_id=key}][1]["name"] }}{% endif %}</option>
              {% endfor %}
            </select>
        </div>
      </div>
    </div>
    <input type="hidden" name="tool_name" value="{{ tool_name }}">
    <input type="hidden" name="drop_id" value="{{ drop_id }}">
    <input type="hidden" name="drop_parent" value="{{ drop_parent }}">
    <input type="hidden" name="branch_id" value="{{ branch_id }}">
    <input type="hidden" name="existing_element_id" value="{{ existing_element_id }}">
</form>
<div class="form-group">
  <div class="row">
    <div class="col-sm-12">
      <button id="button_cf_select_option_temporal_route" class="col-xs-12 btn btn-zprimary margin-bottom-xs">Save</button>
    </div>
  </div>
</div>
{% wire id="button_cf_select_option_temporal_route" action={submit target="form_cf_select_option_temporal_route"} %}

