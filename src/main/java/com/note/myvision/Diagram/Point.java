package com.note.myvision.Diagram;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotEmpty;

import org.springframework.data.annotation.Transient;

import com.note.myvision.BaseBean;

@Entity
public class Point extends BaseBean{
    
    //for point
    private int level;
    private int orderNo;
    private int diagram;
    private int childDiagramId;
    @Column(length = 7500)
    private String memo;

    public int getDiagram() {
        return diagram;
    }

    public void setDiagram(int diagram) {
        this.diagram = diagram;
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

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getChildDiagramId() {
        return childDiagramId;
    }

    public void setChildDiagramId(int childDiagramId) {
        this.childDiagramId = childDiagramId;
    }
}