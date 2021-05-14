package com.example.photoshoot.domain;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDateTime;


@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long post_id;
    //@NotBlank(message = "Пожалуйста, заполните это поле")
    private String text;
    private LocalDateTime date;
    private String tag;
    private String filename; //img

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Post() {
    }

    //public Post(String text, String tag, LocalDateTime date, User user) {
    public Post(String text, User user) {
        this.author = user;
        this.text = text;
        //this.tag = tag;
        //this.date = date;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public Long getPostId() {
        return post_id;
    }

    public void setPostId(Long post_id) {
        this.post_id = post_id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}