package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;

public class KahootDaoImpl extends AbstractJpaDao<Kahoot, Long> {

    public KahootDaoImpl() {
        super(Kahoot.class);
    }
}
