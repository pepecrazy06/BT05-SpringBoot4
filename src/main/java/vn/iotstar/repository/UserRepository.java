package vn.iotstar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.iotstar.entity.User;

import java.util.List;

public interface UserRepository
        extends JpaRepository<User, Integer> {


    // =========================================
    // SEARCH
    // username / email / fullname / phone
    // =========================================

    @Query("""
            SELECT u
            FROM User u
            WHERE
                LOWER(u.username)
                    LIKE LOWER(CONCAT('%', :keyword, '%'))
            OR
                LOWER(u.email)
                    LIKE LOWER(CONCAT('%', :keyword, '%'))
            OR
                LOWER(COALESCE(u.fullname, ''))
                    LIKE LOWER(CONCAT('%', :keyword, '%'))
            OR
                LOWER(COALESCE(u.phone, ''))
                    LIKE LOWER(CONCAT('%', :keyword, '%'))
            """)
    List<User> search(
            @Param("keyword")
            String keyword
    );


    // =========================================
    // CHECK TRÙNG KHI ADD
    // =========================================

    boolean existsByUsernameIgnoreCase(
            String username
    );


    boolean existsByEmailIgnoreCase(
            String email
    );


    // =========================================
    // CHECK TRÙNG KHI EDIT
    // nhưng bỏ qua chính User đang sửa
    // =========================================

    boolean existsByUsernameIgnoreCaseAndIdNot(
            String username,
            Integer id
    );


    boolean existsByEmailIgnoreCaseAndIdNot(
            String email,
            Integer id
    );
}