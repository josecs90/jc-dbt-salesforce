 {{ config(materialized='table', unique_key='campaign_id') }}
   SELECT
       contact_id,
       accountid as account_id,
       firstname,
       lastname,
       email,
       createddate,
       lastmodifieddate,
       ROW_NUMBER() OVER (PARTITION BY contact_id ORDER BY lastmodifieddate DESC) AS rn
   FROM {{ ref('stg_salesforce__contact') }}
   WHERE isdeleted =0  
   QUALIFY rn = 1
