package com.note.demo.category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryChildRepository extends JpaRepository<CategoryChildBean, Integer> {
    public List<CategoryChildBean> findByName(String name);
}
