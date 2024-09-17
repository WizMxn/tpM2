package dao.impl;

import dao.AbstractJpaDao;
import dao.IQuizDao;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.question.Question;

public class QuizDaoImpl extends AbstractJpaDao<Long, Quiz> implements IQuizDao {

    public QuizDaoImpl() {
        super(Quiz.class);
    }

    @Override
    public void addQuestion(Kahoot kahoot, Question question) {
        executeInsideTransaction(manager -> {
            question.setKahoot(kahoot);
            entityManager.persist(question);
        });
    }
}
