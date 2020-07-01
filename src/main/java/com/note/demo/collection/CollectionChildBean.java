package com.note.demo.collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "collection_item")
public class CollectionChildBean {

	@Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "collection_item_id_seq")
    @SequenceGenerator(
        name = "collection_item_id_seq",
        sequenceName = "collection_item_id_seq",
        initialValue = 31000001,
        allocationSize = 1)
	private int id;

    @ManyToOne
	private CollectionParentBean parent;
    private String type;
    private int index;    
    private String name;
    private String name2;
    private String name3;
    private String memo;
    private String date;

    public CollectionChildBean(){}

    public CollectionChildBean(CollectionParentBean p) {
        this.setParent(p);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CollectionParentBean getParent() {
        return parent;
    }

    public void setParent(CollectionParentBean parent) {
        this.parent = parent;
    }
 

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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


}
