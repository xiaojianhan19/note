package com.note.demo.collection;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;

import com.note.demo.Utl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
@Transactional
public class CollectionService {

  @Autowired
  CollectionParentRepository repository;

  @Autowired
  CollectionChildRepository itemRepository;

  public List<CollectionParentBean> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<CollectionParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public List<CollectionChildBean> findByDate(String date) {
    return itemRepository.findByDateOrderByParent(date);
  }

  public void save(CollectionParentBean b, CollectionChildBean c) {
    repository.save(b);
    c.setParent(b);
    itemRepository.save(c);
  }

  public void save(CollectionParentBean p)
  {
    repository.save(p);
  }

  public void save(CollectionChildBean c)
  {
    if(c.getDate().isEmpty())
      c.setDate(LocalDate.now().toString());
    itemRepository.save(c);
  }

  public void save(CollectionChildBean c, CollectionParentBean p)
  {
    c.setParent(p);
    itemRepository.save(c);
  }

  public void saveAll(List<CollectionParentBean> list) {
    for(CollectionParentBean p : list)
    {
        repository.save(p);
    }
  }

  public void delete(String id) {
    repository.deleteById(Utl.parseInt(id));
  }

  public void insert(String id, String date)
  {

  }

}