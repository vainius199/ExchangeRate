package com.domain;

import javax.persistence.*;

@Entity
@Table(name = "rates")
public class ExchangeRate {

    @Id
    private Long id;
    private String shortName;
    private String rate;
    private String name;

    public ExchangeRate(){

    }

    public ExchangeRate(Long id,String shortName, String rate, String name) {
        this.id = id;
        this.shortName = shortName;
        this.rate = rate;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
