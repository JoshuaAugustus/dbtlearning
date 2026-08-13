WITH BIKE AS (

    select 
    START_STATION_ID,
    START_STATION_NAME,
    START_LAT,
    START_LONG
    from {{ source('DEMO', 'BIKE_2023') }}
)

select * from BIKE
