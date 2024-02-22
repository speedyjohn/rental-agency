package com.example.RentalAgency.services;


import com.example.RentalAgency.models.Category;
import com.example.RentalAgency.repositories.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public Category getCategoryById(Long id) {
        return categoryRepository.findCategoryById(id);
    }
}
