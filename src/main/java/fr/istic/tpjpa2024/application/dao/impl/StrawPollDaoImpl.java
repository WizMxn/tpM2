package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.domain.kahoot.StrawPoll;

public class StrawPollDaoImpl extends AbstractJpaDao<StrawPoll, Long> {

    public StrawPollDaoImpl(Class<StrawPoll> clazz) {
        super(clazz);
    }
}
