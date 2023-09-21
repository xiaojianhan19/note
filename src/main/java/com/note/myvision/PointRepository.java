package com.note.myvision;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PointRepository extends JpaRepository<Point, Integer> {
    public List<Point> findByCategory(Integer category);
    public List<Point> findByCategoryOrderByOrderNoAsc(Integer category);
}
