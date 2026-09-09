package vn.iotstar.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin/users")
public class AdminUserController {

    private final UserService
            userService;


    public AdminUserController(
            UserService userService) {

        this.userService =
                userService;
    }


    // =========================================
    // LIST + SEARCH
    // =========================================

    @GetMapping
    public String listUsers(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,
            Model model) {

        List<User> users =
                userService.search(keyword);


        model.addAttribute(
                "users",
                users
        );


        model.addAttribute(
                "keyword",
                keyword
        );


        return "admin/user-list";
    }


    // =========================================
    // SHOW ADD FORM
    // =========================================

    @GetMapping("/add")
    public String showAddForm(
            Model model) {

        User user =
                new User();


        user.setRoleid(2);
        user.setActive(true);


        model.addAttribute(
                "user",
                user
        );


        return "admin/user-add";
    }


    // =========================================
    // ADD USER
    // =========================================

    @PostMapping("/add")
    public String addUser(
            @ModelAttribute("user")
            User user,
            Model model) {

        // Username
        if (user.getUsername() == null
                || user.getUsername()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Username không được để trống"
            );

            return "admin/user-add";
        }


        // Email
        if (user.getEmail() == null
                || user.getEmail()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Email không được để trống"
            );

            return "admin/user-add";
        }


        // Password
        if (user.getPassword() == null
                || user.getPassword()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Password không được để trống"
            );

            return "admin/user-add";
        }


        String username =
                user.getUsername().trim();

        String email =
                user.getEmail().trim();


        // Username trùng
        if (userService.existsUsername(
                username)) {

            model.addAttribute(
                    "error",
                    "Username đã tồn tại"
            );

            return "admin/user-add";
        }


        // Email trùng
        if (userService.existsEmail(
                email)) {

            model.addAttribute(
                    "error",
                    "Email đã tồn tại"
            );

            return "admin/user-add";
        }


        user.setUsername(username);
        user.setEmail(email);


        if (user.getFullname() != null) {

            user.setFullname(
                    user.getFullname().trim()
            );
        }


        if (user.getPhone() != null) {

            user.setPhone(
                    user.getPhone().trim()
            );
        }


        if (user.getRoleid() == null) {
            user.setRoleid(2);
        }


        if (user.getActive() == null) {
            user.setActive(true);
        }


        userService.save(user);


        return "redirect:/admin/users";
    }


    // =========================================
    // SHOW EDIT FORM
    // =========================================

    @GetMapping("/edit/{id}")
    public String showEditForm(
            @PathVariable("id")
            Integer id,
            Model model) {

        User user =
                userService.findById(id);


        if (user == null) {

            return "redirect:/admin/users";
        }


        model.addAttribute(
                "user",
                user
        );


        return "admin/user-edit";
    }


    // =========================================
    // UPDATE USER
    // =========================================

    @PostMapping("/edit")
    public String updateUser(
            @ModelAttribute("user")
            User formUser,
            Model model) {

        if (formUser.getId() == null) {

            return "redirect:/admin/users";
        }


        User user =
                userService.findById(
                        formUser.getId()
                );


        if (user == null) {

            return "redirect:/admin/users";
        }


        // Username
        if (formUser.getUsername() == null
                || formUser
                .getUsername()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Username không được để trống"
            );

            return "admin/user-edit";
        }


        // Email
        if (formUser.getEmail() == null
                || formUser
                .getEmail()
                .isBlank()) {

            model.addAttribute(
                    "error",
                    "Email không được để trống"
            );

            return "admin/user-edit";
        }


        String username =
                formUser
                        .getUsername()
                        .trim();


        String email =
                formUser
                        .getEmail()
                        .trim();


        // Username trùng User khác
        if (userService
                .existsUsernameOtherId(
                        username,
                        user.getId()
                )) {

            model.addAttribute(
                    "error",
                    "Username đã tồn tại"
            );

            return "admin/user-edit";
        }


        // Email trùng User khác
        if (userService
                .existsEmailOtherId(
                        email,
                        user.getId()
                )) {

            model.addAttribute(
                    "error",
                    "Email đã tồn tại"
            );

            return "admin/user-edit";
        }


        user.setUsername(username);

        user.setEmail(email);

        user.setFullname(
                formUser.getFullname()
        );

        user.setPhone(
                formUser.getPhone()
        );

        user.setAvatar(
                formUser.getAvatar()
        );

        user.setRoleid(
                formUser.getRoleid()
        );

        user.setActive(
                formUser.getActive()
        );


        /*
         * Nếu ô password có nhập
         * thì mới thay password.
         *
         * Nếu để trống thì giữ password cũ.
         */
        if (formUser.getPassword() != null
                && !formUser
                .getPassword()
                .isBlank()) {

            user.setPassword(
                    formUser.getPassword()
            );
        }


        userService.save(user);


        return "redirect:/admin/users";
    }


    // =========================================
    // DELETE USER
    // =========================================

    @GetMapping("/delete/{id}")
    public String deleteUser(
            @PathVariable("id")
            Integer id) {

        try {

            userService.deleteById(id);

        } catch (Exception e) {

            return "redirect:/admin/users?deleteError=1";
        }


        return "redirect:/admin/users";
    }
}