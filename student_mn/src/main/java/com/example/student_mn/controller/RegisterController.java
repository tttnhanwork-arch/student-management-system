package com.example.student_mn.controller;

import com.example.student_mn.WebEntity.RegisterUser;
import com.example.student_mn.dao.AuthorityRepository;
import com.example.student_mn.entity.Authority;
import com.example.student_mn.entity.User;
import com.example.student_mn.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/register")
public class RegisterController {
    private UserService userService;
   private AuthorityRepository authorityRepository;
@Autowired
    public RegisterController(UserService userService, AuthorityRepository authorityRepository) {
        this.userService = userService;
        this.authorityRepository=authorityRepository;
    }

    @GetMapping("/showRegisterForm")
    public String showRegisterForm(Model model){
        RegisterUser re = new RegisterUser();
        model.addAttribute("registerUser",re);
        return "register/form";
    }
    @InitBinder
    public void initBinder(DataBinder dataBinder){
        StringTrimmerEditor stringTrimmerEditor= new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }
    @PostMapping("/process")
    public String process(@Valid @ModelAttribute RegisterUser registerUser,
                          BindingResult result,
                          Model model,
                          HttpSession session)
    {
        String username = registerUser.getUsername();
        // form validation
        if (result.hasErrors())
        return "register/form";
        // Kiểm tra user tồn tại
        User userExist = userService.findByUsername(username);
        if (userExist!=null){
            model.addAttribute("registerUser", new RegisterUser());
            model.addAttribute("my_error", "Tài khoản đã tồn tại");
            return "register/form";
        }
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
       User user = new User();
       user.setUsername(registerUser.getUsername());
        user.setPassword(bCryptPasswordEncoder.encode(registerUser.getPassword()));
        user.setEnabled(true);
        user.setLastName(registerUser.getLastName());
        user.setFirstName(registerUser.getFirstName());
        user.setEmail(registerUser.getEmail());
        Set<Authority> authorities = new HashSet<>();
        Authority authority = authorityRepository.findByName("ROLE_USER");
       authorities.add(authority);
       user.setAuthority(authorities);
        userService.saveUser(user);
        session.setAttribute("myuser", user);
        return "register/confirmation";
    }
}
