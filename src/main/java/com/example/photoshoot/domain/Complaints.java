package com.example.photoshoot.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Complaints {
    @Id
    private Long user_id;
    private Long post_id;
    private String reason; //char?
    private String description;
    private Date date;

    public void setId(Long id) {
        this.post_id = post_id;
    }

    public void setPost_id(Long post_id) {
        this.post_id = post_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
