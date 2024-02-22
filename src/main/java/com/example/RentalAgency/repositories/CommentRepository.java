package com.example.RentalAgency.repositories;

import com.example.RentalAgency.models.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CommentRepository extends JpaRepository<Comment,Long> {
    List<Comment> findAllByAd_IdOrderByIdDesc(Long ad_id);
}
