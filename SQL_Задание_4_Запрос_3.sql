SHIFT_CALC @DT_RANGE_BEGIN='2019-01-13', @DT_RANGE_END='2019-01-16';


--- ВАЖНОЕ ЗАМЕЧАНИЕ
   /* 
     Я учитываю смены, которые начались в предыдущие сутки и закончились
	 14, 15 или 16 января. Считаю, что если человек отработал 8 и более часов
	 в этот день, это нужно учесть.
	 Вариант без учета таких смен реализован в питоне
  */

SELECT DISTINCT NAME
  FROM [testdb].[dbo].[T_CONTRACTOR_WORK_DAY] a
  WHERE EXISTS(select *
               from [testdb].[dbo].[T_CONTRACTOR_WORK_DAY] sub
			   where a.NAME = sub.NAME
			   and (CAST(sub.DATE_BEGIN as DATE) = '2019-01-14')
			        or CAST(sub.DATE_END as DATE) = '2019-01-14'
					)
   AND EXISTS(select *
               from [testdb].[dbo].[T_CONTRACTOR_WORK_DAY] sub
			   where a.NAME = sub.NAME
			   and (CAST(sub.DATE_BEGIN as DATE) = '2019-01-15')
			        or CAST(sub.DATE_END as DATE) = '2019-01-15'
					)
   AND EXISTS(select *
               from [testdb].[dbo].[T_CONTRACTOR_WORK_DAY] sub
			   where a.NAME = sub.NAME
			   and (CAST(sub.DATE_BEGIN as DATE) = '2019-01-16')
			     or CAST(sub.DATE_END as DATE) = '2019-01-15'
				 )

