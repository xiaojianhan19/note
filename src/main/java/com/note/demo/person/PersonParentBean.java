package com.note.demo.person;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.note.demo.event.EventParentBean;

import org.springframework.data.annotation.Transient;


@Entity
@Table(name = "person")
public class PersonParentBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "person_id_seq")
    @SequenceGenerator(
        name = "person_id_seq",
        sequenceName = "person_id_seq",
        initialValue = 20000001,
        allocationSize = 1)
	private int id;

    // base
    private String name;
    private String category;
    private String status;
    
    @Column(columnDefinition = "text")
    private String memo;

    // private
    private String name2;
    private String name3;
    private String address;
    private String inputDate;

    // @Transient
    // private List<EventParentBean> items; 

    public PersonParentBean(){}

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getName3() {
        return name3;
    }

    public void setName3(String name3) {
        this.name3 = name3;
    }
    public String getInputDate() {
        return inputDate;
    }

    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // public List<EventParentBean> getItems() {
    //     return items;
    // }

    // public void setItems(List<EventParentBean> items) {
    //     this.items = items;
    // }

}
