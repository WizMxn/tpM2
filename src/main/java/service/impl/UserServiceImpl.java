package service.impl;

import dao.IKahootDao;
import dao.impl.*;
import domain.User;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.kahoot.StrawPoll;
import domain.question.Question;
import domain.question.QuestionText;
import service.IUserService;
import service.exception.QuestionException;
import service.exception.UserException;

import java.util.ArrayList;
import java.util.Collection;
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
    public void addQuestion(Long idKahoot, String username, Long idQuestion) throws UserException, QuestionException {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }

        KahootDaoImpl kahootDao = new KahootDaoImpl();
        Kahoot kahoot = kahootDao.findOne(idKahoot);
        if (kahoot == null) {
            throw new UserException("Kahoot not found");
        }

        if (!kahoot.getOwner().equals(user)) {
            throw new UserException("Kahoot owner mismatch");
        }

        QuestionTextDaoImpl questionTextDao = new QuestionTextDaoImpl();
        QuestionText questionText = questionTextDao.findOne(idQuestion);
        if (questionText == null) {
            throw new QuestionException("Question not found");
        }

        questionText.setKahoot(kahoot);
        questionTextDao.save(questionText);

        if (kahoot instanceof Quiz) {
            Quiz quiz = (Quiz) kahoot;
            Collection<Question> questions = quiz.getQuestions();
            if (questions == null) {
                questions = new ArrayList<>();
            }
            questions.add(questionText);
            quiz.setQuestions(questions);
            QuizDaoImpl quizDao = new QuizDaoImpl();
            quizDao.save(quiz);
        } else if (kahoot instanceof StrawPoll) {
            StrawPoll strawPoll = (StrawPoll) kahoot;
            Collection<Question> questions = strawPoll.getQuestions();
            if (questions == null) {
                questions = new ArrayList<>();
            }
            questions.add(questionText);
            strawPoll.setQuestions(questions);

            StrawPollDaoImpl strawPollDao = new StrawPollDaoImpl();
            strawPollDao.save(strawPoll);
        }




    }

    @Override
    public void addQuestion(Long idKahoot, String username, List<Long> idQuestions) throws UserException, QuestionException {
        for (Long idQuestion : idQuestions) {
            addQuestion(idKahoot, username, idQuestion);
        }
    }
}
