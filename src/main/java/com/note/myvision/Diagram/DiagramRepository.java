package com.note.myvision.Diagram;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DiagramRepository extends JpaRepository<Diagram, Integer> {

    @Query(value = "select name from diagram c where c.id=?1 ", nativeQuery = true)
    public String findCatName(Integer id);

    @Query(value = "select COALESCE(type, '') from diagram c where c.id=?1 ", nativeQuery = true)
    public String findCatType(Integer id);
    
}
