with h_party_temp as (

    select * from {{ ref('stg_divolte_clickstream') }}

),

final as (

    select 
	hash (partyID||'*divolte') as HK_party_id,
	min (timestamp) as load_date,
	'divolte' as record_source,
        partyID
    from h_party_temp
    group by partyID

)

select * from final
