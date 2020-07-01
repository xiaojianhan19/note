package com.note.demo.person;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepository extends JpaRepository<PersonParentBean, Integer> {
    public List<PersonParentBean> findByCategory(String category);
    public List<PersonParentBean> findByNameAndCategory(String name, String category);
    public List<PersonParentBean> findByNameContaining(String name);
    
}
