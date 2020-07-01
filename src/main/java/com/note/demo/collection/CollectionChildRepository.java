package com.note.demo.collection;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionChildRepository extends JpaRepository<CollectionChildBean, Integer> {
    public List<CollectionChildBean> findByDateOrderByParent(String date);
    
}
