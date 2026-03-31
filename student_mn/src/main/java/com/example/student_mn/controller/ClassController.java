package com.example.student_mn.controller;

import com.example.student_mn.entity.Class;
import com.example.student_mn.entity.School;
import com.example.student_mn.service.ClassService;
import com.example.student_mn.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/class")
public class ClassController {
    private ClassService classService;
    private SchoolService schoolService;
@Autowired
    public ClassController(ClassService classService, SchoolService schoolService) {
        this.classService = classService;
        this.schoolService = schoolService;
    }
    @GetMapping()
    public String homeClass(){
    return "class/class";
    }
    @GetMapping("/list")
    public String getAllClass(Model model){
        List<Class> classes = classService.getAllClass();
        model.addAttribute("classes",classes);
        return "class/class-list";
    }
    @GetMapping("/create")
    public String create(Model model){
        Class aclass = new Class();
        model.addAttribute("class", aclass);
        List<School> schools = schoolService.getAllSchool();
        model.addAttribute("schools", schools);
    return "class/class-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("class") Class aclass, @RequestParam("id_school") Integer id_school){
    School school = schoolService.findSchoolById(id_school);
    aclass.setSchool(school);
        classService.updateClass(aclass);
        return "redirect:/class/list";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
    Class aclass = classService.findClassById(id);
    model.addAttribute(aclass);
    return "class/class-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id){
    classService.deleteClassById(id);
    return "redirect:/class/list";
    }
}
