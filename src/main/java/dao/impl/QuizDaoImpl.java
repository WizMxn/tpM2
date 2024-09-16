package dao.impl;

import dao.AbstractJpaDao;
import dao.IQuizDao;
import domain.kahoot.Quiz;

public class QuizDaoImpl extends AbstractJpaDao<Long, Quiz> implements IQuizDao {

    public QuizDaoImpl() {
        super(Quiz.class);
    }
}
