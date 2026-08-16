WITH CTE AS (
    
    select
    START_TIME,
    DATE(START_TIME) as DATE_START_TIME,
    HOUR(START_TIME) as HOUR_START_TIME,
    DAYNAME(START_TIME) AS DAY_OF_WEEK_START_TIME,

    {{get_daytype('START_TIME')}}as DAY_TYPE,    
    {{get_season('START_TIME')}} as SEASON

    from 
    {{ source('DEMO', 'BIKE_2018') }}

)

select * 
from CTE