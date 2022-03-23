
package com.note.myvision;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

public class TopicViewBean {

    private int id;
    private String name;
    private TopicViewBean parent;
    private List<TopicViewBean> children; 
    private List<Object> items;
    
    private int root;
    private String eveCategory;
    private String perCategory;
    private String colCategory;
    private String achCategory;
    private String status;
    private String startDate;
    private String endDate;

    private String time;
    public TopicViewBean(){}

    public TopicViewBean(String name)
    {
        this.name = name;
        this.items = new ArrayList<Object>();
        this.children = new ArrayList<TopicViewBean>();
    }

    public TopicViewBean(TopicViewBean category)
    {
        this.id = category.id;
        this.name = category.name;
        this.parent = category.parent;
        if(this.children == null)
            this.children = new ArrayList<TopicViewBean>();
        for(TopicViewBean child : category.getChildren())
        {
            this.children.add(new TopicViewBean(child));
        }
        this.items = new ArrayList<Object>();
    }

    public TopicViewBean(TopicBean tv)
    {
        this.id = tv.getId();
        this.name = tv.getName();
        this.root = tv.getRoot();
        this.status = tv.getStatus();
        this.eveCategory = tv.getEveCategory();
        this.perCategory = tv.getPerCategory();
        this.colCategory = tv.getColCategory();
        this.achCategory = tv.getAchCategory();
        this.startDate = tv.getStartDate();
        this.endDate = tv.getEndDate();
        if(tv.getParent() != null) {
            this.parent = new TopicViewBean(tv.getParent());
        }
        if(this.children == null)
            this.children = new ArrayList<TopicViewBean>();
        // for(TopicBean child : category.getChildren())
        // {
        //     this.children.add(new TopicBean(child));
        // }
        this.items = new ArrayList<Object>();
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

    public int getRoot() {
        return root;
    }

    public void setRoot(int root) {
        this.root = root;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEveCategory() {
        return eveCategory;
    }

    public void setEveCategory(String eveCategory) {
        this.eveCategory = eveCategory;
    }

    public String getPerCategory() {
        return perCategory;
    }

    public void setPerCategory(String perCategory) {
        this.perCategory = perCategory;
    }

    public String getColCategory() {
        return colCategory;
    }

    public void setColCategory(String colCategory) {
        this.colCategory = colCategory;
    }

    public String getAchCategory() {
        return achCategory;
    }

    public void setAchCategory(String achCategory) {
        this.achCategory = achCategory;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<Object> getItems() {
        return items;
    }

    public void setItems(List<Object> items) {
        this.items = items;
    }

    public TopicViewBean getParent() {
        return parent;
    }

    public void setParent(TopicViewBean parent) {
        this.parent = parent;
    }

    public List<TopicViewBean> getChildren() {
        return children;
    }

    public void setChildren(List<TopicViewBean> children) {
        this.children = children;
    }

}
