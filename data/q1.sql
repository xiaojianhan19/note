select * from 
 (SELECT i.item_category_id FROM public.item i group by item_category_id ) ids
 left join category cat on ids.item_category_id = cat.id where cat.id is NULL;