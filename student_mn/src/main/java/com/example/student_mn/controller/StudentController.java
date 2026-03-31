package com.example.student_mn.controller;

import com.example.student_mn.entity.Student;
import com.example.student_mn.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    private StudentService studentService;
@Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }
    @GetMapping()
    public String homeStudent(){
    return "student/student";
    }
    @GetMapping("/list")
    public String getAllStudent(Model model){
        List<Student> students = studentService.getAllStudent();
        model.addAttribute("students", students);
        return "student/student-list";
    }
    @GetMapping("/create")
    public String create(Model model){
    Student student= new Student();
    model.addAttribute("student", student);
    return "student/student-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("student") Student student){
    studentService.updateStudent(student);
    return "redirect:/student/list";
    }

    @GetMapping("/{id}")
    public String findStudentById(@PathVariable int id, Model model){
        Student student = studentService.findStudentById(id);
        model.addAttribute("student", student);
        return "student/student-id";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
    Student student = studentService.findStudentById(id);
    model.addAttribute("student", student);
    return "student/student-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        studentService.deleteStudentById(id);
        return "redirect:/student/list";
    }
}
