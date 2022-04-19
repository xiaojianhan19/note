package com.note.myvision;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.note.myvision.Utl;


@Entity
@Table(name = "event")
public class Event extends BaseBean {

    private double time;
    private String memo;
    private int parentId;

    public Event(){}

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

    public Event(Event item) {
        this.id = item.getId();
        this.name = item.getName();
        this.date = item.getDate();
        this.time = item.getTime();
        this.memo = item.getMemo();
        this.parentId = item.getId();
    }

    public Event(String date, Item p) {
        this.name = p.getName();
        this.date = date;
        this.time = 0.0;
        this.memo = "";
        this.parentId = p.getId();
    }

    public Event(Event item, Item parent) {
        this(item);
        this.parentId = parent.getId();
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
