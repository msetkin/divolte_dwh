with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_divolte') }}

),

renamed as (

    select
        detectedDuplicate,
	detectedCorruption,
	firstInSession,
	TO_TIMESTAMP_TZ (timestamp/1000) as timestamp,
	remoteHost,
	location,
	screenPixelWidth,
	screenPixelHeight,
	partyId,
	sessionId,
	pageViewId,
	eventType,
	userAgentString,
	userAgentName,
	userAgentFamily,
	userAgentVendor,
	userAgentType,
	userAgentVersion,
	userAgentDeviceCategory,
	userAgentOsFamily

    from source

)

select * from renamed
