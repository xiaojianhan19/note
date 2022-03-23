package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TopicRepository extends JpaRepository<TopicBean, Integer> {
    public List<TopicBean> findByName(String name);
    public List<TopicBean> findByStatus(String status);
}
