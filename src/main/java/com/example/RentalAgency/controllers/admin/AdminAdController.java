package com.example.RentalAgency.controllers.admin;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.models.Image;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CategoryService;
import com.example.RentalAgency.services.CommentService;
import com.example.RentalAgency.services.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/ads")
@RequiredArgsConstructor
public class AdminAdController {
    private final AdService adService;
    private final CategoryService categoryService;
    private final CommentService commentService;
    private final FileStorageService imageService;

    @GetMapping("/")
    public String adminAds(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/ads/index";
    }

    @GetMapping("/view/{id}")
    public String viewAd(@PathVariable Long id, Model model) {
        model.addAttribute("ad", adService.getAdById(id));
        model.addAttribute("count", commentService.getCommentsByAdId(id).size());
        return "admin/main/ads/view";
    }

    @GetMapping("/create")
    public String createAd(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/ads/create";
    }

    @PostMapping("/store")
    public String storeAd(Ad ad) {
        adService.saveAd(ad);
        return "redirect:/admin/ads";
    }

    @GetMapping("/edit/{id}")
    public String editAd(@PathVariable Long id, Model model) {
        model.addAttribute("ad", adService.getAdById(id));
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/ads/edit";
    }

    @PostMapping("/update/{id}")
    public String updateAd(@PathVariable Long id, Ad ad) {
        Ad existingAd = adService.getAdById(id);
        existingAd.setAuthor(ad.getAuthor());
        existingAd.setTitle(ad.getTitle());
        existingAd.setCity(ad.getCity());
        existingAd.setDescription(ad.getDescription());
        existingAd.setPrice(ad.getPrice());
        existingAd.setPhone(ad.getPhone());
        existingAd.setArea(ad.getArea());
        existingAd.setCategory(ad.getCategory());
        adService.saveAd(existingAd);
        return "redirect:/admin/ads";
    }

    @PostMapping("/delete/{id}")
    public String deleteAd(@PathVariable Long id) {
        List<Comment> comments = commentService.getCommentsByAdId(id);
        comments.forEach(comment -> comment.setAd(null));
        List<Image> images = imageService.getImagesByAd(id);
        images.forEach(image -> image.setAd(null));
        adService.deleteAd(id);
        return "redirect:/admin/ads";
    }
}
