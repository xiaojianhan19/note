package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {
    public List<Item> findByName(String name);
    public List<Item> findByNameAndItemCategory(String name, String category);
    public List<Item> findByNameContaining(String name);
    public List<Item> findByNameOrName2(String name, String name2);
    public List<Item> findByItemCategory(String category);
    public List<Item> findByItemCategoryId(Integer categoryId);
    public List<Item> findByParentId(Integer parentId);

    @Query(value = "select name from item c where c.id=?1 ", nativeQuery = true)
    public String findItemName(Integer id);

    @Query(value = "select * from Item c where c.item_category=?1 and c.Level>=?2 order by order_no, date ", nativeQuery = true)
    public List<Item> findByItemCategoryAndLevelGreaterThan(String category, int level);

    @Query(value = "select * from Item c where c.item_category_id=?1 and c.Level>=?2 order by order_no, date ", nativeQuery = true)
    public List<Item> findByItemCategoryIdAndLevelGreaterThan(int categoryId, int level);

    @Query(value = "select * from Item c where (c.name=?1 or c.name2=?2) and c.item_category=?3 ", nativeQuery = true)
    public List<Item> findByNameOrName2AndItemCategory(String name, String name2, String category);

    public List<Item> findByItemCategoryNotIn(List<String> catList);
    
    @Query(value = "select * from Item c where c.item_category_id=0 and c.parent_id=0 ", nativeQuery = true)
    public List<Item> findUnsortedItems();

    //for event
    public List<Item> findByStatusIn(List<String> statusList);
    public List<Item> findByStatus(String status);
    // public List<Item> findByNameAndCategoryOrderById(String name, String category);
    public List<Item> findByTopicCategoryId(Integer topicCategoryId);    
    public List<Item> findByTopicCategory(String topicCategory);
    
    @Query(value = "select new com.note.myvision.ItemView(i.id, i.name, count(e), coalesce(sum(e.time), 0.0)) from Item i left join Event e on i.id = e.parentId where i.name like CONCAT('%', ?1, '%') group by i.id, i.name ")
    public List<ItemView> findEventSum(String name);

    // public List<ItemView> findItemViewWithCounting();

    // @Query(value = "select DISTINCT e from Event e join e.items as p where p.date=?1")
    // public List<Item> findEventByNameAndDate(String date);

    // @Query(value = "select new Event(e.id, e.name, e.category, e.status, t.id, t.date, t.time, t.memo) from Event e left join e.items as t where t.date=?1")
    // public List<Item> findEventToday(String date);

    // @Query(value = "select new com.note.myvision.EventView(e.name, e.category, e.status, t.date, t.memo) from Event e left join e.items as t where t.date=?1")
    // public List<ItemView> findEventViewToday(String date);

    //sample sql
    // update item as i 
    // set item_category = cat.name 
    // from category cat where i.item_category_id = cat.id;

    // 

    // @Query(value = "select new com.note.myvision.ItemView(res.name, res.ecount, res.time, e.rcount) from " 
    // + "(WITH w as (SELECT i.name, count(e) as ecount, sum(e.time) as time, count(r) as rcount FROM public.item i "
    // + "left join public.event e on i.id = e.parentId "
    // + "left join public.resource r on i.id = r.parentId "
    // + "where i.name like '%ICA%' group by i.name) "
    // + "SELECT * FROM w UNION ALL SELECT 'Total', count(ecount), SUM(time), count(rcount) FROM w) res")



}