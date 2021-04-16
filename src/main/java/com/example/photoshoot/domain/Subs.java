package com.example.photoshoot.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Subs {
    @Id
    private Long id;
    private Long user_id;

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
