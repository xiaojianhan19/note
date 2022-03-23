package com.note.myvision;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "category")
public class CategoryParentBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "category_id_seq")
    @SequenceGenerator(
        name = "category_id_seq",
        sequenceName = "category_id_seq",
        initialValue = 40000001,
        allocationSize = 1)
	private int id;

    private String name;

    @OneToOne(cascade= CascadeType.DETACH, fetch=FetchType.LAZY)
    private CategoryChildBean item;
    
    private String inputDate;
    
    public CategoryParentBean(){
        this.inputDate = LocalDate.now().toString();
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

    public CategoryChildBean getItem() {
        return item;
    }

    public void setItem(CategoryChildBean item) {
        this.item = item;
    }

    public String getInputDate() {
        return inputDate;
    }

    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

}
