package dao.impl;

import dao.AbstractJpaDao;
import dao.IQuestionTextDao;
import domain.question.QuestionText;

public class QuestionTextDaoImpl extends AbstractJpaDao<Long, QuestionText> implements IQuestionTextDao {

    public QuestionTextDaoImpl() {
        super(QuestionText.class);
    }
}
