# UPSERT
UPSERT is a combination of the words "UPDATE" and "INSERT". It refers to an operation in SQL that either updates an existing record in a table or inserts a new record into the table, depending on whether the record already exists.

In other words, UPSERT performs a check to see if a record with the specified unique key already exists in the table. If does, the existing record is updated with the new values, if it doesn't, a new record is inserted into the table with the specified values.

## Bigquery - GCP Example
        MERGE `project_id.dataset_id.table` as t
        USING (
            SELECT
                     id
                    , column1
            FROM 
                    `project_id.data_set_id.another_table`
        ) as s
        ON
        (
            t.id = s.id
        )
        WHEN MATCHED THEN
              UPDATE
              -- you can put other columns here before the comma to update more coluns in one row
              SET t.column1 = s.column1, t.update_date = CURRENTE_TIMESTAMP()
        WHEN NOT MATCHED THEN
              INSERT (id, column1)
              VALUES (s.id, s.column1)
              
  ## SQL Example
  
          -- Perform an UPSERT on multiple records
          INSERT INTO users (id, name, email)
          VALUES 
             (1, 'John Doe', 'john.doe@example.com')
             (2, 'Jane Doe', 'jane.doe@example.com')
          ON CONFLICT (id)
          DO UPDATE SET email = EXCLUDED.email;
          
## MySQL Example

        -- Perform an UPSERT on multiple records
        INSERT INTO users (id, name, email)
        VALUES 
           (1, 'John Doe', 'john.doe@example.com'),
           (2, 'Jane Doe', 'jane.doe@example.com')
        ON DUPLICATE KEY UPDATE email = VALUES(email);
