package com.note.myvision.Diagram;

import java.util.List;

import javax.persistence.Column;

import com.note.myvision.BaseBean;

public class PointView extends BaseBean{
    
    //for point
    private String name2;
    private int level;
    private int orderNo;
    private String releaseDate;
    private int parentId;
    private String parentName;
    private int pointCategoryId;
    private String pointCategory;
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
    //view point
    private List<Point> points;


    //for event view
    private String duration;
    private String percent;
    private int index;
    private String lastDate;
    private Boolean isBinded;
    private int relatedCatId;
    private String relatedCatName;
    private int relatedPointId;
    private String relatedPointName;

    private int pointId;
    private String changeToDate;

    //for point list
    private long ecount;
    private long chcount;
    private long rcount;
    private double time;

    public PointView(){
    }

    public PointView(Integer id, String name, long ecount, double time) {
        this.id = id;
        this.name = name;
        this.ecount = ecount;
        this.time = time;
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

    public List<Point> getPoints() {
        return points;
    }

    public void setPoints(List<Point> points) {
        this.points = points;
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

    public int getRelatedPointId() {
        return relatedPointId;
    }

    public void setRelatedPointId(int relatedPointId) {
        this.relatedPointId = relatedPointId;
    }

    public String getRelatedPointName() {
        return relatedPointName;
    }

    public void setRelatedPointName(String relatedPointName) {
        this.relatedPointName = relatedPointName;
    }

    public int getPointId() {
        return pointId;
    }

    public void setPointId(int pointId) {
        this.pointId = pointId;
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

    public int getPointCategoryId() {
        return pointCategoryId;
    }

    public void setPointCategoryId(int pointCategoryId) {
        this.pointCategoryId = pointCategoryId;
    }

    public String getPointCategory() {
        return pointCategory;
    }

    public void setPointCategory(String pointCategory) {
        this.pointCategory = pointCategory;
    }

    public String getSystemUrl() {
        return systemUrl;
    }

    public void setSystemUrl(String systemUrl) {
        this.systemUrl = systemUrl;
    }

    public long getEcount() {
        return ecount;
    }

    public void setEcount(long ecount) {
        this.ecount = ecount;
    }

    public long getRcount() {
        return rcount;
    }

    public void setRcount(long rcount) {
        this.rcount = rcount;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public long getChcount() {
        return chcount;
    }

    public void setChcount(long chcount) {
        this.chcount = chcount;
    }

}