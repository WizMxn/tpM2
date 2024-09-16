package service.impl;

import dao.IKahootDao;
import dao.impl.QuestionTextDaoImpl;
import dao.impl.QuizDaoImpl;
import dao.impl.StrawPollDaoImpl;
import dao.impl.UserDaoImpl;
import domain.User;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.kahoot.StrawPoll;
import domain.question.Question;
import domain.question.QuestionText;
import service.IUserService;
import service.exception.QuestionException;
import service.exception.UserException;

import java.util.List;

public class UserServiceImpl implements IUserService {

    @Override
    public void createUser(String username) throws UserException {
        UserDaoImpl userDao = new UserDaoImpl();
        if (userDao.findByUsername(username) != null) {
            throw new UserException("Username already used");
        }

        User user = new User();
        user.setUsername(username);

        userDao.save(user);
    }

    @Override
    public void createQuiz(String username) throws UserException {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }
        Quiz quiz = new Quiz();
        quiz.setOwner(user);

        QuizDaoImpl quizDao = new QuizDaoImpl();
        quizDao.save(quiz);
    }

    @Override
    public void createStrawPoll(String username) throws UserException {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }
        StrawPoll strawPoll = new StrawPoll();
        strawPoll.setOwner(user);

        StrawPollDaoImpl strawPollDao = new StrawPollDaoImpl();
        strawPollDao.save(strawPoll);
    }

    @Override
    public void addQuestion(String idKahoot, String username, Long idQuestion) throws UserException, QuestionException {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }


        QuestionTextDaoImpl questionTextDao = new QuestionTextDaoImpl();
        QuestionText questionText = questionTextDao.findOne(idQuestion);
        if (questionText == null) {
            throw new QuestionException("Question not found");
        }




    }

    @Override
    public void addQuestion(String idKahoot, String username, List<Long> idQuestions) throws UserException {
        
    }
}
