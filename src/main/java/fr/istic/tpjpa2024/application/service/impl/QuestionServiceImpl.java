package fr.istic.tpjpa2024.application.service.impl;

import fr.istic.tpjpa2024.application.dao.impl.QuestionDaoImpl;
import fr.istic.tpjpa2024.application.domain.question.Question;
import fr.istic.tpjpa2024.application.service.QuestionService;

import java.util.List;
import java.util.Optional;

public class QuestionServiceImpl implements QuestionService {

    QuestionDaoImpl questionDao;

    public QuestionServiceImpl(QuestionDaoImpl questionDao) {
        this.questionDao = questionDao;
    }

    @Override
    public void addQuestion(Question question) {
        questionDao.save(question);
    }

    @Override
    public Optional<Question> getQuestionById(Long id) {
        return Optional.ofNullable(questionDao.findOne(id));
    }

    @Override
    public List<Question> getQuestionsByKahootId(Long kahootId) {
        return questionDao.findQuestionsByKahootId(kahootId);
    }
}
