package fr.istic.tpjpa2024.application.service;

import fr.istic.tpjpa2024.application.domain.question.Question;

import java.util.List;
import java.util.Optional;

public interface QuestionService {

    void addQuestion(Question question);

    Optional<Question> getQuestionById(Long id);

    List<Question> getQuestionsByKahootId(Long kahootId);
}
