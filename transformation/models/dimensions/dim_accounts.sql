   {{ config(materialized='table' , unique_key='account_id') }}
   SELECT
       account_id,
       name AS account_name,
       accountnumber,
       industry,
       annualrevenue,
       createddate,
       lastmodifieddate,
       ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY lastmodifieddate DESC) AS rn
   FROM {{ ref('stg_salesforce__account') }}
   WHERE isdeleted=0
   QUALIFY rn = 1
