package com.note.demo.person;

import java.util.ArrayList;
import java.util.List;

import com.note.demo.category.CategoryChildBean;

public class PersonGroupBean {

    private String name;
    private List<PersonGroupBean> children; 
    private List<PersonParentBean> items;

    public PersonGroupBean(){}

    public PersonGroupBean(CategoryChildBean category) {
        if(category == null)
            return ;
        this.name = category.getName();
        if(this.children == null)
            this.children = new ArrayList<PersonGroupBean>();        
        for(CategoryChildBean child : category.getChildren())
        {
            this.children.add(new PersonGroupBean(child));
        }
    }    

    public PersonGroupBean(CategoryChildBean cat, List<PersonParentBean> items) {
        this.items = items;
    }


    public List<PersonParentBean> getItems() {
        return items;
    }

    public void setItems(List<PersonParentBean> items) {
        this.items = items;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<PersonGroupBean> getChildren() {
        return children;
    }

    public void setChildren(List<PersonGroupBean> children) {
        this.children = children;
    }


}
