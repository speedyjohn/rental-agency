package com.example.RentalAgency.controllers.admin;

import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/comments")
@RequiredArgsConstructor
public class AdminCommentController {
    private final AdService adService;
    private final CommentService commentService;

    @GetMapping("")
    public String adminComments(Model model) {
        model.addAttribute("comments", commentService.getComments());
        return "admin/main/comments/index";
    }

    @GetMapping("/view/{id}")
    public String viewComment(@PathVariable Long id, Model model) {
        model.addAttribute("comment", commentService.getCommentById(id));
        return "admin/main/comments/view";
    }

    @GetMapping("/create")
    public String createComment(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/comments/create";
    }


    @PostMapping("/store")
    public String storeComment(Comment comment) {
        commentService.saveComment(comment);
        return "redirect:/admin/comments";
    }

    @GetMapping("/edit/{id}")
    public String editComment(@PathVariable Long id, Model model) {
        model.addAttribute("comment", commentService.getCommentById(id));
        model.addAttribute("ads", adService.getAds());
        return "admin/main/comments/edit";
    }

    @PostMapping("/update/{id}")
    public String updateComment(@PathVariable Long id, Comment comment) {
        Comment existingComment = commentService.getCommentById(id);
        existingComment.setAuthor(comment.getAuthor());
        existingComment.setText(comment.getText());
        existingComment.setAd(comment.getAd());
        commentService.saveComment(existingComment);
        return "redirect:/admin/comments";
    }

    @PostMapping("/delete/{id}")
    public String deleteComment(@PathVariable Long id) {
        commentService.deleteComment(id);
        return "redirect:/admin/comments";
    }
}
