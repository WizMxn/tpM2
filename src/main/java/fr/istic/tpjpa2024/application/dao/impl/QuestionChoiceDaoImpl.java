package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.QuestionChoiceDao;
import fr.istic.tpjpa2024.application.domain.question.QuestionChoice;

public class QuestionChoiceDaoImpl extends AbstractJpaDao<QuestionChoice, Long> implements QuestionChoiceDao {

    public QuestionChoiceDaoImpl(Class<QuestionChoice> clazz) {
        super(clazz);
    }
}
