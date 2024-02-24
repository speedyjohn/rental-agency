package com.example.RentalAgency.controllers.admin;

import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CategoryService;
import com.example.RentalAgency.services.CommentService;
import com.example.RentalAgency.services.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
    private final AdService adService;
    private final CategoryService categoryService;
    private final CommentService commentService;
    private final FileStorageService imageService;

    @GetMapping("/")
    public String admin(Model model) {
        model.addAttribute("adsCount", adService.getAds().size());
        model.addAttribute("categoriesCount", categoryService.getCategories().size());
        model.addAttribute("commentsCount", commentService.getComments().size());
        model.addAttribute("imagesCount", imageService.getImages().size());
        return "admin/main/index";
    }
}
