package fr.istic.tpjpa2024.application.dao;

import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.kahoot.StrawPoll;
import fr.istic.tpjpa2024.application.domain.question.Question;

public interface StrawPollDao extends GenericDao<StrawPoll, Long> {
    void addQuestion(Kahoot kahoot, Question question);
}
