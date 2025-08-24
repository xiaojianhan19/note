SELECT t1.id, t1.name, 
t1.parent_id as parentId1,
t2.parent_id as parentId2,
t3.parent_id as parentId3,
t4.parent_id as parentId4,
t5.parent_id as parentId5,
t6.parent_id as parentId6
FROM public.category t1 
left join public.category t2 on t1.parent_id = t2.id
left join public.category t3 on t2.parent_id = t3.id
left join public.category t4 on t3.parent_id = t4.id
left join public.category t5 on t4.parent_id = t5.id
left join public.category t6 on t5.parent_id = t6.id
order by parentId6, parentId5, parentId4, parentId3, parentId2, parentId1
;