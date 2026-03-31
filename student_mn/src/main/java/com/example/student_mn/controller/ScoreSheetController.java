package com.example.student_mn.controller;

import com.example.student_mn.entity.ScoreSheet;
import com.example.student_mn.service.ScoreSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/scoresheet")
public class ScoreSheetController {
    private ScoreSheetService scoreSheetService;
    @Autowired
    public ScoreSheetController(ScoreSheetService scoreSheetService){
        this.scoreSheetService=scoreSheetService;
    }
    @GetMapping()
    public String homeScoreSheet(){
        return "scoresheet/scoresheet";
    }
    @GetMapping("/list")
    public String getAllScoreSheet(Model model) {
        List<ScoreSheet> scoreSheets = scoreSheetService.getAllScoreSheet();
        model.addAttribute("scoresheets", scoreSheets);
        return "scoresheet/scoresheet-list";
    }
    @GetMapping("/create")
    public String create(Model model){
        ScoreSheet scoreSheet= new ScoreSheet();
        model.addAttribute("scoresheet", scoreSheet);
        return "scoresheet/scoresheet-form";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute("scoresheet") ScoreSheet scoreSheet){
        scoreSheetService.updateScoreSheet(scoreSheet);
        return "redirect:/scoresheet/list";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Integer id, Model model){
        ScoreSheet scoreSheet = scoreSheetService.findScoreSheetById(id);
        model.addAttribute("scoresheet", scoreSheet);
        return "scoresheet/scoresheet-form";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id, Model model){
        scoreSheetService.deleteScoreSheetById(id);
        return "redirect:/scoresheet/list";
    }
}
