package dao;

import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.question.Question;

public interface IQuizDao extends IGenericDao<Long, Quiz>{
    void addQuestion(Kahoot kahoot, Question question);

}
