package com.example.student_mn.controller;

import com.example.student_mn.entity.Subject;
import com.example.student_mn.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {
    private SubjectService subjectService;

    @Autowired
    public SubjectController(SubjectService subjectService) {
        this.subjectService = subjectService;
    }
@GetMapping()
public String homeSubject(){
        return "subject/subject";
}
    @GetMapping("/list")
    public String getAllSubject(Model model){
        List<Subject> subjects = subjectService.getAllSubject();
        model.addAttribute("subjects", subjects);
        return "subject/subject-list";
    }
    @GetMapping("/create")
    public String create(Model model){
        Subject subject= new Subject();
        model.addAttribute("subject", subject);
        return "subject/subject-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("subject") Subject subject){
        subjectService.updateSubject(subject);
        return "redirect:/subject/list";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
        Subject subject = subjectService.findSubjectById(id);
        model.addAttribute("subject", subject);
        return "subject/subject-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        subjectService.deleteSubjectById(id);
        return "redirect:/subject/list";
    }
}
