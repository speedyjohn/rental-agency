package com.example.RentalAgency.repositories;

import com.example.RentalAgency.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image,Long> {
    List<Image> findAll();

    List<Image> findImageByAdId(Long id);

    Image findImageById(Long id);

    Image findImageByAdIdAndIsPreviewImageIsTrue(Long id);
}
