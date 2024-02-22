package com.example.RentalAgency.controllers;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.services.AdService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/admin/")
@RequiredArgsConstructor
public class AdminController {
    private final AdService adService;

    @GetMapping("/")
    public String admin() {
        return "admin/main/index";
    }

    @GetMapping("/ads")
    public String adminAds(Model model) {
        model.addAttribute("ads", adService.getAds());
        return "admin/main/ads/index";
    }


    @PostMapping("/ads/store")
    public String createAd(Ad ad) throws IOException {
        Ad createdAd = adService.saveAd(ad);
        return "redirect:/admin/";
    }

    @GetMapping("/ads/create")
    public String createAd() {
        return "admin/main/ads/create";
    }
}
