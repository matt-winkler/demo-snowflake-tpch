SELECT *
FROM {{ ref('fct_orders') }}
WHERE company_id IN (SELECT company_id
                      FROM {{ ref('data_share_rules') }}
                      WHERE UPPER(account_id) = CURRENT_ACCOUNT())