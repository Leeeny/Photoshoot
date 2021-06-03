package com.example.photoshoot.controller;

import com.example.photoshoot.domain.Post;
import com.example.photoshoot.domain.User;
import com.example.photoshoot.repos.PostRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private PostRepo postRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Model model) {
        Iterable<Post> posts = postRepo.findAll();
        model.addAttribute("posts", posts);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            //@RequestParam LocalDateTime date,
            //@RequestParam String tag,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        // Post post = new Post(text, tag, date, user);
        Post post = new Post(text, user);
        if (file != null) {
            File uploadDir = new File(uploadPath);
            if (uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            post.setFilename(resultFileName);
        }
        postRepo.save(post);

        Iterable<Post> posts = postRepo.findAll();

        model.put("posts", posts);

        return "redirect:/main";
    }

    @GetMapping("/user-posts/{user}")
    public String userPosts(@AuthenticationPrincipal User currentUser,
                            @PathVariable User user,
                            Model model,
                            @RequestParam(required = false) Post post) {
        Set<Post> posts = user.getPosts();
        model.addAttribute("userProfile", user);
        model.addAttribute("subscriptionsCount", user.getSubscriptions().size());
        model.addAttribute("subscribersCount", user.getSubscribers().size());
        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
        model.addAttribute("posts", posts);
        model.addAttribute("post", post);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        return "userPosts";
    }

    @GetMapping("/error")
    public String error(){
        return "redirect:/main";
    }

    @PostMapping("/user-posts/{user}")
    public String addProfilePost(@AuthenticationPrincipal User user,
                             @RequestParam String text,
                             //@RequestParam LocalDateTime date,
                             //@RequestParam String tag,
                             Map<String, Object> model,
                             @RequestParam("file") MultipartFile file
    ) throws IOException {
        // Post post = new Post(text, tag, date, user);
        Post post = new Post(text, user);
        if (file != null) {
            File uploadDir = new File(uploadPath);
            if (uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            post.setFilename(resultFileName);
        }
        postRepo.save(post);

        Iterable<Post> posts = postRepo.findAll();

        model.put("posts", posts);

        return "redirect:/user-posts/" + user.getId();
    }


}

