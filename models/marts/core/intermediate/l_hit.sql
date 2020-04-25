with l_hit_temp as (

    select * from {{ ref('stg_divolte_clickstream') }}

),

final as (

    select 
	hash (sessionID||'*divolte') as HK_session_id,
	hash (partyID||'*divolte') as HK_party_id,
	hash (remoteHost||'*divolte') as HK_remote_host_id,
	'divolte' as record_source,
	timestamp as load_date,
        timestamp as event_timestamp,
	screenPixelWidth,
	screenPixelHeight
	
    from l_hit_temp
    

)

select * from final
