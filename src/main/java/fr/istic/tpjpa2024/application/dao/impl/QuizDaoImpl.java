package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Quiz;

public class QuizDaoImpl extends AbstractJpaDao<Quiz, Long> {

    public QuizDaoImpl(Class<Quiz> clazz) {
        super(clazz);
    }
}
