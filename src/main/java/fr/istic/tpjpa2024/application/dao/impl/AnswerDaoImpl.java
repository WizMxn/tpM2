package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.domain.Answer;

public class AnswerDaoImpl extends AbstractJpaDao<Answer, Long> {

    public AnswerDaoImpl() {
        super(Answer.class);
    }
}
