package com.example.RentalAgency.repositories;

import com.example.RentalAgency.models.Ad;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdRepository extends JpaRepository<Ad,Long> {
    List<Ad>findByTitle(String title);
    List<Ad>findTop4ByOrderByViewsDesc();
}
