package com.note.demo.event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventParentRepository extends JpaRepository<EventParentBean, Integer> {
    public List<EventParentBean> findByNameAndCategory(String name, String category);
    public List<EventParentBean> findByNameContaining(String name);
    public List<EventParentBean> findByStatus(String status);    
}
