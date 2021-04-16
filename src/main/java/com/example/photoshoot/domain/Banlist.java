package com.example.photoshoot.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "banlist")
public class Banlist {
    @Id
    private Long id;
    private Long banned_id;

    public Long getBanned_id() {
        return banned_id;
    }

    public void setBanned_id(Long banned_id) {
        this.banned_id = banned_id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
