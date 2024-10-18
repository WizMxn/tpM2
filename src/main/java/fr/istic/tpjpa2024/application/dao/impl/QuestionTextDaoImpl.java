package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.QuestionTextDao;
import fr.istic.tpjpa2024.application.domain.question.QuestionText;

public class QuestionTextDaoImpl extends AbstractJpaDao<QuestionText, Long> implements QuestionTextDao {

    public QuestionTextDaoImpl(Class<QuestionText> clazz) {
        super(clazz);
    }
}
