package com.example.photoshoot.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class BlockedUsers {
    @Id
    private Long id;
    private Date dateOfBan;
    private Date timeOfBan;
    private String reason;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public Date getDateOfBan() {
        return dateOfBan;
    }

    public void setDateOfBan(Date dateOfBan) {
        this.dateOfBan = dateOfBan;
    }

    public Date getTimeOfBan() {
        return timeOfBan;
    }

    public void setTimeOfBan(Date timeOfBan) {
        this.timeOfBan = timeOfBan;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
