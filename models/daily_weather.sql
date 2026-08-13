WITH daily_weather as (

    select 
    date(TIME) as daily_weather,
    WEATHER,
    TEMPERATURE,
    PRESSURE,
    HUMIDITY,
    CLOUDS
    from {{ source('DEMO', 'WEATHER') }}
),

daily_weather_agg as (

    select
    daily_weather,
    WEATHER,
    round(avg(TEMPERATURE), 2) as avg_temp,
    round(avg(PRESSURE), 2) as avg_pressure,
    round(avg(HUMIDITY), 2) as avg_humidity,
    round(avg(CLOUDS), 2) as avg_clouds
    from
    daily_weather
    group by daily_weather, WEATHER
    qualify     row_number() over (partition by daily_weather order by count(WEATHER) desc) = 1
)

select *
from daily_weather_agg