
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

public class CategoryView {

    //base vars
    private int id;
    private int index;
    private String name;
    private String type;
    private String date;
    private int parentId;
    private int orderNo;    
    private List<CategoryView> children;
    private String startDate;
    private String endDate;
    private int relatedId;  
    private boolean isUpdate;

    //for count
    private double time;
    private String percent;
    private List<Object> items;
    private int count;
    private Boolean isBlank;        
    private String topic;
    private int topicId;
    private String eventCatName;
    private int eventCatId;
    
    public CategoryView(){}

    public CategoryView(String name)
    {
        this.name = name;
        this.items = new ArrayList<Object>();
    }

    public CategoryView(Category category)
    {
        this.id = category.getId();
        this.name = category.getName();
        if(category.getParent() != null) {
            this.parentId = category.getParent().getId();
        }
        this.type = category.getType();
        this.date = category.getDate();
        this.orderNo = category.getOrderNo();
        this.startDate = category.getStartDate();
        this.endDate = category.getEndDate();
        this.relatedId = category.getRelatedId();
        this.items = new ArrayList<Object>();
        if(this.children == null)
            this.children = new ArrayList<CategoryView>();
        for(Category child : category.getChildren())
        {
            this.children.add(new CategoryView(child));
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

    public List<CategoryView> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryView> children) {
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

	public void updateTime(int id, double time)
	{
		if(this.id == id)
		{
			this.time += time;
		}
        else
        {
            if (this.children != null)
            {
                for (CategoryView itr : this.children)
                {
                    itr.updateTime(id, time);
                }
            }
        }
    }
    
	public void updateTotal(double total)
	{
        double time = 0.0;
        if (this.children != null)
        {
            for (CategoryView itr : this.children)
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
        for(CategoryView child : this.getChildren() ) {

            List<CategoryView> children = child.getChildren();
            int cnt = children.size();
            for(int i=cnt-1; i >= 0; i--) {
                CategoryView ch = children.get(i);
                if(ch.getTime() == 0.0) {
                    children.remove(i);
                }
            }
        }
    }

    public void clearChildNoItem() {

        if(this.getChildren() == null) return;

        for(CategoryView child : this.getChildren() ) {
            child.clearChildNoItem();
        }

        List<CategoryView> children = this.getChildren();
        int cnt = children.size();
        for(int i=cnt-1; i >= 0; i--) {
            CategoryView ch = children.get(i);
            if(ch.getChildren() == null || ch.getChildren().size() == 0) {
                if(ch.getItems() == null || ch.getItems().size() == 0) {
                    children.remove(i);
                }
            }
        }        
    }

    public void clearTopicOutDate(String date) {

        if(this.getChildren() == null) return;

        for(CategoryView child : this.getChildren() ) {
            child.clearTopicOutDate(date);
        }

        List<CategoryView> children = this.getChildren();
        int cnt = children.size();
        for(int i=cnt-1; i >= 0; i--) {
            CategoryView ch = children.get(i);
            if(Utl.check(ch.getStartDate())) {
                if(ch.getStartDate().compareTo(date) > 0 ) {
                    children.remove(i);
                    continue;
                }
            }
            if(Utl.check(ch.getEndDate())) {
                if(ch.getEndDate().compareTo(date) < 0 ) {
                    children.remove(i);
                    continue;
                }
            }            
        }
    }

    public void updateParentCatId(int eventCatId) {

        if(!Utl.check(this.getStartDate())) {
            this.eventCatId = this.id;
            eventCatId = this.eventCatId;
        } else {
            this.topicId = this.id;
            this.eventCatId = eventCatId;
        }
        for(CategoryView child : this.getChildren() ) {
            child.updateParentCatId(eventCatId);
        }
    }

    public Boolean getIsBlank() {
        return isBlank;
    }

    public void setIsBlank(Boolean isBlank) {
        this.isBlank = isBlank;
    }

    public String getParentCatName() {
        return eventCatName;
    }

    public void setParentCatName(String eventCatName) {
        this.eventCatName = eventCatName;
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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

	public boolean getIsUpdate() {
		return isUpdate;
	}

	public void setIsUpdate(boolean isUpdate) {
		this.isUpdate = isUpdate;
	}

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getParentCatId() {
        return eventCatId;
    }

    public void setParentCatId(int eventCatId) {
        this.eventCatId = eventCatId;
    }

    public String getEventCatName() {
        return eventCatName;
    }

    public void setEventCatName(String eventCatName) {
        this.eventCatName = eventCatName;
    }

    public int getEventCatId() {
        return eventCatId;
    }

    public void setEventCatId(int eventCatId) {
        this.eventCatId = eventCatId;
    }

    public void setUpdate(boolean isUpdate) {
        this.isUpdate = isUpdate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
