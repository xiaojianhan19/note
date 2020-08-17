package com.note.demo.event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventChildRepository extends JpaRepository<EventChildBean, Integer> {

    public List<EventChildBean> findByParent(EventParentBean parent);
    public List<EventChildBean> findByDateOrderByParent(String date);
    public List<EventChildBean> findByDateAndParent(String date, EventParentBean parent);
    public List<EventChildBean> findByDateBetweenOrderByParent(String start, String end);
    // public void deleteByPerson(Integer id);
    // public void delteByCollection(Integer id);
}
