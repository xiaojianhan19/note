package com.note.demo.collection;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionParentRepository extends JpaRepository<CollectionParentBean, Integer> {
    public List<CollectionParentBean> findByNameAndCategory(String name, String category);
    public List<CollectionParentBean> findByNameContaining(String name);
    public List<CollectionParentBean> findByName(String name);
    public List<CollectionParentBean> findByNameOrName2(String name, String name2);
    public List<CollectionParentBean> findByCategory(String category);

    @Query(value = "select * from collection c where (c.name=?1 or c.name2=?2) and c.category=?3", nativeQuery = true)
    public List<CollectionParentBean> findByNameOrName2AndCategory(String name, String name2, String category);

    public List<CollectionParentBean> findByCategoryNotIn(List<String> catList);
}
