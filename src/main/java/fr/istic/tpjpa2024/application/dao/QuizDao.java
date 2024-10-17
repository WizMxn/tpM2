package fr.istic.tpjpa2024.application.dao;

import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024.application.domain.question.Question;

public interface QuizDao extends GenericDao<Quiz, Long> {
    void addQuestion(Kahoot kahoot, Question question);

}
