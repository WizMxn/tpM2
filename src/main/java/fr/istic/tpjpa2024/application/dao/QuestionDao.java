package fr.istic.tpjpa2024.application.dao;

import fr.istic.tpjpa2024.application.domain.question.Question;

import java.util.List;

public interface QuestionDao extends GenericDao<Question, Long> {

    List<Question> findQuestionsByKahootId(Long kahootId);
}
