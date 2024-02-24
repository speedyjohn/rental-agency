package com.example.RentalAgency.controllers.admin;

import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/images")
@RequiredArgsConstructor
public class AdminImageController {
    private final AdService adService;
    private final FileStorageService imageService;

    @GetMapping("")
    public String adminImages(Model model) {
        model.addAttribute("images", imageService.getImages());
        return "admin/main/images/index";
    }

    @GetMapping("/view/{id}")
    public String viewImage(@PathVariable Long id, Model model) {
        model.addAttribute("image", imageService.getImageById(id));
        return "admin/main/images/view";
    }

    @GetMapping("/create")
    public String createImage(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/images/create";
    }

    @PostMapping("/store")
    public String uploadFiles(@RequestParam("files") MultipartFile[] files, @RequestParam("ad") Long ad, @RequestParam("isPreviewImage") boolean isPreviewImage) {
        List<String> fileNames = new ArrayList<>();
        for (MultipartFile file : files) {
            String fileName = imageService.storeFile(file, ad, isPreviewImage);
            fileNames.add(fileName);
        }
        return "redirect:/admin/images";
    }

    @PostMapping("/delete/{id}")
    public String deleteImage(@PathVariable Long id) {
        imageService.deleteImage(id);
        return "redirect:/admin/images";
    }
}
