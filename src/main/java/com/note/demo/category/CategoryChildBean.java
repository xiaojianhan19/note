
package com.note.demo.category;

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

@Entity
@Table(name = "category_item")
public class CategoryChildBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "category_item_id_seq")
    @SequenceGenerator(
        name = "category_item_id_seq",
        sequenceName = "category_item_id_seq",
        initialValue = 41000001,
        allocationSize = 1)
    private int id;

    private String name;

    @ManyToOne(fetch=FetchType.LAZY)
    private CategoryChildBean parent;

    @OneToMany(mappedBy = "parent", cascade= CascadeType.DETACH)
    private List<CategoryChildBean> children; 
    
    private int root;

    public CategoryChildBean(){}

    public CategoryChildBean(String name)
    {
        this.name = name;
    }

    public CategoryChildBean(CategoryChildBean category)
    {
        this.id = category.id;
        this.name = category.name;
        this.parent = category.parent;
        if(this.children == null)
            this.children = new ArrayList<CategoryChildBean>();
        for(CategoryChildBean child : category.getChildren())
        {
            this.children.add(new CategoryChildBean(child));
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

    public CategoryChildBean getParent() {
        return parent;
    }

    public void setParent(CategoryChildBean parent) {
        this.parent = parent;
    }

    public List<CategoryChildBean> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryChildBean> children) {
        this.children = children;
    }

    public int getRoot() {
        return root;
    }

    public void setRoot(int root) {
        this.root = root;
    }

}
