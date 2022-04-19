package com.note.myvision;

import java.util.List;

import javax.persistence.Column;

public class ItemView extends BaseBean{
    
    //for item
    private String name2;
    private int level;
    private int orderNo;
    private String releaseDate;
    private int parentId;
    private String parentName;
    private int itemCategoryId;
    private String itemCategory;
    private String memo;
    //for event
    private int eventCategoryId;
    private String eventCategory;    
    private int topicCategoryId;
    private String topicCategory;
    private String status;
    //for category
    private String systemUrl;
    private String tags;
    private String url;
    private int childCategoryId;
    //view item
    private List<Item> items;
    private List<Resource> resources;
    private List<Event> events;

    //for event view
    private Event event;
    private String duration;
    private String percent;
    private int index;
    private String lastDate;
    private Boolean isBinded;
    private int relatedCatId;
    private String relatedCatName;
    private int relatedItemId;
    private String relatedItemName;

    private int itemId;
    private String changeToDate;

    public ItemView(){
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public List<Resource> getResources() {
        return resources;
    }

    public void setResources(List<Resource> resources) {
        this.resources = resources;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getChildCategoryId() {
        return childCategoryId;
    }

    public void setChildCategoryId(int childCategoryId) {
        this.childCategoryId = childCategoryId;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String percent) {
        this.percent = percent;
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

    public Boolean getIsBinded() {
        return isBinded;
    }

    public void setIsBinded(Boolean isBinded) {
        this.isBinded = isBinded;
    }

    public int getRelatedCatId() {
        return relatedCatId;
    }

    public void setRelatedCatId(int relatedCatId) {
        this.relatedCatId = relatedCatId;
    }

    public String getRelatedCatName() {
        return relatedCatName;
    }

    public void setRelatedCatName(String relatedCatName) {
        this.relatedCatName = relatedCatName;
    }

    public int getRelatedItemId() {
        return relatedItemId;
    }

    public void setRelatedItemId(int relatedItemId) {
        this.relatedItemId = relatedItemId;
    }

    public String getRelatedItemName() {
        return relatedItemName;
    }

    public void setRelatedItemName(String relatedItemName) {
        this.relatedItemName = relatedItemName;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getChangeToDate() {
        return changeToDate;
    }

    public void setChangeToDate(String changeToDate) {
        this.changeToDate = changeToDate;
    }

    public int getEventCategoryId() {
        return eventCategoryId;
    }

    public void setEventCategoryId(int eventCategoryId) {
        this.eventCategoryId = eventCategoryId;
    }

    public String getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }

    public int getTopicCategoryId() {
        return topicCategoryId;
    }

    public void setTopicCategoryId(int topicCategoryId) {
        this.topicCategoryId = topicCategoryId;
    }

    public String getTopicCategory() {
        return topicCategory;
    }

    public void setTopicCategory(String topicCategory) {
        this.topicCategory = topicCategory;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public int getItemCategoryId() {
        return itemCategoryId;
    }

    public void setItemCategoryId(int itemCategoryId) {
        this.itemCategoryId = itemCategoryId;
    }

    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    public String getSystemUrl() {
        return systemUrl;
    }

    public void setSystemUrl(String systemUrl) {
        this.systemUrl = systemUrl;
    }

    public List<Event> getEvents() {
        return events;
    }

    public void setEvents(List<Event> events) {
        this.events = events;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

}