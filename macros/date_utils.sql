{% macro get_season(timestamp_date) %}

        CASE WHEN
        MONTH({{timestamp_date}}) in ('12','1','2')
        THEN 'WINTER'
        WHEN MONTH({{timestamp_date}}) in ('3','4','5')
        THEN 'SPRING'
        WHEN MONTH({{timestamp_date}}) in ('6','7','8')
        THEN 'SUMMER'
        WHEN MONTH({{timestamp_date}}) in ('9','10','11')
        THEN 'AUTUMN'
        ELSE null
        END

{% endmacro %}

{% macro get_daytype(timestamp_date) %}

    CASE WHEN 
        DAYNAME({{timestamp_date}}) in ('Sat', 'Sun')
        THEN 
            'WEEKEND'
        ELSE 
            'BUSINESSDAY'
    END 

{% endmacro %}