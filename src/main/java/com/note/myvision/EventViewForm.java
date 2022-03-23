package com.note.myvision;

import java.util.ArrayList;
import java.util.List;

public class EventViewForm {
    private String date;
    private List<EventViewBean> items;

    public EventViewForm() {
        this.date = "";
        this.items = new ArrayList<EventViewBean>();
    }

    public void add(EventViewBean item)
    {
        if(items == null)
            items = new ArrayList<EventViewBean>();
        items.add(item);
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<EventViewBean> getItems() {
        return items;
    }

    public void setItems(List<EventViewBean> items) {
        this.items = items;
    }

}
