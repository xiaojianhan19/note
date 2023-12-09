package com.note.myvision.Diagram;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.note.myvision.Counter;
import com.note.myvision.Utl;

import java.time.LocalDate;

@Service
@Transactional
public class PointService {

  @Autowired
  PointRepository repository;

  @Autowired
  DiagramService catService;

  @Autowired
  DiagramRepository catRepository;  

  public List<Point> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "diagram"));
  }

  public Optional<Point> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public void save(Point p)
  {
    if(Utl.check(p.getId()))
    {
      Optional<Point> res = repository.findById(p.getId());
      if(res.isPresent())
      {
        Point r = res.get();
        Utl.copyPropertiesIgnoreNull(p, r);
        repository.save(r);
      }
      else
      {
        //throw new Exception("Cannot found point of id" + p.getId() );
      }
    }
    else
    {
      if(!Utl.check(p.getName())) {
        return ;
      }

      if(!Utl.check(p.getDate()))
        p.setDate(LocalDate.now().toString());

      repository.save(p);
    }
  }


  public void delete(String id) {

    //check
    int pointId = Utl.parseInt(id);
    repository.deleteById(pointId);
  }

  public DiagramView findGroupByDiagramId(int catId, int level) {
    Optional<Diagram> opt = catRepository.findById(catId);
    if(opt.isPresent()) {
      catService.sortDiagram(opt.get());
      DiagramView cat = new DiagramView(opt.get());
      Counter counter = new Counter();
      AddPointToGroup(cat, level, counter);
      cat.setCount(counter.getCount());
      return cat;
    }
    return null;
  }

  public DiagramView findGroup(DiagramView c, String diagram, int level) {
    if(c.getName().equals(diagram)) {
      AddPointToGroup(c, level, new Counter());
      return c;
    }
    for(DiagramView cat : c.getChildren()) {
      DiagramView res = findGroup(cat, diagram, level);
      if(res == null) {
        continue;
      } else {
        return res;
      }
    }
    return null;
  }

  public void AddPointToGroup(DiagramView group, int level, Counter counter)
  {
    if(group == null)
        return;
    List<Point> list = repository.findByDiagramAndLevelGreaterThan(group.getId(), level);
    List<Object> objList = group.getItems();
    for(Point p : list)
    {
      objList.add(p);
    }
    group.setItems(objList);
    counter.setCount(counter.getCount() + list.size());
    if(group.getChildren() != null)
    {
        for(DiagramView child : group.getChildren())
        {
          AddPointToGroup(child, level, counter);
        }
    }
  }


  
}