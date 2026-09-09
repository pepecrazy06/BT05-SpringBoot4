package vn.iotstar.service;

import vn.iotstar.entity.User;

import java.util.List;

public interface UserService {

    List<User> findAll();


    List<User> search(
            String keyword
    );


    User findById(
            Integer id
    );


    User save(
            User user
    );


    void deleteById(
            Integer id
    );


    boolean existsUsername(
            String username
    );


    boolean existsEmail(
            String email
    );


    boolean existsUsernameOtherId(
            String username,
            Integer id
    );


    boolean existsEmailOtherId(
            String email,
            Integer id
    );
}