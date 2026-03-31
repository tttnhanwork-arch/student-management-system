package com.example.student_mn.controller;

import com.example.student_mn.entity.Parent;
import com.example.student_mn.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/parent")
public class ParentController {
    private ParentService parentService;

    @Autowired
    public ParentController(ParentService parentService) {
        this.parentService = parentService;
    }
@GetMapping()
public String homeParent(){
        return "parent/parent";
}
    @GetMapping("/list")
    public String getAllParent(Model model) {
        List<Parent> parents = parentService.getAllParent();
        model.addAttribute("parents", parents);
        return "parent/parent-list";
    }

    @GetMapping("/create")
    public String create(Model model) {
        Parent parent = new Parent();
        model.addAttribute("parent", parent);
        return "parent/parent-form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("parent") Parent parent) {
        parentService.updateParent(parent);
        return "redirect:/parent/list";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model) {
        Parent parent = parentService.findParentByid(id);
        model.addAttribute("parent", parent);
        return "parent/parent-form";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
    parentService.deleteParentById(id);
    return "redirect:/parent/list";
    }
}
