
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

import com.note.myvision.Utl;

import org.springframework.data.annotation.Transient;

public class CategoryViewBean {

    private int id;
    private int index;
    private String name;
    private List<CategoryViewBean> children; 
    private double time;
    private String percent;
    private List<Object> items;
    private int count;
    private Boolean isBlank;        
    private List<TopicViewBean> topics;
    private String topic;
    
    private int isTopic;
    private String parentCatName;
    
    private String startDate;
    private String endDate;
    private int relatedId;
    
    public CategoryViewBean(){}

    public CategoryViewBean(String name)
    {
        this.name = name;
        this.items = new ArrayList<Object>();
        this.topics = new ArrayList<TopicViewBean>();
    }

    public CategoryViewBean(CategoryChildBean category)
    {
        this.id = category.getId();
        this.name = category.getName();
        this.topic = "";
        this.relatedId = category.getRelatedId();
        this.items = new ArrayList<Object>();
        if(this.children == null)
            this.children = new ArrayList<CategoryViewBean>();
        for(CategoryChildBean child : category.getChildren())
        {
            this.children.add(new CategoryViewBean(child));
        }
        this.topics = new ArrayList<TopicViewBean>();
    }

    public CategoryViewBean(TopicBean t)
    {
        this.id = t.getId();
        this.name = t.getName();
        this.startDate = t.getStartDate();
        this.endDate = t.getEndDate();
        this.items = new ArrayList<Object>();
        if(this.children == null)
            this.children = new ArrayList<CategoryViewBean>();
        if(t.getChildren() != null) {
            for(TopicBean child : t.getChildren())
            {
                this.children.add(new CategoryViewBean(child));
            }
        }
        this.topic = t.getName();
        this.isTopic = 1;
        this.parentCatName = t.getEveCategory();
        this.topics = new ArrayList<TopicViewBean>();
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

    public List<CategoryViewBean> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryViewBean> children) {
        this.children = children;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String percent) {
        this.percent = percent;
    }

	public void updateTime(String name, double time)
	{
		if(this.name.equals(name))
		{
			this.time += time;
		}
        else
        {
            if (this.children != null)
            {
                for (CategoryViewBean itr : this.children)
                {
                    itr.updateTime(name, time);
                }
            }
        }
    }
    
	public void updateTotal(double total)
	{
        double time = 0.0;
        if (this.children != null)
        {
            for (CategoryViewBean itr : this.children)
            {
                itr.updateTotal(total);
                time += itr.time;
            }
        }

        this.time += time;
        if(Utl.check(total)) {
            this.percent = Utl.parseTimeToString(this.time / total * 100) + "%";
        }        
	}

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public List<Object> getItems() {
        return items;
    }

    public void setItems(List<Object> items) {
        this.items = items;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void clearChild() {
        for(CategoryViewBean child : this.getChildren() ) {

            List<CategoryViewBean> children = child.getChildren();
            int cnt = children.size();
            for(int i=cnt-1; i >= 0; i--) {
                CategoryViewBean ch = children.get(i);
                if(ch.getTime() == 0.0) {
                    children.remove(i);
                }
            }
        }
    }

    public void clearChildNoItem() {

        for(CategoryViewBean child : this.getChildren() ) {
            child.clearChildNoItem();

            List<CategoryViewBean> children = child.getChildren();
            int cnt = children.size();
            for(int i=cnt-1; i >= 0; i--) {
                CategoryViewBean ch = children.get(i);
                if(ch.getChildren() == null || ch.getChildren().size() == 0) {
                    if(ch.getItems() == null || ch.getItems().size() == 0) {
                        children.remove(i);
                    }
                }
            }
        }
    }

    public Boolean getIsBlank() {
        return isBlank;
    }

    public void setIsBlank(Boolean isBlank) {
        this.isBlank = isBlank;
    }

    public List<TopicViewBean> getTopics() {
        return topics;
    }

    public void setTopics(List<TopicViewBean> topics) {
        this.topics = topics;
    }

    public int getIsTopic() {
        return isTopic;
    }

    public void setIsTopic(int isTopic) {
        this.isTopic = isTopic;
    }

    public String getParentCatName() {
        return parentCatName;
    }

    public void setParentCatName(String parentCatName) {
        this.parentCatName = parentCatName;
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

    public int getRelatedId() {
        return relatedId;
    }

    public void setRelatedId(int relatedId) {
        this.relatedId = relatedId;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

}
