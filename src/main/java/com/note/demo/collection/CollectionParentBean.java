package com.note.demo.collection;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "collection")
public class CollectionParentBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "collection_id_seq")
    @SequenceGenerator(
        name = "collection_id_seq",
        sequenceName = "collection_id_seq",
        initialValue = 30000001,
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
    private int Level;
    private String inputDate;
    private String releaseDate;

    @ElementCollection(fetch=FetchType.EAGER)
    @Column(name="tag")
    private List<String> tags; 

    @OneToMany(mappedBy = "parent", cascade= {CascadeType.DETACH})
    private List<CollectionChildBean> items; 

    public CollectionParentBean(){}

    public CollectionParentBean(CollectionParentBean org) {
        this.id = org.id;
        this.name = org.name;
        this.name2 = org.name2;
        this.name3 = org.name3;
        this.category = org.category;
        this.status = org.status;
        this.memo = org.memo;
        this.Level = org.Level;
        this.inputDate = org.inputDate;
        this.releaseDate = org.releaseDate;
        for(String tag : org.tags) 
        {
            this.tags.add(tag);
        }
        for(CollectionChildBean item : org.items) 
        {
            CollectionChildBean newItem = new CollectionChildBean(item);
            this.items.add(newItem);
        }
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

    public List<CollectionChildBean> getItems() {
        return items;
    }

    public void setItems(List<CollectionChildBean> items) {
        this.items = items;
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

    public int getLevel() {
        return Level;
    }

    public void setLevel(int level) {
        Level = level;
    }

    public String getInputDate() {
        return inputDate;
    }

    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

}
