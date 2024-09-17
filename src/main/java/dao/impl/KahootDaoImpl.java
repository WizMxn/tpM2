package dao.impl;

import dao.AbstractJpaDao;
import dao.IKahootDao;
import domain.kahoot.Kahoot;
import domain.question.Question;
import jakarta.persistence.Query;

import java.util.List;

public class KahootDaoImpl extends AbstractJpaDao<Long, Kahoot> implements IKahootDao {

    public KahootDaoImpl() {
        super(Kahoot.class);
    }

    @Override
    public Kahoot findKahootByPin(Long pin) {
        Query mediaQuery = entityManager.createQuery("select e from " + Kahoot.class.getName() + " as e WHERE e.pin = :pin", Kahoot.class);
        mediaQuery.setParameter("pin", pin);
        return (Kahoot) mediaQuery.getSingleResult();
    }
}
