{% autoescape false %}
{% if not REPORTICO_AJAX_CALLED %}
{% if not EMBEDDED_REPORT %}
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>{{ TITLE|raw }}</TITLE>
{{ OUTPUT_ENCODING|raw }}
</HEAD>
{% if REPORT_PAGE_STYLE %}
{% if REPORTICO_STANDALONE_WINDOW %}
<BODY class="reportico-body reportico-bodyStandalone" {{ REPORT_PAGE_STYLE }};">
{% else %}
<BODY class="reportico-body">
{% endif %}
{% else %}
{% if REPORTICO_STANDALONE_WINDOW %}
<BODY class="reportico-body reportico-bodyStandalone">
{% else %}
<BODY class="reportico-body">
{% endif %}
{% endif %}

    <LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/bootstrap3/css/bootstrap.min.css">

<LINK id="PRP_StyleSheet" REL="stylesheet" TYPE="text/css" HREF="{{ THEME_DIR }}/css/reportico.css">
{% else %}
    {% if not REPORTICO_BOOTSTRAP_PRELOADED %}
        <LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/bootstrap3/css/bootstrap.min.css">
    {% endif %}
    <LINK id="PRP_StyleSheet" REL="stylesheet" TYPE="text/css" HREF="{{ THEME_DIR }}/css/reportico.css">
{% endif %}
{% if AJAX_ENABLED %}
{% if not REPORTICO_AJAX_PRELOADED %}
{% if not REPORTICO_JQUERY_PRELOADED or REPORTICO_STANDALONE_WINDOW %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.js"></script>

{% endif %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/ui/jquery-ui.js"></script>


<script type="text/javascript" src="{{ ASSETS_PATH }}/js/download.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/reportico.js"></script>

{% endif %}
{% if REPORTICO_CSRF_TOKEN %}
<script type="text/javascript">var reportico_csrf_token = "{{ REPORTICO_CSRF_TOKEN }}";</script>
<script type="text/javascript">var ajax_event_handler = "{{ REPORTICO_AJAX_HANDLER }}";</script>
{% endif %}
{% if BOOTSTRAP_STYLES %}
{% if not REPORTICO_BOOTSTRAP_PRELOADED %}
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/bootstrap3/js/bootstrap.min.js"></script>
{% endif %}
{% endif %}
{% endif %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/ui/i18n/jquery.ui.datepicker-{{ AJAX_DATEPICKER_LANGUAGE }}.js"></script>

{% endif %}
{% if not BOOTSTRAP_STYLES %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.jdMenu.js"></script>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/jquery.jdMenu.css">

{% endif %}

<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/ui/jquery-ui.css">
<script type="text/javascript">var reportico_datepicker_language = "{{ AJAX_DATEPICKER_FORMAT }}";</script>
<script type="text/javascript">var reportico_this_script = "{{ SCRIPT_SELF }}";</script>
<script type="text/javascript">var reportico_ajax_script = "{{ REPORTICO_AJAX_RUNNER }}";</script>
<script type="text/javascript">var pdf_delivery_mode = "{{ PDF_DELIVERY_MODE }}";</script>


{% if REPORTICO_BOOTSTRAP_MODAL %}
<script type="text/javascript">var reportico_bootstrap_styles = "{{ BOOTSTRAP_STYLES }}";</script>
<script type="text/javascript">var reportico_bootstrap_modal = true;</script>
{% else %}
<script type="text/javascript">var reportico_bootstrap_modal = false;</script>
<script type="text/javascript">var reportico_bootstrap_styles = false;</script>
{% endif %}

<script type="text/javascript">var reportico_ajax_mode = "{{ REPORTICO_AJAX_MODE }}";</script>
<script type="text/javascript">var reportico_report_title = "{{ TITLE }}";</script>
<script type="text/javascript">var reportico_css_path = "{{ THEME_DIR }}/css/reportico.css";</script>

{% endif %}
{% if REPORTICO_CHARTING_ENGINE == "FLOT"  %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/flot/jquery.flot.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/flot/jquery.flot.axislabels.js"></script>

{% endif %}
{% if REPORTICO_CHARTING_ENGINE == "NVD3"  %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/nvd3/d3.min.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/nvd3/nv.d3.js"></script>
<LINK id="nvd3_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/nvd3/nv.d3.css">

{% endif %}
{% endif %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/select2/js/select2.min.js"></script>

<LINK id="PRP_StyleSheet_s2" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/select2/css/select2.min.css">
<LINK id="datatable_css" REL="stylesheet" TYPE="text/css" HREF="{{ STYLESHEETDIR }}/jquery.dataTables.css">
{% endif %}
{% if PRINTABLE_HTML %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/reportico.js"></script>


{% endif %}

{% if not REPORTICO_AJAX_CALLED %}
<div id="reportico-container">
{% endif %}

<div id="reportico-top-margin" style="z-index: 1; display: none;left: 80px;float: left; border: solid; height: {{ PAGE_TOP_MARGIN }}; width: {{ PAGE_LEFT_MARGIN }};">t</div>
<div id="reportico-bottom-margin" style="z-index: 1; display: none;left: 160;float: right; border: solid; height: {{ PAGE_BOTTOM_MARGIN }}; width: {{ PAGE_RIGHT_MARGIN }};">b</div>

<div style="{{ CONTENT.styles.body }}" class="reportico-output {{ PRINT_FORMAT }}">

    <script>
        reportico_criteria_items = [];
{% if CRITERIA_ITEMS is defined %}
{% for critno in CRITERIA_ITEMS %}
        reportico_criteria_items.push("{{CRITERIA_ITEMS[critno].name}}");
{% endfor %}
{% endif %}
    </script>
<div class="reportico-report-form">
{% if ERRORMSG|length>0 %}
            <div id="reporticoEmbeddedError">
                {{ ERRORMSG|raw }}
            </div>

            <script>
                reportico_jquery(document).ready(function()
                {
                    showParentNoticeModal(reportico_jquery("#reporticoEmbeddedError").html());
                });
            </script>

            <TABLE class="reportico-error-box">
                <TR>
                    <TD>{{ ERRORMSG|raw }}</TD>
                </TR>
            </TABLE>
{% endif %}
{% if STATUSMSG|length>0 %} 
			<TABLE class="reportico-status-block">
				<TR>
					<TD>{{ STATUSMSG|raw }}</TD>
				</TR>
			</TABLE>
{% endif %}
{% if SHOW_LOGIN %}
			<TD width="10%"></TD>
			<TD width="55%" align="left" class="reportico-prepare-top-menuCell">
{% if PROJ_PASSWORD_ERROR|length > 0 %}
                                <div style="color: #ff0000;">{{ PASSWORD_ERROR }}</div>
{% endif %}
				Enter the report project password. <br><input type="password" name="project_password" value=""></div>
				<input class="reportico-ajax-link" type="submit" name="login" value="Login">
			</TD>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS %}
<script type="text/javascript">var reportico_dynamic_grids = true;</script>
{% if REPORTICO_DYNAMIC_GRIDS_SORTABLE %}
<script type="text/javascript">var reportico_dynamic_grids_sortable = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_sortable = false;</script>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS_SEARCHABLE %}
<script type="text/javascript">var reportico_dynamic_grids_searchable = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_searchable = false;</script>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS_PAGING %}
<script type="text/javascript">var reportico_dynamic_grids_paging = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_paging = false;</script>
{% endif %}
<script type="text/javascript">var reportico_dynamic_grids_page_size = {{ REPORTICO_DYNAMIC_GRIDS_PAGE_SIZE }};</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids = false;</script>
{% endif %}

<div class="reportico-output-button-block">
{# Navigation Buttons #}
{% for button in CONTENT.buttons %}
{% if button.linkClass is defined %}
    <div class="{{ button.class }}"><a class="{{ button.linkClass }}" href="{{ button.href }}" title="{{ button.title }}">&nbsp;</a></div>
{% else %}
    <div class="{{ button.class }}"><a class="reportico-ajax-link" href="{{ button.href }}" title="{{ button.title }}">&nbsp;</a></div>
{% endif %}

{% endfor %}
    <a class="csvOutputP" style="position: absolute; background-image: url(themes/default/images/printcsv.png) !important;width: 42px !important;height: 42px !important;
    text-align: left; padding: 0px; margin-bottom: 5px !important;background-repeat: no-repeat;text-decoration: none;float: left;">&nbsp;</a>
</div>

{% if PAGE_LAYOUT == "FORM" %}
    {% include 'execute-content-form.inc.tpl' %}
{% else %}
    {% include 'execute-content.inc.tpl' %}
{% endif %}

{% if not REPORTICO_AJAX_CALLED %}
</div>
{% endif %}
</div>
{% if not REPORTICO_AJAX_CALLED %}
{% if not EMBEDDED_REPORT %}
</BODY>
</HTML>
{% endif %}
{% endif %}

{% if REPORTICO_BOOTSTRAP_MODAL %}
{% if BOOTSTRAP_STYLES == "3"  %}
<div class="modal fade" id="reporticoNoticeModal" tabindex="-1" role="dialog" aria-labelledby="reporticoNoticeModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
{% else %}
<div class="modal fade" style="width: 500px; margin-left: -450px" id="reporticoNoticeModal" tabindex="-1" role="dialog" aria-labelledby="reporticoModal" aria-hidden="true">
    <div class="modal-dialog">
{% endif %}
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close" aria-hidden="true">&times;</button>
            <h4 class="modal-title reportico-modal-title" id="reporticoNoticeModalLabel">{{ T_NOTICE }}</h4>
            </div>
            <div class="modal-body" style="padding: 0px" id="reporticoNoticeModalBody">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <!--button type="button" class="btn btn-primary" >Close</button-->
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
            <h4 class="reportico-modal-title" id="reporticoModalLabel">Set Parameter</h4>
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
{% endif %}

{# Scripts para los reportes por nombre #}

{% if TITLE == "Balance Comprobacion" %}
<script>
// Removemos tablas sin contenido del DOM
    reportico_jquery('.table').each(function() {
        if(reportico_jquery(this).height() == 0){
            reportico_jquery(this).remove();
        }
    });

    // Cortamos la fecha de los group headers nivel 1 y la pegamos en el Titulo
    var titulo = reportico_jquery('.ghpl').find('td').eq(1).text();
    var spl = titulo.split(" ").splice(-1);
    var nombrereporte = reportico_jquery(".fechabal").text();

    // Si es solo una fecha (balance general) se coloca solo "AL" en caso contrario "Del *** AL *** "
    if(String(spl).length == 10){
        reportico_jquery(".fechabal").html(nombrereporte+" Al "+spl);
    }else{
        var splite = String(spl).split("*");
        var [year1, month1, day1] = splite[0].split('-');
        var [year2, month2, day2] = splite[1].split('-');
        reportico_jquery(".fechabal").html(nombrereporte+" Del "+day1+"/"+month1+"/"+year1+" Al "+day2+"/"+month2+"/"+year2);
    }
    // Por cada group header cortamos el primer string (Codigo Cuenta) y lo ponemos en la columna correcta
    reportico_jquery('.ghpl').each(function(){
        // Valor del Group header antes
        var g = reportico_jquery(this).find('td').eq(1).text();
        if(g != ''){
            // Codigo Cuenta Cortado
            var asignar1 = g.split(' ', 1);
            // Group header Texto 
            var asignar2 = g.slice(String(asignar1).length+1);
            // Asignamos los valores a las columnas correctas
            reportico_jquery(this).find('td').eq(0).text(asignar1);
            reportico_jquery(this).find('td').eq(1).text(asignar2);
            
            // Asignamos el Identado de los group headers segun el nivel de cuenta
            if(String(asignar1).length == 1){
                // Eliminamos la fecha del string de group header
                var asasgsa = asignar2.trim().slice(0,(String(spl).length+1)*-1);
                reportico_jquery(this).find('td').eq(1).text(asasgsa);
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 1px !important;");
                reportico_jquery(".tddas").find('td:nth-child(1)').each(function(index){
                    if(String(reportico_jquery(this).text()).trim().length == 4) {
                        reportico_jquery(this).next().css("cssText","padding-left: 12px !important;");
                    }
                });
            }else if (String(asignar1).length == 4){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 12px !important;");
                reportico_jquery(".tddas").find('td:nth-child(1)').each(function(index){
                    if(String(reportico_jquery(this).text()).trim().length == 7) {
                        reportico_jquery(this).next().css("cssText","padding-left: 23px !important;");
                    }
                });
            }else if (String(asignar1).length == 10){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 34px !important;");
                reportico_jquery(this).parents().eq(1).next().each(function(){
                    reportico_jquery(this).find('td:nth-child(2)').css("cssText","padding-left: 45px !important;");
                });                
            }else if (String(asignar1).length == 7){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 23px !important;");
                reportico_jquery(this).parents('.table').siblings('table').each(function(){
                    if(reportico_jquery(this).find('td:nth-child(2)').css("padding-left") == '0px'){
                        reportico_jquery(this).find('td:nth-child(2)').css("cssText","padding-left: 34px !important;");
                    }
                });
            }
            // Asignamos el Identado de los trailer segun posicion
            reportico_jquery('.tddas tfoot').each(function(){
                reportico_jquery(this).find('td:nth-child(2)').each(function(index){
                    if(index == 0) reportico_jquery(this).css("cssText","padding-left: 34px !important;");
                    if(index == 1) reportico_jquery(this).css("cssText","padding-left: 23px !important;");
                    if(index == 2) reportico_jquery(this).css("cssText","padding-left: 12px !important;");
                    if(index == 3) reportico_jquery(this).css("cssText","padding-left: 1px !important;");
                    if(index == 4) reportico_jquery(this).css("cssText","padding-left: 1px !important;");
                });
            });
        }
    });
    
</script>
{% endif %}

{% if TITLE == "Balance General" or TITLE == "Estado de Ganancias y Perdidas" %}
<script>
    // Removemos tablas sin contenido del DOM
    reportico_jquery('.table').each(function() {
        if(reportico_jquery(this).height() == 0){
            reportico_jquery(this).remove();
        }
    });

    // Cortamos la fecha de los group headers nivel 1 y la pegamos en el Titulo
    var titulo = reportico_jquery('.ghpl').find('td').eq(1).text();
    var spl = titulo.split(" ").splice(-1);
    var nombrereporte = reportico_jquery(".fechabal").text();

    // Si es solo una fecha (balance general) se coloca solo "AL" en caso contrario "Del *** AL *** "
    if(String(spl).length == 10){
        reportico_jquery(".fechabal").html(nombrereporte+" Al "+spl);
    }else{
        var splite = String(spl).split("-");
        reportico_jquery(".fechabal").html(nombrereporte+" Del "+splite[0]+" Al "+splite[1]);
    }
    // Por cada group header cortamos el primer string (Codigo Cuenta) y lo ponemos en la columna correcta
    reportico_jquery('.ghpl').each(function(){
        // Valor del Group header antes
        var g = reportico_jquery(this).find('td').eq(1).text();
        if(g != ''){
            // Codigo Cuenta Cortado
            var asignar1 = g.split(' ', 1);
            // Group header Texto 
            var asignar2 = g.slice(String(asignar1).length+1);
            // Asignamos los valores a las columnas correctas
            reportico_jquery(this).find('td').eq(0).text(asignar1);
            reportico_jquery(this).find('td').eq(1).text(asignar2);
            
            // Asignamos el Identado de los group headers segun el nivel de cuenta
            if(String(asignar1).length == 1){
                // Eliminamos la fecha del string de group header
                var asasgsa = asignar2.trim().slice(0,(String(spl).length+1)*-1);
                reportico_jquery(this).find('td').eq(1).text(asasgsa);
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 1px !important;");
                reportico_jquery(".tddas").find('td:nth-child(1)').each(function(index){
                    if(String(reportico_jquery(this).text()).trim().length == 4) {
                        reportico_jquery(this).next().css("cssText","padding-left: 12px !important;");
                    }
                });
            }else if (String(asignar1).length == 4){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 12px !important;");
                reportico_jquery(".tddas").find('td:nth-child(1)').each(function(index){
                    if(String(reportico_jquery(this).text()).trim().length == 7) {
                        reportico_jquery(this).next().css("cssText","padding-left: 23px !important;");
                    }
                });
            }else if (String(asignar1).length == 10){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 34px !important;");
                reportico_jquery(this).parents().eq(1).next().each(function(){
                    reportico_jquery(this).find('td:nth-child(2)').css("cssText","padding-left: 45px !important;");
                });                
            }else if (String(asignar1).length == 7){
                reportico_jquery(this).find('td').eq(1).css("cssText","padding-left: 23px !important;");
                reportico_jquery(this).parents('.table').siblings('table').each(function(){
                    if(reportico_jquery(this).find('td:nth-child(2)').css("padding-left") == '0px'){
                        reportico_jquery(this).find('td:nth-child(2)').css("cssText","padding-left: 34px !important;");
                    }
                });
            }
            // Asignamos el Identado de los trailer segun posicion
            reportico_jquery('.tddas tfoot').each(function(){
                reportico_jquery(this).find('td:nth-child(2)').each(function(index){
                    if(index == 0) reportico_jquery(this).css("cssText","padding-left: 34px !important;");
                    if(index == 1) reportico_jquery(this).css("cssText","padding-left: 23px !important;");
                    if(index == 2) reportico_jquery(this).css("cssText","padding-left: 12px !important;");
                    if(index == 3) reportico_jquery(this).css("cssText","padding-left: 1px !important;");
                    if(index == 4) reportico_jquery(this).css("cssText","padding-left: 1px !important;");
                });
            });
        }
    });

</script>
{% endif %}

{% if TITLE == "Ultimas 100 Facturas Emitidas" %}
<script>
    // Obtenemos la url base Cortamos el puerto
    var cvxz = String(window.location.origin).split(":");
    // Por cada <a> le cambiamos el href 
    reportico_jquery("a").each(function() {
        var antes = reportico_jquery(this).attr("href");
        // valor anterior con + base corre
        reportico_jquery(this).attr("href", cvxz[0]+":"+cvxz[1]+antes)
    });
</script>
{% endif %}

{% if TITLE == "Carpeta Cliente" %}
<script>
    // expandimos las columnas de los group headers
    reportico_jquery('.ghpl').each(function(){
        reportico_jquery(this).find('td').eq(0).attr("colspan","2");
        reportico_jquery(this).find('td').eq(1).attr("colspan","10");
    });
</script>
{% endif %}

{% if TITLE == "Ventas de Exportacion" %}
<script>
    // expandimos la 2da columna de los group headers
    reportico_jquery('.ghpl').each(function(){
        reportico_jquery(this).find('td').eq(1).attr("colspan","6");
    });
</script>
{% endif %}

{% if TITLE == "Inventario de Productos Formato 11" %}
<script>
    // Asignamos Colores segun division de entrada salida inicial devoluciones para hacer mas visible el reporte
    reportico_jquery('.table tbody tr td:nth-child(4), .table tbody tr td:nth-child(3), .table tfoot tr td:nth-child(3), .table tfoot tr td:nth-child(4)')
    .each(function(){
        reportico_jquery(this).css("background-color", "rgba(51,204,255,0.1)");
    })
    reportico_jquery('.table tbody tr td:nth-child(5), .table tbody tr td:nth-child(6), .table tfoot tr td:nth-child(5), .table tfoot tr td:nth-child(6)')
    .each(function(){
        reportico_jquery(this).css("background-color", "rgba(102,255,204,0.1)");
    })
    reportico_jquery('.table tbody tr td:nth-child(7), .table tbody tr td:nth-child(8), .table tfoot tr td:nth-child(7), .table tfoot tr td:nth-child(8)')
    .each(function(){
        reportico_jquery(this).css("background-color", "rgba(204,0,0,0.1)");
    })
    reportico_jquery('.table tbody tr td:nth-child(9), .table tbody tr td:nth-child(10), .table tfoot tr td:nth-child(9), .table tfoot tr td:nth-child(10)')
    .each(function(){
        reportico_jquery(this).css("background-color", "rgba(255,255,0,0.1)");
    })
    reportico_jquery('.table tbody tr td:nth-child(11), .table tbody tr td:nth-child(12), .table tfoot tr td:nth-child(11), .table tfoot tr td:nth-child(12)')
    .each(function(){
        reportico_jquery(this).css("background-color", "rgba(102,0,255,0.1)");
    })
</script>
{% endif %}

{% if TITLE == "Mayor Analitico" %}
<script>
    var g = reportico_jquery('.ghpl').find('td').eq(1).text();
    // Cortamos el primer string para las Fechas
    var asdfasd = g.split(' ', 1);
    var nombrereporte = reportico_jquery(".fechabal").text();
    var splite = String(asdfasd).split('-');
    // Asignamos la fecha al titulo
    reportico_jquery(".fechabal").html(nombrereporte+" Del "+splite[0]+" Al "+splite[1]);

    reportico_jquery('.ghpl').each(function(){
        var h = reportico_jquery(this).find('td').eq(1).text();
        var vbm = h.slice(String(asdfasd).length+1);
        // Cortamos ultimo string (Saldo Anterior) y lo pegamos en la columna correcta
        var lastIndex = vbm.lastIndexOf(" ");
        var asignar2 = vbm.substring(0, lastIndex);
        var asignar1 = String(vbm.split(" ").splice(-1));
        reportico_jquery(this).find('td').eq(1).text(asignar2);
        // Creamos colunmnas para poder pegar el saldo anterior (por defecto reportico solo crea 2 columnas por group header)
        reportico_jquery(this).append("<td></td><td></td><td></td><td></td><td></td>");
        reportico_jquery(this).find('td').eq(6).css("text-align", "right");
        reportico_jquery(this).find('td').eq(6).text(asignar1);

    })
</script>
{% endif %}

{% endautoescape %}