package com.example.RentalAgency.controllers.admin;

import com.example.RentalAgency.models.Ad;
import com.example.RentalAgency.models.Category;
import com.example.RentalAgency.services.AdService;
import com.example.RentalAgency.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/categories")
@RequiredArgsConstructor
public class AdminCategoryController {
    private final AdService adService;
    private final CategoryService categoryService;

    @GetMapping("")
    public String adminCategories(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/main/categories/index";
    }

    @GetMapping("/view/{id}")
    public String viewCategory(@PathVariable Long id, Model model) {
        model.addAttribute("cat", categoryService.getCategoryById(id));
        model.addAttribute("count", adService.getAdsByCategory(id).size());
        return "admin/main/categories/view";
    }

    @GetMapping("/create")
    public String createCategory() {
        return "admin/main/categories/create";
    }


    @PostMapping("/store")
    public String storeCategory(Category cat) {
        categoryService.saveCategory(cat);
        return "redirect:/admin/categories";
    }

    @GetMapping("/edit/{id}")
    public String editCategory(@PathVariable Long id, Model model) {
        model.addAttribute("cat", categoryService.getCategoryById(id));
        return "admin/main/categories/edit";
    }

    @PostMapping("/update/{id}")
    public String updateCategory(@PathVariable Long id, Category cat) {
        Category existingCat = categoryService.getCategoryById(id);
        existingCat.setName(cat.getName());
        categoryService.saveCategory(existingCat);
        return "redirect:/admin/categories";
    }

    @PostMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        List<Ad> ads = adService.getAdsByCategory(id);
        ads.forEach(ad -> ad.setCategory(null));
        categoryService.deleteCategory(id);
        return "redirect:/admin/categories";
    }
}
