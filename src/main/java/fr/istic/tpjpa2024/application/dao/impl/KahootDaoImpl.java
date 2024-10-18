package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.KahootDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import jakarta.persistence.Query;

public class KahootDaoImpl extends AbstractJpaDao<Kahoot, Long> implements KahootDao {

    public KahootDaoImpl() {
        super(Kahoot.class);
    }

    @Override
    public Kahoot findKahootByPin(Long pin) {
        Query mediaQuery = entityManager.createQuery(
                "select e from Kahoot as e WHERE e.pin = :pin",
                Kahoot.class);
        mediaQuery.setParameter("pin", pin);
        return (Kahoot) mediaQuery.getSingleResult();
    }
}
