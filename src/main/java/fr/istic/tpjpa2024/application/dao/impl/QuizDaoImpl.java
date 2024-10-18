package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.QuizDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024.application.domain.question.Question;
import jakarta.persistence.Query;

import java.util.List;

public class QuizDaoImpl extends AbstractJpaDao<Quiz, Long> implements QuizDao {

    public QuizDaoImpl(Class<Quiz> clazz) {
        super(clazz);
    }

    @Override
    public void addQuestion(Kahoot kahoot, Question question) {
        question.setKahoot(kahoot);
        entityManager.persist(question);
    }
}
