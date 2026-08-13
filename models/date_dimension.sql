WITH CTE AS (
    
    select
    STARTED_AT,
    DATE(STARTED_AT) as DATE_STARTED_AT,
    HOUR(STARTED_AT) as HOUR_STARTED_AT,
    DAYNAME(STARTED_AT) AS DAY_OF_WEEK_STARTED_AT,

    CASE WHEN 
        DAYNAME(STARTED_AT) in ('Sat', 'Sun')
        THEN 
            'WEEKEND'
        ELSE 
            'BUSINESSDAY'
    END AS DAY_TYPE,
    
    CASE WHEN 
        MONTH(STARTED_AT) in ('12','1','2')
        THEN 'WINTER'
        WHEN MONTH(STARTED_AT) in ('3','4','5')
        THEN 'SPRING'
        WHEN MONTH(STARTED_AT) in ('6','7','8')
        THEN 'SUMMER'
        WHEN MONTH(STARTED_AT) in ('9','10','11')
        THEN 'AUTUMN'
    END AS SEASON
    from 
    {{ source('DEMO', 'BIKE_2023') }}

)

select * 
from CTE