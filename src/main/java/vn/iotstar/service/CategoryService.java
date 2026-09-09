package vn.iotstar.service;

import vn.iotstar.entity.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAll();

    List<Category> search(
            String keyword
    );

    Category findById(
            Integer id
    );

    Category save(
            Category category
    );

    void deleteById(
            Integer id
    );
}