package com.note.myvision;

import java.util.ArrayList;
import java.util.List;

public class EventForm {
    private String date;
    private List<EventView> items;

    public EventForm() {
        this.date = "";
        this.items = new ArrayList<EventView>();
    }

    public void add(EventView item)
    {
        if(items == null)
            items = new ArrayList<EventView>();
        items.add(item);
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<EventView> getItems() {
        return items;
    }

    public void setItems(List<EventView> items) {
        this.items = items;
    }

}
