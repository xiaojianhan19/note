package com.note.myvision;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    @Query(value = "select name from category c where c.id=?1 ", nativeQuery = true)
    public String findCatName(Integer id);

    @Query(value = "select COALESCE(type, '') from category c where c.id=?1 ", nativeQuery = true)
    public String findCatType(Integer id);
    
}
