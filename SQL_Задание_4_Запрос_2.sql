EXEC SHIFT_CALC @DT_RANGE_BEGIN='2019-01-01', @DT_RANGE_END='2019-01-31';

SELECT NAME
FROM [testdb].[dbo].[T_CONTRACTOR_WORK_DAY]
GROUP BY NAME
HAVING COUNT(DATE_BEGIN) > 10
