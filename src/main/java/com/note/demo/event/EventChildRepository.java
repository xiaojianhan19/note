package com.note.demo.event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventChildRepository extends JpaRepository<EventChildBean, String> {

    public List<EventChildBean> findByDateOrderByParent(String date);
    // public void deleteByPerson(Integer id);
    // public void delteByCollection(Integer id);
}
