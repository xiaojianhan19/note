package com.note.demo.person;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;

import com.note.demo.Utl;
import com.note.demo.category.CategoryParentBean;
import com.note.demo.category.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
@Transactional
public class PersonService {

  @Autowired
  PersonRepository repository;

  @Autowired
  CategoryService catService;

  public List<PersonParentBean> findAll() {
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public PersonGroupBean findAllInGroup(String date) {
    CategoryParentBean p = catService.findByNameAndDate("Person", date);
    PersonGroupBean group = new PersonGroupBean(p.getItem());
    AddPersonToGroup(group);
    return group;
  }

  private void AddPersonToGroup(PersonGroupBean group)
  {
    if(group == null)
        return;
    List<PersonParentBean> list = repository.findByCategory(group.getName());
    group.setItems(list);
    if(group.getChildren() != null)
    {
        for(PersonGroupBean child : group.getChildren())
        {
            AddPersonToGroup(child);
        }
    }
  }

  public Optional<PersonParentBean> find(String id) {
    return repository.findById(Utl.parseInt(id));
  }

  public void save(PersonParentBean p) {
    if(p.getInputDate().isEmpty())
      p.setInputDate(LocalDate.now().toString());      
    repository.save(p);
  }

  public void saveAll(List<PersonParentBean> list) {
    for(PersonParentBean p : list)
    {
        repository.save(p);
    }
  }

  public void delete(String id) {
    repository.deleteById(Utl.parseInt(id));
  }
}