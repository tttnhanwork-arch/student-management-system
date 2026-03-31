package com.example.student_mn.controller;

import com.example.student_mn.entity.ReportCard;
import com.example.student_mn.service.ReportCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reportcard")
public class ReportCardController {
    private ReportCartService reportCartService;
@Autowired
    public ReportCardController(ReportCartService reportCartService) {
        this.reportCartService = reportCartService;
    }
    @GetMapping()
    public String homeCard(){
    return "reportcard/reportcard";
    }
    @GetMapping("/list")
 public String getAllCard(Model model){
    List<ReportCard> reportCards = reportCartService.getAllRC();
    model.addAttribute("reportcards", reportCards);
    return "reportcard/reportcard-list";
    }
    @GetMapping("/create")
    public String create(Model model){
    ReportCard reportCard = new ReportCard();
    model.addAttribute("reportcard", reportCard);
    return "reportcard/reportcard-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("reportcard") ReportCard reportCard){
        reportCartService.updateRC(reportCard);
        return "redirect:/reportcard/list";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
        ReportCard reportCard = reportCartService.findRCById(id);
        model.addAttribute("reportcard", reportCard);
        return "reportcard/reportcard-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        reportCartService.deleteRCById(id);
        return "redirect:/reportcard/list";
    }
}
