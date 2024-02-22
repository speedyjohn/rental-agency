package com.example.RentalAgency.services;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.repositories.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository CommentRepository;

    public List<Comment> getComments() {
        return CommentRepository.findAll();
    }

    public List<Comment> getCommentsByAdId(Long id) {
        return CommentRepository.findAllByAd_IdOrderByIdDesc(id);
    }

    public Comment saveComment(Comment comment) {
        return CommentRepository.save(comment);
    }

    public Comment getCommentById(Long id) {
        return CommentRepository.findById(id).orElse(null);
    }


    public void deleteComment(Long id) {
        CommentRepository.deleteById(id);
    }


}
