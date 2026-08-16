WITH CTE AS (

    SELECT
    tf.*,
    dw.*
    from {{ ref('trip_fact') }} tf
    left join {{ ref('daily_weather') }} dw on tf.trip_date = dw.daily_weather
)

select * from CTE