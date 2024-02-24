package com.example.RentalAgency.services;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Image;
import com.example.RentalAgency.repositories.AdRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


@Service
@RequiredArgsConstructor
public class AdService {
    private final AdRepository adRepository;

    public List<Ad> getAds() {
        return adRepository.findAll();
    }

    public List<Ad> getFeaturedAds() {
        return adRepository.findTop4ByOrderByViewsDesc();
    }

    public Ad saveAd(Ad ad) {
        return adRepository.save(ad);
    }

    public Ad getAdById(Long id) {
        return adRepository.findById(id).orElse(null);
    }

    public List<Ad> getAdsByCategory(Long id) {
        return adRepository.findAdsByCategoryId(id);
    }


    public void deleteAd(Long id) {
        adRepository.deleteById(id);
    }
}
