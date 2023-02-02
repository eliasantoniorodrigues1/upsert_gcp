UPDATE 'some_table' as t
SET t.column1 = s.colum1
FROM (
      SELECT
            id
          , column1
      FROM
            another_table
      WHERE
            criteria = 'your_criteria'
)  as s
WHERE
      t.id = s.id