package vn.iotstar.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {

    private final CategoryService
            categoryService;


    public AdminCategoryController(
            CategoryService categoryService) {

        this.categoryService =
                categoryService;
    }


    // =========================================
    // LIST + SEARCH
    // =========================================

    @GetMapping
    public String listCategories(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,
            Model model) {

        List<Category> categories;


        if (keyword != null
                && !keyword.isBlank()) {

            categories =
                    categoryService.search(
                            keyword.trim()
                    );

        } else {

            categories =
                    categoryService.findAll();
        }


        model.addAttribute(
                "categories",
                categories
        );


        model.addAttribute(
                "keyword",
                keyword
        );


        return "admin/category-list";
    }


    // =========================================
    // SHOW ADD FORM
    // =========================================

    @GetMapping("/add")
    public String showAddForm(
            Model model) {

        Category category =
                new Category();


        category.setStatus(1);


        model.addAttribute(
                "category",
                category
        );


        return "admin/category-add";
    }


    // =========================================
    // ADD CATEGORY
    // =========================================

    @PostMapping("/add")
    public String addCategory(
            @ModelAttribute("category")
            Category category,
            Model model) {

        if (category.getCategoryname() == null
                || category
                .getCategoryname()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Tên Category không được để trống"
            );


            return "admin/category-add";
        }


        category.setCategoryname(
                category
                        .getCategoryname()
                        .trim()
        );


        if (category.getStatus() == null) {

            category.setStatus(1);
        }


        categoryService.save(
                category
        );


        return "redirect:/admin/categories";
    }


    // =========================================
    // SHOW EDIT FORM
    // =========================================

    @GetMapping("/edit/{id}")
    public String showEditForm(
            @PathVariable("id")
            Integer id,
            Model model) {

        Category category =
                categoryService.findById(id);


        if (category == null) {

            return "redirect:/admin/categories";
        }


        model.addAttribute(
                "category",
                category
        );


        return "admin/category-edit";
    }


    // =========================================
    // UPDATE CATEGORY
    // =========================================

    @PostMapping("/edit")
    public String updateCategory(
            @ModelAttribute("category")
            Category formCategory,
            Model model) {

        if (formCategory.getCategoryId()
                == null) {

            return "redirect:/admin/categories";
        }


        Category category =
                categoryService.findById(
                        formCategory.getCategoryId()
                );


        if (category == null) {

            return "redirect:/admin/categories";
        }


        if (formCategory.getCategoryname()
                == null
                || formCategory
                .getCategoryname()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Tên Category không được để trống"
            );


            model.addAttribute(
                    "category",
                    formCategory
            );


            return "admin/category-edit";
        }


        category.setCategoryname(
                formCategory
                        .getCategoryname()
                        .trim()
        );


        category.setImages(
                formCategory.getImages()
        );


        category.setStatus(
                formCategory.getStatus()
        );


        categoryService.save(
                category
        );


        return "redirect:/admin/categories";
    }


    // =========================================
    // DELETE CATEGORY
    // =========================================

    @GetMapping("/delete/{id}")
    public String deleteCategory(
            @PathVariable("id")
            Integer id) {

        try {

            categoryService.deleteById(id);

        } catch (Exception e) {

            return "redirect:/admin/categories?deleteError=1";
        }


        return "redirect:/admin/categories";
    }
}