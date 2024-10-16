package fr.istic.tpjpa2024_spring.application.controller;

import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.domain.question.QuestionChoice;
import fr.istic.tpjpa2024_spring.application.domain.question.QuestionText;
import fr.istic.tpjpa2024_spring.application.dto.QuestionChoiceDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionListDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionTextDto;
import fr.istic.tpjpa2024_spring.application.mapper.KahootMapper;
import fr.istic.tpjpa2024_spring.application.mapper.QuestionMapper;
import fr.istic.tpjpa2024_spring.application.service.KahootService;
import fr.istic.tpjpa2024_spring.application.service.QuestionService;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/api/questions")
public class QuestionController {

    QuestionService questionService;
    KahootService kahootService;
    QuestionMapper questionMapper;

    private final KahootMapper kahootMapper;

    public QuestionController(QuestionService questionService,
                              KahootService kahootService,
                              QuestionMapper questionMapper, KahootMapper kahootMapper) {
        this.questionService = questionService;
        this.kahootService = kahootService;
        this.questionMapper = questionMapper;
        this.kahootMapper = kahootMapper;
    }

    @GetMapping("/{kahootId}")
    public QuestionListDto getQuestions(@PathVariable Long kahootId) {
        List<Question> questions = questionService.getQuestionsByKahootId(kahootId);
        List<QuestionDto> questionsDto = new ArrayList<>();
        for (Question question : questions) {
            questionsDto.add(questionMapper.toDto(question));
        }
        return new QuestionListDto(questionsDto);
    }

    @PostMapping("/createQuestionText/{kahootId}")
    public ResponseEntity<String> createQuestionText(
            @RequestBody @Validated QuestionTextDto questionTextDto,
            @PathVariable Long kahootId) {
        QuestionText questionText = questionMapper.toEntity(questionTextDto);
        Kahoot kahoot = kahootMapper.toEntity(kahootService.findKahootById(kahootId));
        questionText.setKahoot(kahoot);
        questionService.addQuestion(questionText);
        return ResponseEntity.ok(questionTextDto.toString());
    }

    @PostMapping("/createQuestionChoice/{kahootId}")
    public ResponseEntity<String> createQuestionChoice(
            @RequestBody @Validated QuestionChoiceDto questionChoiceDto,
            @PathVariable Long kahootId) {
        QuestionChoice questionChoice = questionMapper.toEntity(questionChoiceDto);
        Kahoot kahoot = kahootMapper.toEntity(kahootService.findKahootById(kahootId));
        questionChoice.setKahoot(kahoot);
        questionService.addQuestion(questionChoice);
        return ResponseEntity.ok(questionChoiceDto.toString());
    }
}
