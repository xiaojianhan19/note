package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryParentRepository extends JpaRepository<CategoryParentBean, Integer> {
    List<CategoryParentBean> findByName(String name);

}
