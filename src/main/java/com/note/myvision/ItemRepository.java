package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<ItemBean, Integer> {
    public List<ItemBean> findByName(String name);
    public List<ItemBean> findByNameAndCategory(String name, String category);
    public List<ItemBean> findByNameContaining(String name);
    public List<ItemBean> findByNameOrName2(String name, String name2);
    public List<ItemBean> findByCategory(String category);
    public List<ItemBean> findByCategoryId(Integer categoryId);
    public List<ItemBean> findByParentId(Integer parentId);

    @Query(value = "select * from item_bean c where c.category=?1 and c.Level>=?2 order by date", nativeQuery = true)
    public List<ItemBean> findByCategoryAndLevelGreaterThan(String category, int level);

    @Query(value = "select * from item_bean c where c.category_id=?1 and c.Level>=?2 order by date", nativeQuery = true)
    public List<ItemBean> findByCategoryIdAndLevelGreaterThan(int categoryId, int level);

    @Query(value = "select * from item_bean c where (c.name=?1 or c.name2=?2) and c.category=?3", nativeQuery = true)
    public List<ItemBean> findByNameOrName2AndCategory(String name, String name2, String category);

    public List<ItemBean> findByCategoryNotIn(List<String> catList);

    

}
