# SQL Test dbt Project

Welcome to the sql test repository! This project is based on the [dbt](https://www.getdbt.com/) and uses an embedded [DuckDB](https://duckdb.org/) database with sample Salesforce data.

The goal of this test is to evaluate your understanding of SQL, dbt, and dimensional data modeling concepts.

## Instructions

- **Create a public git hub repository**
- **Commit this folder contents**
- **Set Up dbt**
- **Explore Staging Models**
- **Build Dimension & Fact Models**:  
   Based on the relevant staging models, create the following:dbt   
   - **Dimension Models**: Identify and create necessary dimension tables. These can be date dimensions, user dimensions, product dimensions, etc. depending on the staging data provided.
   - **Fact Models**: Build out the fact tables that centralize the measures and keys.
   
   Ensure your models are placed in the appropriate directories (e.g., `models/dimensions/` and `models/facts/`).

- **Test Your Models**:  
   Use dbt's testing functionality to ensure the integrity of your models. Ensure that relationships are correctly established, and there are no data anomalies.
   ```bash
   dbt run
   dbt test
   ```

- **Commit Your Changes**
- **Submit Your Test**:  
   Notify the hiring team by submitting the link to your repository.

## Evaluation

Your submission will be evaluated based on:

- Correctness of the models.
- Efficiency and simplicity of the SQL written.
- Adherence to dbt best practices.
- Robustness of tests and validations.

Best of luck, and we look forward to reviewing your models!


 ## JC DBT PROJECT:

  ### Overview
  This dbt project transforms Salesforce data into a dimensional data warehouse with four dimension tables (`dim_leads`, `dim_campaigns`, `dim_contacts`, `dim_accounts`) and one fact table (`fact_opportunities`). It uses dbt 1.6.18 with DuckDB 1.3.0.

  ### Models
  - **dim_leads**: Deduplicated leads with conversion details.
  - **dim_campaigns**: Marketing campaigns with name and dates.
  - **dim_contacts**: Contacts linked to accounts.
  - **dim_accounts**: Accounts with industry and revenue.
  - **fact_opportunities**: Opportunities with amount and history changes, linked to dimensions.

  ### Tests
  - Tests for `fact_opportunities` validate uniqueness, not-null, and relationships (with `severity: warn` for relationships).
  - Test is on the facts model as temporary workaround due issues with the dbt version 
  
  ### Tips
  - Used `check_data.py` to query the database
  - Results in `target/run_results.json` and `logs/dbt.log`.