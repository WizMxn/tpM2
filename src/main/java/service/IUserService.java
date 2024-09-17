package service;

import domain.User;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.kahoot.StrawPoll;
import domain.question.Question;
import service.exception.QuestionException;
import service.exception.UserException;

import java.util.List;

public interface IUserService {

    void createUser(String username) throws UserException;

    void createQuiz(String username) throws UserException;

    void createStrawPoll(String username) throws UserException;

    void addQuestionId(Long idKahoot, String username, Long idQuestion) throws UserException, QuestionException;

    void addQuestionId(Long idKahoot, String username, List<Long> idQuestions) throws UserException, QuestionException;

    void addQuestion(Long idKahoot, Long userid, List<Question> questions) throws UserException;
}
