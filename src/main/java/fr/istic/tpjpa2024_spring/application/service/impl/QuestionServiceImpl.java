package fr.istic.tpjpa2024_spring.application.service.impl;

import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.repository.QuestionRepository;
import fr.istic.tpjpa2024_spring.application.service.QuestionService;
import fr.istic.tpjpa2024_spring.application.service.exception.UserException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionServiceImpl implements QuestionService {

    QuestionRepository questionRepository;

    public QuestionServiceImpl(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @Override
    public void addQuestion(Question question) {
        questionRepository.save(question);
    }

    @Override
    public Optional<Question> getQuestionById(Long id) {
        return questionRepository.findById(id);
    }

    @Override
    public List<Question> getQuestionsByKahootId(Long kahootId) {
        return questionRepository.findQuestionsByKahootId(kahootId);
    }
}
