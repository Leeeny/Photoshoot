package com.example.photoshoot.repos;

import com.example.photoshoot.domain.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepo extends CrudRepository<Post, Long> {
    List<Post> findByTag(String tag);
}
