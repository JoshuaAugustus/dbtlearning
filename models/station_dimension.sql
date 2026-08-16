WITH BIKE AS (

    select 
    START_STATION_ID,
    START_STATION_NAME,
    START_STATION_LAT,
    START_STATION_LONG
    from {{ source('DEMO', 'BIKE_2018') }}
)

select * from BIKE
