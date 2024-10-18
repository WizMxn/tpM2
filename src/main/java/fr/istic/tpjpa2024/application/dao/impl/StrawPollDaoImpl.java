package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.StrawPollDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.kahoot.StrawPoll;
import fr.istic.tpjpa2024.application.domain.question.Question;

public class StrawPollDaoImpl extends AbstractJpaDao<StrawPoll, Long> implements StrawPollDao {

    public StrawPollDaoImpl(Class<StrawPoll> clazz) {
        super(clazz);
    }

    @Override
    public void addQuestion(Kahoot kahoot, Question question) {
        question.setKahoot(kahoot);
        entityManager.persist(question);
    }
}
