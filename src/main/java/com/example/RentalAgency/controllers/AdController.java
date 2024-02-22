package com.example.RentalAgency.controllers;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.repositories.AdRepository;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CommentService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdController {
    private final AdService adService;
    private final CommentService commentService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("ads", adService.getFeaturedAds());
        return "main/index";
    }

    @GetMapping("/ad/{id}")
    public String adInfo(@PathVariable Long id, Model model) throws IOException {
        Ad ad = adService.getAdById(id);
        ad.setViews(ad.getViews() + 1);
        adService.saveAd(ad);
        model.addAttribute("ad", ad);
        model.addAttribute("comments", commentService.getCommentsByAdId(id));
        return "main/ad-info";
    }

    @GetMapping("/ads")
    public String ads(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "main/shop";
    }


    @PostMapping("/ad/delete/{id}")
    public String deleteAd(@PathVariable Long id) {
        adService.deleteAd(id);
        return "redirect:/";
    }

    @GetMapping("/comments")
    @ResponseBody
    public List<Comment> getAllComments() {
        return commentService.getComments();
    }

}
