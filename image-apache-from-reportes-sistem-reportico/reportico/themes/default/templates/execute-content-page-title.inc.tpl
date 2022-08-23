{% autoescape false %}
{% if ( PAGE_TITLE_DISPLAY == "off" ) %}
    {# Dont show any title #}
{% else %}
    {# Creamos cabecera de pagina #}
    <div class="reportico-title">
        <div align="right" style="display: flex;" >
            <div align="left" style="flex: 4">
            {{ PROJECT_TITLE }}<BR><b>Sistema de Contabilidad</b>
            </div>
            <div align="right" style="flex: 1">
                Fecha: {{ "now"|date('d/m/Y', timezone="America/Caracas") }} <BR>Hora:{{ "now"|date('H:i', timezone="America/Caracas") }}
                <BR> Página: <span class="reportico-page-number"></span> de: <span class="reportico-page-count"></span>
            </div>
        </div>
        <div>
            {# Nombre del Reporte #}
            {% for header in CONTENT.pageheaderstop %}
                <div class="fechabal" style="text-align:center;">
                {% if ( header.image ) %}
                    <img src='{{ header.image}}' style="{{ header.imagestyles }}">
                {% endif %}
                    {{ header.content }}
                </div>
            {% endfor %}
        </div>
    </div>  
{% endif %}
{% endautoescape %}
