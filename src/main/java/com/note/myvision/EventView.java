package com.note.myvision;

public class EventView extends BaseBean {

    private String time;
    private String memo;
    private int parentId;

    //for timetable
    private String parentName;
    private int eventCategoryId;
    private String eventCategory;
    private int topicCategoryId;
    private String topicCategory;
    private int index;
    private Boolean isBinded;
    private String duration;
    private String percent;

    public EventView(){
        isBinded = false;
    }

    public EventView(Integer id, String name, String date, double time, String memo, Integer parentId, 
                        String itemName, Integer eventCategoryId, Integer topicCategoryId) {
        super(id, name, date);
        this.time = Utl.parseTimeToString(time);
        this.memo = memo;
        this.parentId = parentId;
        this.parentName = Utl.check(itemName) ? itemName : "";
        this.eventCategoryId = Utl.check(eventCategoryId) ? eventCategoryId : 0;
        this.topicCategoryId = Utl.check(topicCategoryId) ? topicCategoryId : 0;
    }

    public EventView(String name, double time, Integer parentId, 
                        String itemName, Integer eventCategoryId, Integer topicCategoryId) {
        this.name = name;
        this.time = Utl.parseTimeToString(time);
        this.parentId = parentId;
        this.parentName = itemName;
        this.eventCategoryId = Utl.check(eventCategoryId) ? eventCategoryId : 0;
        this.topicCategoryId = Utl.check(topicCategoryId) ? topicCategoryId : 0;
    }

    public EventView(double time, Integer parentId, 
                        String itemName, Integer eventCategoryId, Integer topicCategoryId) {
        this.time = Utl.parseTimeToString(time);
        this.parentId = parentId;
        this.parentName = itemName;
        this.eventCategoryId = Utl.check(eventCategoryId) ? eventCategoryId : 0;
        this.topicCategoryId = Utl.check(topicCategoryId) ? topicCategoryId : 0;
    }

    public EventView(Integer id, String name, String date, String itemName) {
        super(id, name, date);
        this.parentName = Utl.check(itemName) ? itemName : "";
    }

    public EventView(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public EventView(Item item, String date, int index) {
        this.parentName = item.getName();
        this.parentId = item.getId();
        this.eventCategoryId = item.getEventCategoryId();
        this.topicCategoryId = item.getTopicCategoryId();
        this.date = date;
        this.index = index;
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

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public Boolean getIsBinded() {
        return isBinded;
    }

    public void setIsBinded(Boolean isBinded) {
        this.isBinded = isBinded;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getEventCategoryId() {
        return eventCategoryId;
    }

    public void setEventCategoryId(int eventCategoryId) {
        this.eventCategoryId = eventCategoryId;
    }

    public int getTopicCategoryId() {
        return topicCategoryId;
    }

    public void setTopicCategoryId(int topicCategoryId) {
        this.topicCategoryId = topicCategoryId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
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

    public String getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }

    public String getTopicCategory() {
        return topicCategory;
    }

    public void setTopicCategory(String topicCategory) {
        this.topicCategory = topicCategory;
    }


}
