package com.example.demo.controller;

import com.example.demo.model.Word;
import com.example.demo.repository.WordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DictionaryController {

    @Autowired
    private WordRepository wordRepository;

    // Redirect root "/" to "/dictionary"
    @GetMapping("/")
    public String redirectRoot() {
        return "redirect:/dictionary";
    }

    // Show dictionary.jsp page
    @GetMapping("/dictionary")
    public String showDictionaryPage(Model model) {
        model.addAttribute("allWords", wordRepository.findAll());
        return "dictionary"; // renders dictionary.jsp
    }

    // Add word
    @PostMapping("/dictionary/add")
    public String addWord(@RequestParam String word,
                          @RequestParam String meaning,
                          Model model) {
        if (!word.isEmpty() && !meaning.isEmpty()) {
            wordRepository.save(new Word(word, meaning));
            model.addAttribute("message", "✅ Word added successfully!");
        } else {
            model.addAttribute("error", "❌ Word and Meaning are required.");
        }

        model.addAttribute("allWords", wordRepository.findAll());
        return "dictionary";
    }

    // Search word
    @PostMapping("/dictionary/search")
    public String searchWord(@RequestParam String word, Model model) {
        Word result = wordRepository.findByWord(word);
        if (result != null) {
            model.addAttribute("wordResult", result);
        } else {
            model.addAttribute("notFound", true);
        }

        model.addAttribute("allWords", wordRepository.findAll());
        return "dictionary";
    }
}
