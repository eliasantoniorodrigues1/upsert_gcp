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