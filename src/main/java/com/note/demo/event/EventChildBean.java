package com.note.demo.event;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.note.demo.Utl;


@Entity
@Table(name = "event_item")
public class EventChildBean {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "event_item_id_seq")
    @SequenceGenerator(
        name = "event_item_id_seq",
        sequenceName = "event_item_id_seq",
        initialValue = 11000001,
        allocationSize = 1)
	private int id;

    @ManyToOne
	private EventParentBean parent;

    private String date;
    private double time;
    private String memo;

    public EventChildBean(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EventParentBean getParent() {
        return parent;
    }

    public void setParent(EventParentBean parent) {
        this.parent = parent;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public EventChildBean(EventChildBean item) {
        this.id = item.getId();
        this.date = item.getDate();
        this.time = item.getTime();
        this.memo = item.getMemo();
        this.parent = item.getParent();
    }

    public EventChildBean(EventViewBean vBean, EventParentBean p) {
        this.date = vBean.getDate();
        this.time = Utl.parseDouble(vBean.getTime());
        this.memo = vBean.getMemo();
        this.parent = p;
    }

    public EventChildBean(String date, EventParentBean p) {
        this.date = date;
        this.time = 0.0;
        this.memo = "";
        this.parent = p;
    }

    public EventChildBean(EventChildBean item, EventParentBean parent) {
        this.id = item.getId();
        this.date = item.getDate();
        this.time = item.getTime();
        this.memo = item.getMemo();
        this.parent = parent;
    }
    

}
