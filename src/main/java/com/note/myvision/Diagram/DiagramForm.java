package com.note.myvision.Diagram;

import java.util.ArrayList;
import java.util.List;

public class DiagramForm {
    private List<DiagramView> items;

    public DiagramForm() {
        this.items = new ArrayList<DiagramView>();
    }

    public void add(DiagramView item)
    {
        if(items == null)
            items = new ArrayList<DiagramView>();
        items.add(item);
    }

    public List<DiagramView> getItems() {
        return items;
    }

    public void setItems(List<DiagramView> items) {
        this.items = items;
    }

}
