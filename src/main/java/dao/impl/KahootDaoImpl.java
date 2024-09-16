package dao.impl;

import dao.AbstractJpaDao;
import dao.IKahootDao;
import domain.kahoot.Kahoot;

public class KahootDaoImpl extends AbstractJpaDao<Long, Kahoot> implements IKahootDao {

    public KahootDaoImpl() {
        super(Kahoot.class);
    }
}
