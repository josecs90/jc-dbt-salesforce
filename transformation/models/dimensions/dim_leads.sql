 {{ config(materialized='table') }}
   SELECT
      lead_id,
      convertedaccountid as converted_account_id,
      convertedcontactid as converted_contact_id,
      convertedopportunityid as converted_opportunity_id,
      isconverted,
      firstname,
      lastname,
      title,
      company,
      street,
      city,
      state,
      postalcode,
      country,
      latitude,
      longitude,
      createddate,
      lastmodifieddate,
      ROW_NUMBER() OVER (PARTITION BY lead_id ORDER BY lastmodifieddate DESC) AS rn
   FROM {{ ref('stg_salesforce__lead') }}
   WHERE isdeleted=0
   QUALIFY rn = 1