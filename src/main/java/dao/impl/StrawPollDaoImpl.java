package dao.impl;

import dao.AbstractJpaDao;
import dao.IStrawPollDao;
import domain.kahoot.StrawPoll;

public class StrawPollDaoImpl extends AbstractJpaDao<Long, StrawPoll> implements IStrawPollDao {

    public StrawPollDaoImpl() {
        super(StrawPoll.class);
    }
}
