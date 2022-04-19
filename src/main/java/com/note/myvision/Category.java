
package com.note.myvision;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category extends BaseBean{

    @ManyToOne(fetch=FetchType.LAZY)
    private Category parent;

    @OneToMany(mappedBy = "parent", cascade= CascadeType.DETACH)
    private List<Category> children;
    
    private int orderNo;
    //for event related to item
    private int relatedId;
    //for topic
    private String startDate;
    private String endDate;

    public Category(){}

    public Category(String name)
    {
        this.name = name;
    }

    public Category(Category category)
    {
        this.id = category.id;
        this.name = category.name;
        this.date = category.date;
        this.orderNo = category.orderNo;
        this.relatedId = category.relatedId;
        this.startDate = category.startDate;
        this.endDate = category.endDate;
        this.parent = category.parent;
        if(this.children == null) this.children = new ArrayList<Category>();
        for(Category child : category.getChildren())
        {
            this.children.add(new Category(child));
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

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getRelatedId() {
        return relatedId;
    }

    public void setRelatedId(int relatedId) {
        this.relatedId = relatedId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }


}
