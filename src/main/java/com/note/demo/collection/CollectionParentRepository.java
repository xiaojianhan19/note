package com.note.demo.collection;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionParentRepository extends JpaRepository<CollectionParentBean, Integer> {
    public List<CollectionParentBean> findByNameAndCategory(String name, String category);
    public List<CollectionParentBean> findByNameContaining(String name);
    
}
