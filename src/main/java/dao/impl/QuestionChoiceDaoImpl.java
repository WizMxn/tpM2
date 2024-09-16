package dao.impl;

import dao.AbstractJpaDao;
import dao.IQuestionChoiceDao;
import dao.IQuestionTextDao;
import domain.question.QuestionChoice;
import domain.question.QuestionText;

public class QuestionChoiceDaoImpl extends AbstractJpaDao<Long, QuestionChoice> implements IQuestionChoiceDao {

    public QuestionChoiceDaoImpl() {
        super(QuestionChoice.class);
    }
}
