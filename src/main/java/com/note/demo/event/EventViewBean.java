package com.note.demo.event;

import java.util.List;

import com.note.demo.Utl;

public class EventViewBean {
	private String id;
    private String name;
    private String category;
    private String status;
    private String sorted;
    private String sortedCategory;

    private String date;
    private String time;
    private String memo;
    private String duration;
    private String percent;
    private int index;
    private String lastDate;
    private String shortName;
    private String topic;
    private String topicBind;
    private Boolean isBinded;
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
        if(event.getItems() != null && event.getItems().size() != 0) {
            this.lastDate = event.getItems().get(event.getItems().size() - 1).getDate();
        }
        this.shortName = this.name.substring(0, 1);
        this.topic = event.getTopic();
        this.isBinded = false;
    }

    public EventViewBean(EventParentBean event, String date){
        this(event);
        for(EventChildBean item : event.getItems())
        {
            if(date.equals(item.getDate()))
            {
                this.time = Utl.parseTimeToString(item.getTime());
                this.memo = item.getMemo();
                this.topic = Utl.check(event.getTopic()) ? event.getTopic() : item.getTopic();
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
        this.topic = Utl.check(event.getTopic()) ? event.getTopic() : item.getTopic();
        this.shortName = this.name.substring(0, 1);
        this.isBinded = false;
    }

    public EventViewBean(String date)
    {
        this.date = date;
        this.status = Utl.Status.COL1_ONPROCESS.getValue();
        this.sorted = Utl.Sorted.ST1_EVENT.getValue();
        this.time = "";
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
        this.topic = event.getTopic();
        String inputDate = "";
        double totalTime = 0.0;
        int totalDuration = 0;
        for(EventChildBean item : event.getItems())
        {
            if(item.getDate().compareTo(startDate) >= 0 && item.getDate().compareTo(endDate) <= 0)
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
        this.shortName = this.name.substring(0, 1);
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String parcent) {
        this.percent = parcent;
    }

    public EventViewBean(String name, String category, String status, String sorted, 
                        String date, String time, String memo, String topic, String topicBind){
        this.name = name;
        this.category = category;
        this.status = status;
        this.sorted = sorted;
        this.date = date;
        this.time = time;
        this.memo = memo;
        this.shortName = this.name.substring(0, 1);
        this.topic = topic;
        this.topicBind = topicBind;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }

    public String getSortedCategory() {
        return sortedCategory;
    }

    public void setSortedCategory(String sortedCategory) {
        this.sortedCategory = sortedCategory;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTopicBind() {
        return topicBind;
    }

    public void setTopicBind(String topicBind) {
        this.topicBind = topicBind;
    }

    public Boolean getIsBinded() {
        return isBinded;
    }

    public void setIsBinded(Boolean isBinded) {
        this.isBinded = isBinded;
    }

}
