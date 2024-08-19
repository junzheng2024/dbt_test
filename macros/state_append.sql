{% macro state_append(state_code) %}

  concat({{state_code}}, '_TEST')
	
{% endmacro %}