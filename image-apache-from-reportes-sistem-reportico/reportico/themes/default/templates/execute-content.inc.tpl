{% autoescape false %}


<script type="text/javascript">
    var reportico_page_size = "{{ PAGE_SIZE }}";
    var reportico_page_orientation = "{{ PAGE_ORIENTATION }}";
    var reportico_page_title_display = "{{ PAGE_TITLE_DISPLAY }}";
</script>

<style>
@media print {
    html {
        zoom: {{ ZOOM_FACTOR }};
    }
}
</style>


{# Begin new page =============================================== #}
<div class="reportico-paginated {{ AUTOPAGINATE }} original-page page-size-{{ PAGE_SIZE }} page-orientation-{{ PAGE_ORIENTATION }}" style="zoom1: {{ ZOOM_FACTOR }}; padding-top: 0px; padding-bottom: {{ PAGE_BOTTOM_MARGIN }}; padding-right: {{ PAGE_RIGHT_MARGIN }}; padding-left: {{ PAGE_LEFT_MARGIN }};">

{% set groupcount = 0 %}
{% set pageno = 1 %}

{# Top Page Headers ============================================= #}
{% if ( CONTENT.pageheaderstop ) %}
    {# Ya no usamos este archivo #}
    {# include 'execute-content-page-headers.inc.tpl' #}
{% endif %}

{# Document Title =============================================== #}

{# Document Criteria  =========================================== #}
{# Ya no usamos este archivo #}
{# include 'execute-content-criteria.inc.tpl' #}

{# End Criteria ================================================= #}

{% for page in CONTENT.pages %}
    {# Por cada pagina creamos el header #}
    <div class="reportico-page-header-block {{ PRINT_FORMAT }}" style="min-height: 1cm; margin-top: 30px; margin-bottom: 70px" >
    {# Incluimos el Header #}
    {% include 'execute-content-page-title.inc.tpl' %}

    {# Agregamos el thead para la pagina #}
        <TABLE class="{{ CONTENT.classes.page }} reportico-page" >
            {# Column Headers #}
                <THEAD>
                <TR>
                {% for columnHeader in page.headers %}
                    <TH style="{{columnHeader.styles}} border-width: 1px 1px !important;">
                    {{ columnHeader.content }}
                    </TH>
                {% endfor %}
                </TR>
                </THEAD>
                <TR class="reportico-row" style="visibility:collapse">
                {% for column in page.rows.data %}
                    <TD style="{{column.styles}}"></TD>
                {% endfor %}
                </TR>
        </TABLE>
    </div>
    
    {% for row in page.rows %}

        {# Page Headers On Group Start ================================== #}
        {% set triggered = 0 %}
        {% for group in row.groupstarts %}

            {# Group change triggers new page #}
            <!--{{ group.before_header  }} triggered {{ triggered }} {{ row.line }}<BR> !-->
            {% if row.line > 1 and group.before_header is defined and group.before_header == "newpage" and triggered == 0 %}

                {# Page Footer on group change ============================================= #}
                {% include 'execute-content-page-footers.inc.tpl' %}
                
                </div>
                <div class="reportico-paginated {{ AUTOPAGINATE }} original-page page-size-{{ PAGE_SIZE }} page-orientation-{{ PAGE_ORIENTATION }}" style="zoom1: {{ ZOOM_FACTOR }}; padding-top: 0px; padding-bottom: {{ PAGE_BOTTOM_MARGIN }}; padding-right: {{ PAGE_RIGHT_MARGIN }}; padding-left: {{ PAGE_LEFT_MARGIN }};">

                {% set triggered = 1 %}

            {% set headersexist = 0 %}
            {% set pageno = pageno + 1 %}

            {# Page Header on group change ============================================= #}
            {% include 'execute-content-page-headers.inc.tpl' %}

            {# Report title group change =============================================== #}
            {% include 'execute-content-page-title.inc.tpl' %}

            {% set groupcount = groupcount + 1 %}

        {% endif %}



        {# Group Headers + Detail ======================================= #}
        <!--div class="reportico-group-section"--> 

        {# Custom group headers ======================================== #}
        <div class="reportico-custom-header-block" >
        {% for group in row.groupstarts %}
            {% for header in group.customheaders %}
                <div class="reportico-custom-header" style="{{ header.styles }}">
                    {% if ( header.image ) %}
                        <img src='{{ header.image}}' style="{{ header.imagestyles }}">
                    {% endif %}
                    {{ header.content }}
                </div>
            {% endfor %}
        {% endfor %}
         </div>

        {# Group Headers ================================================ #}
        <table class="{{ CONTENT.classes.page }} reportico-page">
        {# Agregamos thead para dar forma a la columnas pero las ponemos no visibles #}
            <thead>
                <tr class="reportico-row" style="visibility:collapse">
                    {% for columnHeader in page.headers %}
                        <TH style="{{columnHeader.styles}}"></TH>
                    {% endfor %}
                </tr>
            </thead>
            <tbody>
                {% for header in group.headers %}
                {# quitamos clases #}
                <tr class="reportico-row ghpl negrita">
                    <td>{{ header.label }}</td>
                    <td>{{ header.value }}</td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
        {% endfor %}

        {# Start of group/report - new detail block  ======= #}
        {% if row.openrowsection %}
        <TABLE class="{{ CONTENT.classes.page }} reportico-page tddas" >
            {# Agregamos thead para dar forma a la columnas pero las ponemos no visibles #}
            <thead>
                <tr class="reportico-row" style="visibility:collapse">
                    {% for columnHeader in page.headers %}
                        <TH style="{{columnHeader.styles}}"></TH>
                    {% endfor %}
                </tr>
            </thead>
        {% endif %}

        {# Report Detail Row  ================================================ #}
        <TR class="reportico-row" style="{{ CONTENT.styles.row }}">
        {% for column in row.data %}
            <TD style="{{column.styles}}">
            {{ column.content }}
            </TD>
        {% endfor %}
        </TR>

        {# End of group/report - close detail section do trailers/graphs ===== #}
        {% if row.closerowsection %}
            {% if row.groupends %}
            </TBODY>
            <TFOOT>

            {% for group in row.groupends %}
                {% for trailer in group.trailers %}
                    {# Agregamos clases para identifiar al JS #}
                    <tr class="trailer tlm negrita">
                        {% for column in trailer %}
                            <td style="{{ column.styles }}">{{ column.content }}</td>
                        {% endfor %}
                    </tr>
                {% endfor %}
            {% endfor %}

            </TFOOT>
            {% endif %}
        </table>

        <!--/div--> 

        {# Custom group tailers ======================================== #}
        <div class="reportico-custom-trailer-block" >
        {% for group in row.groupends %}
            {% for trailer in group.customtrailers %}
                <div class="reportico-custom-trailer" style="{{ trailer.styles }}">
                    {% if ( trailer.image ) %}
                        <img src='{{ trailer.image}}' style="{{ trailer.imagestyles }}">
                    {% endif %}
                    {{ trailer.content }}
                </div>
            {% endfor %}
        {% endfor %}
         </div>

        {# After Group Charts ========================================== #}
        {% for graph in row.graphs %}
        <div class="reportico-chart {{ PRINT_FORMAT }}">
            {{ graph.url }}
        </div>
        {% endfor %}

        {% endif %}

    {% endfor %}  {# each row #}

{% endfor %}  {# each page #}

{# Page Footer on group change ============================================= #}
{% include 'execute-content-page-footers.inc.tpl' %}

</div>

{% endautoescape %}
