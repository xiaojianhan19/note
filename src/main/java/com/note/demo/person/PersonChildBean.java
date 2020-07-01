package com.note.demo.person;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "person_item")
public class PersonChildBean {

	@Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "pesron_item_id_seq")
    @SequenceGenerator(
        name = "pesron_item_id_seq",
        sequenceName = "pesron_item_id_seq",
        initialValue = 21000001,
        allocationSize = 1)
	private int id;

    @ManyToOne
	private PersonParentBean parent;

    private String date;
    private double time;
    private String memo;

    public PersonChildBean(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public PersonParentBean getParent() {
        return parent;
    }

    public void setParent(PersonParentBean parent) {
        this.parent = parent;
    }

    // public PersonChildBean(PersonViewBean vBean, PersonParentBean p) {
    //     this.date = vBean.getDate();
    //     this.time = Utl.parseDouble(vBean.getTime());
    //     this.memo = vBean.getMemo();
    //     this.parent = p;
    // }    

    public PersonChildBean(String date, PersonParentBean p) {
        this.date = date;
        this.time = 0.0;
        this.memo = "";
        this.parent = p;
    }

}
