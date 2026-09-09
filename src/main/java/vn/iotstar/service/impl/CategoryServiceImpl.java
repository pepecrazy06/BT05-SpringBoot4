package vn.iotstar.service.impl;

import org.springframework.stereotype.Service;

import vn.iotstar.entity.Category;
import vn.iotstar.repository.CategoryRepository;
import vn.iotstar.service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl
        implements CategoryService {

    private final CategoryRepository
            categoryRepository;


    public CategoryServiceImpl(
            CategoryRepository categoryRepository) {

        this.categoryRepository =
                categoryRepository;
    }


    @Override
    public List<Category> findAll() {

        return categoryRepository.findAll();
    }


    @Override
    public List<Category> search(
            String keyword) {

        if (keyword == null
                || keyword.isBlank()) {

            return categoryRepository.findAll();
        }

        return categoryRepository
                .findByCategorynameContainingIgnoreCase(
                        keyword.trim()
                );
    }


    @Override
    public Category findById(
            Integer id) {

        return categoryRepository
                .findById(id)
                .orElse(null);
    }


    @Override
    public Category save(
            Category category) {

        return categoryRepository.save(
                category
        );
    }


    @Override
    public void deleteById(
            Integer id) {

        categoryRepository.deleteById(id);
    }
}