package com.note.myvision;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "diary")
public class Diary extends BaseBean {

    private int length;

    @Column(columnDefinition = "text")
    private String text;

    public Diary(){}

    public Diary(String date){
        this.date = date;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
