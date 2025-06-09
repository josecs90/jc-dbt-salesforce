{{ config(materialized='table') }}
SELECT
    o.opportunity_id,
    o.accountid as account_id,
    o.campaignid as campaign_id,
    l.lead_id AS converted_lead_id,
    o.name as opportunity_name,
    o.amount,
    o.closedate,
    o.stagename,
    o.createddate,
    o.lastmodifieddate,
    COUNT(oh.opportunity_history_id) AS history_changes,
    MAX(oh.createddate) AS last_history_change
FROM {{ ref('stg_salesforce__opportunity') }} o
LEFT JOIN {{ ref('stg_salesforce__lead') }} l
    ON o.opportunity_id = l.convertedopportunityid
LEFT JOIN {{ ref('stg_salesforce__opportunity_history') }} oh
    ON o.opportunity_id = oh.opportunityid
LEFT JOIN {{ ref('dim_campaigns') }} c
    ON o.campaignid = c.campaign_id
WHERE o.isdeleted=0 
GROUP BY 
    o.opportunity_id,
    o.accountid,
    o.campaignid,
    l.lead_id,
    o.name,
    o.amount,
    o.closedate,
    o.stagename,
    o.createddate,
    o.lastmodifieddate