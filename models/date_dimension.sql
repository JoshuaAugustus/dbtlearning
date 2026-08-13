WITH CTE AS (
    
    select
    STARTED_AT,
    DATE(STARTED_AT) as DATE_STARTED_AT,
    HOUR(STARTED_AT) as HOUR_STARTED_AT,
    DAYNAME(STARTED_AT) AS DAY_OF_WEEK_STARTED_AT,

    {{get_daytype('STARTED_AT')}}as DAY_TYPE,    
    {{get_season('STARTED_AT')}} as SEASON

    from 
    {{ source('DEMO', 'BIKE_2023') }}

)

select * 
from CTE