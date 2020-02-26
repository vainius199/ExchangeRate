package com.domain;

import javax.persistence.*;

@Entity
@Table(name = "history")
public class History {

    @Id
    private Long id;
    private String name;
    private String rate;
    private String date;

    public History(){
        super();
    }

    public History(Long id,String name, String rate, String date) {
        this.id = id;
        this.name = name;
        this.rate = rate;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
