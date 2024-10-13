package fr.istic.tpjpa2024_spring.application.service;

import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.service.exception.UserException;

import java.util.List;
import java.util.Optional;

public interface QuestionService {

    void addQuestion(Question question);

    Optional<Question> getQuestionById(Long id);

    List<Question> getQuestionsByKahootId(Long kahootId);
}
