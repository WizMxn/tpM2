package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.QuestionDao;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.question.Question;
import jakarta.persistence.Query;

import java.util.List;

public class QuestionDaoImpl extends AbstractJpaDao<Question, Long> implements QuestionDao {

    public QuestionDaoImpl() {
        super(Question.class);
    }

    @Override
    public List<Question> findQuestionsByKahootId(Long kahootId) {
        Query query = entityManager.createQuery(
                "SELECT q FROM Question q WHERE q.kahoot.id = :kahootId",
                Question.class);
        query.setParameter("kahootId", kahootId);
        return query.getResultList();
    }

}

