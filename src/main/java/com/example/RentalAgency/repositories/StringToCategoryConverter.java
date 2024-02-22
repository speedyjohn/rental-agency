package com.example.RentalAgency.repositories;

import com.example.RentalAgency.models.Category;
import com.example.RentalAgency.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.core.convert.converter.Converter;

@Component
public class StringToCategoryConverter implements Converter<String, Category> {
    @Autowired
    private CategoryService categoryService;

    public Category convert(String source) {
        Long id = Long.parseLong(source);
        return categoryService.getCategoryById(id);
    }
}