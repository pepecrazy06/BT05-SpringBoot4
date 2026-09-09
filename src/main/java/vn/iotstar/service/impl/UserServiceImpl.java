package vn.iotstar.service.impl;

import org.springframework.stereotype.Service;

import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;
import vn.iotstar.service.UserService;

import java.util.List;

@Service
public class UserServiceImpl
        implements UserService {

    private final UserRepository
            userRepository;


    public UserServiceImpl(
            UserRepository userRepository) {

        this.userRepository =
                userRepository;
    }


    @Override
    public List<User> findAll() {

        return userRepository.findAll();
    }


    @Override
    public List<User> search(
            String keyword) {

        if (keyword == null
                || keyword.isBlank()) {

            return userRepository.findAll();
        }


        return userRepository.search(
                keyword.trim()
        );
    }


    @Override
    public User findById(
            Integer id) {

        return userRepository
                .findById(id)
                .orElse(null);
    }


    @Override
    public User save(
            User user) {

        return userRepository.save(user);
    }


    @Override
    public void deleteById(
            Integer id) {

        userRepository.deleteById(id);
    }


    @Override
    public boolean existsUsername(
            String username) {

        return userRepository
                .existsByUsernameIgnoreCase(
                        username
                );
    }


    @Override
    public boolean existsEmail(
            String email) {

        return userRepository
                .existsByEmailIgnoreCase(
                        email
                );
    }


    @Override
    public boolean existsUsernameOtherId(
            String username,
            Integer id) {

        return userRepository
                .existsByUsernameIgnoreCaseAndIdNot(
                        username,
                        id
                );
    }


    @Override
    public boolean existsEmailOtherId(
            String email,
            Integer id) {

        return userRepository
                .existsByEmailIgnoreCaseAndIdNot(
                        email,
                        id
                );
    }
}