with h_session_temp as (

    select * from {{ ref('stg_divolte_clickstream') }}

),

final as (

    select 
	hash (sessionID||'*divolte') as HK_session_id,
	min (timestamp) as load_date,
	'divolte' as record_source,
        sessionid
    from h_session_temp
    group by sessionid

)

select * from final
