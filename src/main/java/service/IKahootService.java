package service;

import domain.question.Question;
import service.exception.UserException;

import java.util.List;

public interface IKahootService {

    void createQuiz(String username, String title) throws UserException;

    void createStrawPoll(String username) throws UserException;

    void addQuestion(Long idKahoot, Long userid, List<Question> questions) throws UserException;

    void joinKahoot(Long userId, Long kahootPin);

    List<Question> getAllQuestionFromKahoot(Long kahootid);

}
