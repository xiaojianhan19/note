package com.note.demo.person;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonChildRepository extends JpaRepository<PersonChildBean, String> {

    public List<PersonChildBean> findByDateOrderByParent(String date);
}
