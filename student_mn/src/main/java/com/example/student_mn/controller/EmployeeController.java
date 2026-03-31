package com.example.student_mn.controller;

import com.example.student_mn.entity.Employee;
import com.example.student_mn.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    private EmployeeService employeeService;
@Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }
    @GetMapping()
    public String homeEmployee(){
    return "employee/employee";
    }
    @GetMapping("/list")
    public String getAllEmployee(Model model) {
    List<Employee> employees = employeeService.getAllEmployee();
    model.addAttribute("employees", employees);
    return "employee/employee-list";
    }
    @GetMapping("/create")
    public String create(Model model){
    Employee employee = new Employee();
    model.addAttribute("employee", employee);
    return "employee/employee-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("employee") Employee employee){
    employeeService.updateEmployee(employee);
    return "redirect:/employee/list";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
    Employee employee = employeeService.findEmployeeById(id);
    model.addAttribute(employee);
    return "employee/employee-form";
    }
    @GetMapping("/delete")
    public  String delete(@RequestParam("id") Integer id){
    employeeService.deleteEmployeeById(id);
    return "redirect:/employee/list";
    }


}
