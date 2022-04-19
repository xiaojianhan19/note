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

    @Query(value = "select * from Item c where c.item_category=?1 and c.Level>=?2 order by date ", nativeQuery = true)
    public List<Item> findByItemCategoryAndLevelGreaterThan(String category, int level);

    @Query(value = "select * from Item c where c.item_category_id=?1 and c.Level>=?2 order by date, order_no ", nativeQuery = true)
    public List<Item> findByItemCategoryIdAndLevelGreaterThan(int categoryId, int level);

    @Query(value = "select * from Item c where (c.name=?1 or c.name2=?2) and c.item_category=?3 ", nativeQuery = true)
    public List<Item> findByNameOrName2AndItemCategory(String name, String name2, String category);

    public List<Item> findByItemCategoryNotIn(List<String> catList);

    //for event
    public List<Item> findByStatusIn(List<String> statusList);
    public List<Item> findByStatus(String status);
    // public List<Item> findByNameAndCategoryOrderById(String name, String category);
    public List<Item> findByTopicCategoryId(Integer topicCategoryId);    
    public List<Item> findByTopicCategory(String topicCategory);
    
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


}
