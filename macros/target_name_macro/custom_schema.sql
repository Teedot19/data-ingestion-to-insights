{% macro generate_schema_name(custom_schema_name, node) %}
    {% if 'staging' in node.path %}
        staging_layer
    {% elif 'intermediate' in node.path %}
        intermediate_layer
    {% elif 'marts' in node.path %}
        marts
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}
