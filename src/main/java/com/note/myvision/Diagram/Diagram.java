
package com.note.myvision.Diagram;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.note.myvision.BaseBean;

@Entity
@Table(name = "diagram")
public class Diagram extends BaseBean {

    @ManyToOne(fetch=FetchType.LAZY)
    private Diagram parent;

    @OneToMany(mappedBy = "parent", cascade= CascadeType.DETACH)
    private List<Diagram> children;
    
    private int orderNo;
    //for event related to item
    private int relatedId;
    //for topic
    private String startDate;
    private String endDate;

    public Diagram(){}

    public Diagram(String name)
    {
        this.name = name;
    }

    public Diagram(Diagram category)
    {
        this.id = category.id;
        this.name = category.name;
        this.date = category.date;
        this.orderNo = category.orderNo;
        this.relatedId = category.relatedId;
        this.startDate = category.startDate;
        this.endDate = category.endDate;
        this.parent = category.parent;
        if(this.children == null) this.children = new ArrayList<Diagram>();
        for(Diagram child : category.getChildren())
        {
            this.children.add(new Diagram(child));
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

    public Diagram getParent() {
        return parent;
    }

    public void setParent(Diagram parent) {
        this.parent = parent;
    }

    public List<Diagram> getChildren() {
        return children;
    }

    public void setChildren(List<Diagram> children) {
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
