package com.note.myvision;

import java.util.ArrayList;
import java.util.List;

public class CategoryForm {
    private List<CategoryView> items;

    public CategoryForm() {
        this.items = new ArrayList<CategoryView>();
    }

    public void add(CategoryView item)
    {
        if(items == null)
            items = new ArrayList<CategoryView>();
        items.add(item);
    }

    public List<CategoryView> getItems() {
        return items;
    }

    public void setItems(List<CategoryView> items) {
        this.items = items;
    }

}
