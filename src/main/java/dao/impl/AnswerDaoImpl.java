package dao.impl;

import dao.AbstractJpaDao;
import dao.AnswerDao;
import domain.Answer;

public class AnswerDaoImpl extends AbstractJpaDao<Long, Answer> implements AnswerDao {

    public AnswerDaoImpl() {
        super(Answer.class);
    }
}
