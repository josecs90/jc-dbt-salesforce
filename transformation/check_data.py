import duckdb

     # Connect to the database
conn = duckdb.connect('dbt.duckdb')

     # List tables
#query = "select name from dbt.raw.account limit 10""
#query = "SELECT * FROM dbt.staging.stg_salesforce__product_2 LIMIT 5"
#query = "SELECT contact_id,count(1) FROM dbt.staging.stg_salesforce__contact group by contact_id having count(1)>1"
#query = "SELECT isdeleted,count(1) FROM dbt.staging.stg_salesforce__account group by isdeleted"
#query = "SELECT count(1) FROM dbt.staging.stg_salesforce__account"
query = "SELECT * FROM dbt.fact.fact_opportunities"
results = conn.sql(query).fetchall()
columns = [desc[0] for desc in conn.sql(query).description]
print("Columns :", columns)
for row in results:
    print(row)

# query = """
# SELECT column_name, data_type
# FROM information_schema.columns
# WHERE table_schema = 'staging' AND table_name = 'stg_salesforce__account'
# AND column_name IN ('account_id', 'isdeleted', 'masterrecordid', 'lastmodifieddate')
# """
# results = conn.sql(query).fetchall()
# print("\nQuery results:")
# for row in results:
#     print(row)

# conn.close()