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

    void addQuestion(String idKahoot, String username, Long idQuestion) throws UserException, QuestionException;

    void addQuestion(String idKahoot, String username, List<Long> idQuestions) throws UserException;
}
