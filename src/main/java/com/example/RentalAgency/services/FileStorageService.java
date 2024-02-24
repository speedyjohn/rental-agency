package com.example.RentalAgency.services;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Image;
import com.example.RentalAgency.repositories.AdRepository;
import com.example.RentalAgency.repositories.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.Instant;
import java.util.List;
import java.util.Random;

@Service
public class FileStorageService {

    private final Path fileStorageLocation;
    private final ImageRepository imageRepository;
    private final AdRepository adRepository;

    @Autowired
    public FileStorageService(ImageRepository imageRepository, AdRepository adRepository) {
        this.imageRepository = imageRepository;
        this.adRepository = adRepository;
        this.fileStorageLocation = Paths.get("src/main/resources/static/adImages/").toAbsolutePath().normalize();
        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new RuntimeException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public String storeFile(MultipartFile file, Long adId, boolean isPreviewImage) {
        String originalFileName = file.getOriginalFilename();
        String fileExtension = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }
        Random random = new Random();
        String fileName = Instant.now().getEpochSecond() + "image" + (1 + random.nextInt(100000)) + fileExtension;

        Path targetLocation = this.fileStorageLocation.resolve(fileName);
        try {
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            String relativePath = "/static/adImages/" + fileName;
            Ad ad = adRepository.findById(adId)
                    .orElseThrow(() -> new RuntimeException("Product not found with id " + adId));

            Image image = new Image();
            image.setPreviewImage(isPreviewImage);
            image.setPath(relativePath);
            image.setAd(ad);
            imageRepository.save(image);

            return fileName;
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    public Image getImageById(Long id) {
        return imageRepository.findImageById(id);
    }

    public Image getPreviewByAd(Long id) {
        return imageRepository.findImageByAdIdAndIsPreviewImageIsTrue(id);
    }

    public List<Image> getImages() {
        return imageRepository.findAll();
    }
    public List<Image> getImagesByAd(Long id) {
        return imageRepository.findImageByAdId(id);
    }

    public void deleteImage(Long id) {
        imageRepository.deleteById(id);
    }
}

