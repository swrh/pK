package com.github.swrh.pk.controllers;

import com.github.swrh.pk.entities.User;
import com.github.swrh.pk.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping(UserController.MAPPING_BASE)
public class UserController {
    public static final String MAPPING_BASE = "users";

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/")
    public String showUserList(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return MAPPING_BASE + "/index";
    }

    @GetMapping("/new")
    public String showSignUpForm(User user) {
        return MAPPING_BASE + "/new";
    }

    @PostMapping("/")
    public String addUser(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return MAPPING_BASE + "/new";
        }

        userRepository.save(user);
        return "redirect:/" + MAPPING_BASE + "/";
    }

    @GetMapping("/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        User user = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        model.addAttribute("user", user);
        return MAPPING_BASE + "/edit";
    }

    @PostMapping("/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            user.setId(id);
            return MAPPING_BASE + "/edit";
        }

        userRepository.save(user);

        return "redirect:/" + MAPPING_BASE + "/";
    }

    @GetMapping("/{id}/delete")
    public String deleteUser(@PathVariable("id") long id, Model model) {
        User user = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        userRepository.delete(user);

        return "redirect:/" + MAPPING_BASE + "/";
    }

}
