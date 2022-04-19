package com.note.myvision;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;

@MappedSuperclass
public class BaseBean {
    
    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "comm_id_seq")
    @SequenceGenerator(
        name = "comm_id_seq",
        sequenceName = "comm_id_seq",
        initialValue = 10000001,
        allocationSize = 1)
    int id;
    
    String name;
    String date;
    String type;

    public BaseBean() {

    }

    public BaseBean(Integer id, String name, String date) {
        this.id = id;
        this.name = name;
        this.date = date;
    }

    public BaseBean(Integer id, String name, String date, String type) {
        this(id, name, date);
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }



}