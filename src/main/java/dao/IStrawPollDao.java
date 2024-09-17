package dao;

import domain.kahoot.Kahoot;
import domain.kahoot.StrawPoll;
import domain.question.Question;

public interface IStrawPollDao extends IGenericDao<Long, StrawPoll> {
    void addQuestion(Kahoot kahoot, Question question);
}
