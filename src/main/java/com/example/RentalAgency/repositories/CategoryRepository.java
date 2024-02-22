package com.example.RentalAgency.repositories;

import com.example.RentalAgency.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category,Long> {
    Category findCategoryById(Long id);
}
