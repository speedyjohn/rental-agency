package com.example.RentalAgency.controllers.main;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CategoryService;
import com.example.RentalAgency.services.CommentService;
import com.example.RentalAgency.services.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdController {
    private final AdService adService;
    private final CommentService commentService;
    private final CategoryService categoryService;
    private final FileStorageService imageService;

    public void addImagesToAds(List<Ad> ads) {
        ads.forEach(ad -> {
            String image = imageService.getPreviewByAd(ad.getId()).getPath();
            ad.setImagePath(image);
            if(ad.getDescription().length() > 100) {
                String truncated = ad.getDescription().substring(0, 100);
                int lastSpaceIndex = truncated.lastIndexOf(' ');
                if (lastSpaceIndex > -1) {
                    truncated = truncated.substring(0, lastSpaceIndex);
                }
                ad.setDescription(truncated  + " ...");
            }
        });
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Ad> ads = adService.getAds();
        addImagesToAds(ads);
        model.addAttribute("ads", ads);
        return "main/index";
    }

    @GetMapping("/ad/{id}")
    public String adInfo(@PathVariable Long id, Model model) {
        Ad ad = adService.getAdById(id);
        ad.setViews(ad.getViews() + 1);
        adService.saveAd(ad);
        model.addAttribute("ad", ad);
        model.addAttribute("comments", commentService.getCommentsByAdId(id));
        model.addAttribute("images", imageService.getImagesByAd(id));
        return "main/ad-info";
    }

    @GetMapping("/ads")
    public String ads(Model model) {
        List<Ad> ads = adService.getAds();
        addImagesToAds(ads);
        model.addAttribute("ads", ads);
        model.addAttribute("categories", categoryService.getCategories());
        return "main/shop";
    }

    @GetMapping("/ads/{cat}")
    public String adsWithCategory(@PathVariable String cat, Model model) {
        Long categoryId = categoryService.getCategoryByName(cat).getId();
        List<Ad> ads = adService.getAdsByCategory(categoryId);
        addImagesToAds(ads);
        model.addAttribute("ads", ads);
        model.addAttribute("categories", categoryService.getCategories());
        return "main/shop";
    }
}
