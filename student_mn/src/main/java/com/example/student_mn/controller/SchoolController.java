package com.example.student_mn.controller;

import com.example.student_mn.entity.School;
import com.example.student_mn.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/school")
public class SchoolController {
    private SchoolService schoolService;
    @Autowired
    public SchoolController (SchoolService schoolService){
        this.schoolService=schoolService;
    }
    @GetMapping()
    public String homeSchool(){
        return "school/school";
    }
    @GetMapping("/list")
    public String getAllSchool(Model model){
        List<School> schools = schoolService.getAllSchool();
        model.addAttribute("schools", schools);
        return "school/school-list";
    }
    @GetMapping("/create")
    public String create(Model model){
        School school = new School();
        model.addAttribute("school",school);
        return "school/school-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("school") School school){
        schoolService.updateSchool(school);
        return "redirect:/school/list";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
        School school = schoolService.findSchoolById(id);
        model.addAttribute("school", school);
        return "/school/school-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id){
        schoolService.deleteSchoolById(id);
        return "redirect:/school/list";
    }
}
