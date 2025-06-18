 {{ config(materialized='table', unique_key='campaign_id') }}
   SELECT
      campaign_id,
      name as campaign_name,
      type,
      startdate,
      enddate,
      createddate,
      lastmodifieddate,
      ROW_NUMBER() OVER (PARTITION BY campaign_id ORDER BY lastmodifieddate DESC) AS rn
   FROM {{ ref('stg_salesforce__campaign') }}
   WHERE isdeleted=0
   QUALIFY rn = 1