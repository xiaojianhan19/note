package com.note.myvision;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {

    public List<Event> findByParentIdOrderByDateAsc(Integer parentId);
    public List<Event> findByDateAndParentId(String date, Integer parentId);
    public List<Event> findByDateBetween(String start, String end);

    @Query(value = "select new com.note.myvision.EventView(e.id, e.name, e.date, e.time, e.memo, e.parentId, i.name, i.eventCategoryId, i.topicCategoryId) "
        + " from Event e join Item i on e.parentId = i.id where e.date=?1 ")
    public List<EventView> findByDate(String date);

    @Query(value = "select new com.note.myvision.EventView(SUM(e.time), COUNT(*) as count, i.id, i.name, i.eventCategoryId, i.topicCategoryId) "
        + " from Event e join Item i on e.parentId = i.id where e.date>=?1 and e.date<=?2 group by i.id, i.name, i.eventCategoryId, i.topicCategoryId ")
    public List<EventView> findByPeriod(String start, String end);    

    // @Query(value = "select new com.note.myvision.EventView(e.id, e.name, e.date, i.name) " GROUP_CONCAT(e.name), 
    //     + "from (select * from Event where (name, date) in (select name, Max(date) from Event group by name)) as e join Item i on e.parentId = i.id "
    //     + "where e.name like CONCAT('%', ?1, '%') or i.name like CONCAT('%', ?1, '%') ")
    // public List<EventView> findEventViewByNameContaining(String name);
    
    @Query(value = "select '' as name, Max(e.date) as date, i.name as parentName, i.id as parentId, i.event_category_id from event as e right join item i on e.parent_id = i.id "
    + " where i.name like CONCAT('%', ?1, '%') group by i.name, i.id, i.event_category_id order by date desc, i.id desc ", nativeQuery = true)
    public List<Map<String, Object>> findEventViewByNameContaining(String name);

    @Query(value = "select '' as name, Max(e.date) as date, i.name as parentName, e.parent_id, i.event_category_id from event as e join item i on e.parent_id = i.id "
        + " where i.event_category_id = ?1 and e.date > ?2 group by i.name, e.parent_id, i.event_category_id order by date desc, e.parent_id desc ", nativeQuery = true)
    public List<Map<String, Object>> findEventViewByEventCategoryIdAndDate(Integer catId, String date);

    @Query(value = "select '' as name, Max(e.date) as date, i.name as parentName, e.parent_id, i.event_category_id from event as e join item i on e.parent_id = i.id "
        + " where i.topic_category_id = ?1 and e.date > ?2 group by i.name, e.parent_id, i.event_category_id order by date desc, e.parent_id desc ", nativeQuery = true)
    public List<Map<String, Object>> findEventViewByTopicCategoryIdAndDate(Integer catId, String date);
}
