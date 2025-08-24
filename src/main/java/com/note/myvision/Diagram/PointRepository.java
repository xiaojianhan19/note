package com.note.myvision.Diagram;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PointRepository extends JpaRepository<Point, Integer> {
    public List<Point> findByDiagram(Integer diagram);
    public List<Point> findByDiagramOrderByOrderNoAsc(Integer diagram);
    public List<Point> findByDiagramAndLevelGreaterThanOrderByOrderNoAscDateAsc(Integer diagram, Integer level);
    public List<Point> findByChildDiagramId(Integer childDiagramId);
    
}
