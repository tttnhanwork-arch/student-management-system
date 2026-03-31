package com.example.student_mn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class GuestController {
    @GetMapping()
    public String guestpage(){
        return "public/guest";
    }
}
