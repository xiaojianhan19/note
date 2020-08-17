package com.note.demo.event;

import java.util.List;

import com.note.demo.Utl;

public class EventViewBean {
	private String id;
    private String name;
    private String category;
    private String status;
    private String sorted;

    private String date;
    private String time;
    private String memo;
    private String duration;
    private String percent;

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
        this.id = Utl.parseIdToString(event.getId());
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
                this.time = Utl.parseTimeToString(item.getTime());
                this.memo = item.getMemo();
            }
        }
    }

    public EventViewBean(EventChildBean item){
        EventParentBean event = item.getParent();
        if(event == null)
            return;
        this.id = Utl.parseIdToString(event.getId());
        this.name = event.getName();
        this.category = event.getCategory();
        this.status = event.getStatus();
        this.sorted = event.getSorted();
        this.date = item.getDate();
        this.time = Utl.parseTimeToString(item.getTime());


        this.memo = item.getMemo();
    }

    public EventViewBean(String date)
    {
        this.date = date;
    }

    public String getSorted() {
        return sorted;
    }

    public void setSorted(String sorted) {
        this.sorted = sorted;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public EventViewBean(EventParentBean event, String startDate, String endDate){
        this.id = Utl.parseIdToString(event.getId());
        this.name = event.getName();
        this.category = event.getCategory();
        this.status = event.getStatus();
        this.sorted = event.getSorted();
        String inputDate = "";
        double totalTime = 0.0;
        int totalDuration = 0;
        for(EventChildBean item : event.getItems())
        {
            if(item.getDate().compareTo(startDate) >= 0 && item.getDate().compareTo(endDate) < 0)
            {
                totalTime += item.getTime();
                totalDuration++;
            }
            if(inputDate.equals(""))
            {
                inputDate = item.getDate();
            }
        }
        this.time = Utl.parseTimeToString(totalTime);
        this.duration = Utl.parseIdToString(totalDuration);
        this.date = inputDate;
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String parcent) {
        this.percent = parcent;
    }

    public EventViewBean(String name, String category, String status, String sorted, String date, String time, String memo){
        this.name = name;
        this.category = category;
        this.status = status;
        this.sorted = sorted;
        this.date = date;
        this.time = time;
        this.memo = memo;
    }

}
