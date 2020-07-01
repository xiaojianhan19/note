package com.note.demo.event;

import java.util.List;

public class EventViewBean {
	private String id;
    private String name;
    private String category;
    private String status;
    private String sorted;

    private String date;
    private String time;
    private String memo;

    public EventViewBean(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public EventViewBean(EventParentBean event){
        this.id = String.valueOf(event.getId());
        this.name = event.getName();
        this.category = event.getCategory();
        this.status = event.getStatus();
        this.sorted = event.getSorted();
    }

    public EventViewBean(EventParentBean event, String date){
        this(event);
        for(EventChildBean item : event.getItems())
        {
            if(date.equals(item.getDate()))
            {
                this.time = String.valueOf(item.getTime());
                this.memo = item.getMemo();
            }
        }
    }

    public EventViewBean(EventChildBean item, String date){
        EventParentBean event = item.getParent();
        if(event == null)
            return;
        this.id = String.valueOf(event.getId());
        this.name = event.getName();
        this.category = event.getCategory();
        this.status = event.getStatus();
        this.sorted = event.getSorted();
        this.time = String.valueOf(item.getTime());
        this.memo = item.getMemo();
    }

    public EventViewBean(String date)
    {
        this.date = date.toString();
    }

    public String getSorted() {
        return sorted;
    }

    public void setSorted(String sorted) {
        this.sorted = sorted;
    }

}
