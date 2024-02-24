package com.example.RentalAgency.controllers;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Category;
import com.example.RentalAgency.models.Comment;
import com.example.RentalAgency.models.Image;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CategoryService;
import com.example.RentalAgency.services.CommentService;
import com.example.RentalAgency.services.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

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

    @GetMapping("/ads")
    public String adminAds(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/ads/index";
    }

    @GetMapping("/ads/view/{id}")
    public String viewAd(@PathVariable Long id, Model model) {
        model.addAttribute("ad", adService.getAdById(id));
        model.addAttribute("count", commentService.getCommentsByAdId(id).size());
        return "admin/main/ads/view";
    }

    @GetMapping("/ads/create")
    public String createAd(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/ads/create";
    }

    @PostMapping("/ads/store")
    public String storeAd(Ad ad) {
        adService.saveAd(ad);
        return "redirect:/admin/ads";
    }

    @GetMapping("/ads/edit/{id}")
    public String editAd(@PathVariable Long id, Model model) {
        model.addAttribute("ad", adService.getAdById(id));
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/ads/edit";
    }

    @PostMapping("/ads/update/{id}")
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

    @PostMapping("/ads/delete/{id}")
    public String deleteAd(@PathVariable Long id) {
        List<Comment> comments = commentService.getCommentsByAdId(id);
        comments.forEach(comment -> comment.setAd(null));
        List<Image> images = imageService.getImagesByAd(id);
        images.forEach(image -> image.setAd(null));
        adService.deleteAd(id);
        return "redirect:/admin/ads";
    }


    @GetMapping("/categories")
    public String adminCategories(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/categories/index";
    }

    @GetMapping("/categories/view/{id}")
    public String viewCategory(@PathVariable Long id, Model model) {
        model.addAttribute("cat", categoryService.getCategoryById(id));
        model.addAttribute("count", adService.getAdsByCategory(id).size());
        return "admin/main/categories/view";
    }

    @GetMapping("/categories/create")
    public String createCategory() {
        return "admin/main/categories/create";
    }


    @PostMapping("/categories/store")
    public String storeCategory(Category cat) {
        categoryService.saveCategory(cat);
        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/edit/{id}")
    public String editCategory(@PathVariable Long id, Model model) {
        model.addAttribute("cat", categoryService.getCategoryById(id));
        return "admin/main/categories/edit";
    }

    @PostMapping("/categories/update/{id}")
    public String updateCategory(@PathVariable Long id, Category cat) {
        Category existingCat = categoryService.getCategoryById(id);
        existingCat.setName(cat.getName());
        categoryService.saveCategory(existingCat);
        return "redirect:/admin/categories";
    }

    @PostMapping("/categories/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        List<Ad> ads = adService.getAdsByCategory(id);
        ads.forEach(ad -> ad.setCategory(null));
        categoryService.deleteCategory(id);
        return "redirect:/admin/categories";
    }


    @GetMapping("/comments")
    public String adminComments(Model model) {
        model.addAttribute("comments", commentService.getComments());
        return "admin/main/comments/index";
    }

    @GetMapping("/comments/view/{id}")
    public String viewComment(@PathVariable Long id, Model model) {
        model.addAttribute("comment", commentService.getCommentById(id));
        return "admin/main/comments/view";
    }

    @GetMapping("/comments/create")
    public String createComment(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/comments/create";
    }


    @PostMapping("/comments/store")
    public String storeComment(Comment comment) {
        commentService.saveComment(comment);
        return "redirect:/admin/comments";
    }

    @GetMapping("/comments/edit/{id}")
    public String editComment(@PathVariable Long id, Model model) {
        model.addAttribute("comment", commentService.getCommentById(id));
        model.addAttribute("ads", adService.getAds());
        return "admin/main/comments/edit";
    }

    @PostMapping("/comments/update/{id}")
    public String updateComment(@PathVariable Long id, Comment comment) {
        Comment existingComment = commentService.getCommentById(id);
        existingComment.setAuthor(comment.getAuthor());
        existingComment.setText(comment.getText());
        existingComment.setAd(comment.getAd());
        commentService.saveComment(existingComment);
        return "redirect:/admin/comments";
    }

    @PostMapping("/comments/delete/{id}")
    public String deleteComment(@PathVariable Long id) {
        commentService.deleteComment(id);
        return "redirect:/admin/comments";
    }

    @GetMapping("/images")
    public String adminImages(Model model) {
        model.addAttribute("images", imageService.getImages());
        return "admin/main/images/index";
    }

    @GetMapping("/images/view/{id}")
    public String viewImage(@PathVariable Long id, Model model) {
        model.addAttribute("image", imageService.getImageById(id));
        return "admin/main/images/view";
    }

    @GetMapping("/images/create")
    public String createImage(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/images/create";
    }

    @PostMapping("/images/store")
    public String uploadFiles(@RequestParam("files") MultipartFile[] files, @RequestParam("ad") Long ad, @RequestParam("isPreviewImage") boolean isPreviewImage) {
        List<String> fileNames = new ArrayList<>();
        for (MultipartFile file : files) {
            String fileName = imageService.storeFile(file, ad, isPreviewImage);
            fileNames.add(fileName);
        }
        return "redirect:/admin/images";
    }

    @PostMapping("/images/delete/{id}")
    public String deleteImage(@PathVariable Long id) {
        imageService.deleteImage(id);
        return "redirect:/admin/images";
    }
}
