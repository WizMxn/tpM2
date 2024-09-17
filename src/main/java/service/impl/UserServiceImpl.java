package service.impl;

import dao.*;
import dao.impl.QuizDaoImpl;
import dao.impl.StrawPollDaoImpl;
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

    private final IUserDao userDao;
    private final IQuizDao quizDao;
    private final IStrawPollDao strawPollDao;
    private final IKahootDao kahootDao;
    private final IQuestionTextDao questionTextDao;
    private final IQuestionChoiceDao questionChoiceDao;

    public UserServiceImpl(IUserDao userDao, IQuizDao quizDao, IStrawPollDao strawPollDao, IKahootDao kahootDao, IQuestionTextDao questionTextDao, IQuestionChoiceDao questionChoiceDao) {
        this.userDao = userDao;
        this.quizDao = quizDao;
        this.strawPollDao = strawPollDao;
        this.kahootDao = kahootDao;
        this.questionTextDao = questionTextDao;
        this.questionChoiceDao = questionChoiceDao;
    }

    @Override
    public void createUser(String username) throws UserException {
        if (userDao.findByUsername(username) != null) {
            throw new UserException("Username already used");
        }

        User user = new User();
        user.setUsername(username);

        userDao.save(user);
    }

}
