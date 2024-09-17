package dao.impl;

import dao.AbstractJpaDao;
import dao.IStrawPollDao;
import domain.kahoot.Kahoot;
import domain.kahoot.StrawPoll;
import domain.question.Question;

public class StrawPollDaoImpl extends AbstractJpaDao<Long, StrawPoll> implements IStrawPollDao {

    public StrawPollDaoImpl() {
        super(StrawPoll.class);
    }

    @Override
    public void addQuestion(Kahoot kahoot, Question question) {
        question.setKahoot(kahoot);
        entityManager.persist(question);
    }
}
