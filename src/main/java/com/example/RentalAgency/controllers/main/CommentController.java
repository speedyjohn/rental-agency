package com.example.RentalAgency.controllers.main;

import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.services.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequiredArgsConstructor
public class CommentController {
    private final CommentService CommentService;

    @PostMapping("/comment/create/{id}")
    @ResponseBody
    public RedirectView createComment(@PathVariable Long id, Comment comment) {
        Comment createdComment = CommentService.saveComment(comment);
        return new RedirectView("/ad/" + id);
    }
}
