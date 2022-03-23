package com.note.myvision;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import com.note.myvision.Utl;


@Entity
@Table(name = "event")
public class EventParentBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "event_id_seq")
    @SequenceGenerator(
        name = "event_id_seq",
        sequenceName = "event_id_seq",
        initialValue = 10000001,
        allocationSize = 1)
    private int id;
    
    @NotEmpty
    private String name;
    private String category;
    private String status;
    private String sorted;
    private String topic;

    @OneToMany(mappedBy = "parent", cascade= {CascadeType.DETACH})
    private List<EventChildBean> items;

    public EventParentBean(){}

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

    public List<EventChildBean> getItems() {
        return items;
    }

    public void setItems(List<EventChildBean> items) {
        this.items = items;
    }

    public EventParentBean(EventViewBean vBean) {
        this.id = Utl.parseInt(vBean.getId());
        this.name = vBean.getName();
        this.category = vBean.getCategory();
        this.status = vBean.getStatus();
        this.topic = vBean.getTopic();
    }

    public String getSorted() {
        return sorted;
    }

    public void setSorted(String sorted) {
        this.sorted = sorted;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

}
