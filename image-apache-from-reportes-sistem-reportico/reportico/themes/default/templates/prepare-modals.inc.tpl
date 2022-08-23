{% if REPORTICO_BOOTSTRAP_MODAL %}
{% if BOOTSTRAP_STYLES == "joomla3" %}

<style type="text/css">
    #reporticoModal .modal-dialog .modal-content
    {
        width:900px; margin-left:-150px;
    }
</style>

{% endif %}
<div class="modal fade" id="reporticoModal" tabindex="-1" role="dialog" aria-labelledby="reporticoModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close reportico-bootstrap-modal-close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title reportico-modal-title" id="reporticoModalLabel">Set Parameter</h4>
            </div>
            <div class="modal-body" style="padding: 0px; overflow-y: auto" id="reportico-edit-link">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-primary reportico-edit-linkSubmit" >Close</button>
        </div>
    </div>
  </div>
</div>
<a id="a_reporticoNoticeModal" href="#reporticoNoticeModal" role="button" class="btn" data-target="#reporticoNoticeModal" data-toggle="modal" style="display:none">B2</a>
<div class="modal fade" id="reporticoNoticeModal" tabindex="-1" role="dialog" aria-labelledby="reporticoNoticeModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close" aria-hidden="true">&times;</button>
            <h4 class="modal-title reportico-notice-modal-title" id="reporticoNoticeModalLabel">{{ T_NOTICE }}</h4>
            </div>
            <div class="modal-body" style="overflow-y: auto; padding: 0px" id="reporticoNoticeModalBody">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>
{% else %}
<div id="reporticoModal" tabindex="-1" class="reportico-modal">
    <div class="reportico-modal-dialog">
        <div class="reportico-modal-content">
            <div class="reportico-modal-header">
            <button type="button" class="reportico-modal-close">&times;</button>
            <h4 class="reportico-modal-title" id="reporticoModalLabel">{{ T_NOTICE }}</h4>
            </div>
            <div class="reportico-modal-body" style="padding: 0px" id="reportico-edit-link">
                <h3>Modal Body</h3>
            </div>
            <div class="reportico-modal-footer">
                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                <button type="button" class="reportico-edit-linkSubmit" >Close</button>
        </div>
    </div>
  </div>
</div>
<div id="reporticoNoticeModal" tabindex="-1" class="reportico-notice-modal">
    <div class="reportico-notice-modal-dialog">
        <div class="reportico-notice-modal-content">
            <div class="reportico-notice-modal-header">
            <button type="button" class="reportico-notice-modal-close">&times;</button>
            <h4 class="reportico-notice-modal-title" id="reporticoNoticeModalLabel">Set Parameter</h4>
            </div>
            <div class="reportico-notice-modal-body" id="reporticoNoticeModalBody">
                <h3>Modal Body</h3>
            </div>
            <div class="reportico-notice-modal-footer">
                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                <button type="button" class="reportico-notice-modal-button" >Close</button>
        </div>
    </div>
  </div>
</div>
{% endif %}