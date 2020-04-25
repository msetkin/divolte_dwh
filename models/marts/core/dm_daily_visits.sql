with party as (

    select * from {{ ref('h_party') }}

),

remote_host as (

    select * from  {{ ref('h_remote_host') }}

),

session as (

    select * from  {{ ref('h_session') }}

),

hit as (

    select * from  {{ ref('l_hit') }}

),
final as (

    select p.partyid,
     		rh.remotehost,
     		s.sessionid,
     		date_trunc ('DAY', lh.event_timestamp) as open_date,
     		count(1) as daily_opens,
     		avg(screenPixelHeight) as mean_screen_Pixel_Height,
     		avg(screenPixelWidth) as mean_screen_Pixel_Width
    from hit lh
     join party p using (HK_party_id)
     join remote_host rh using (HK_remote_host_id)
     join session s using (HK_session_id)
     group by p.partyid,
     		rh.remotehost,
     		s.sessionid,
     		date_trunc ('DAY', lh.event_timestamp)

)
select * from final
