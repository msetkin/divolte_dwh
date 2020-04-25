with h_remoteHost_temp as (

    select * from {{ ref('stg_divolte_clickstream') }}

),

final as (

    select 
	hash (remoteHost||'*divolte') as HK_remote_host_id,
	min (timestamp) as load_date,
	'divolte' as record_source,
        remoteHost
    from h_remoteHost_temp
    group by remoteHost

)

select * from final
