package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryChildRepository extends JpaRepository<CategoryChildBean, Integer> {
    public List<CategoryChildBean> findByName(String name);
    public List<CategoryChildBean> findByNameAndRoot(String name, Integer root);

    @Query(value = "select name from category_item c where c.id=?1 ", nativeQuery = true)
    public String findCatName(Integer id);
}
