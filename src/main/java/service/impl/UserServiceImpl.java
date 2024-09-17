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

    @Override
    public void createQuiz(String username) throws UserException { //TODO add a name to the quizz maybe ?
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }
        Quiz quiz = new Quiz();
        quiz.setOwner(user);

        quizDao.save(quiz);
    }

    @Override
    public void createStrawPoll(String username) throws UserException {
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }
        StrawPoll strawPoll = new StrawPoll();
        strawPoll.setOwner(user);

        strawPollDao.save(strawPoll);
    }

    @Override
    public void addQuestionId(Long idKahoot, String username, Long idQuestion) throws UserException, QuestionException {
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }

        Kahoot kahoot = kahootDao.findOne(idKahoot);
        if (kahoot == null) {
            throw new UserException("Kahoot not found");
        }

        if (!kahoot.getOwner().equals(user)) {
            throw new UserException("Kahoot owner mismatch");
        }

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
    public void addQuestionId(Long idKahoot, String username, List<Long> idQuestions) throws UserException, QuestionException {
        for (Long idQuestion : idQuestions) {
            addQuestionId(idKahoot, username, idQuestion);
        }
    }

    @Override
    public void addQuestion(Long idKahoot, Long userid, List<Question> questions) throws UserException {
        //Find the correct user
        User user = userDao.findOne(userid);
        if (user == null) {
            throw new UserException("User not found");
        }

        //Find the correct kahoot
        Kahoot kahoot = kahootDao.findOne(idKahoot);
        if (kahoot == null) {
            throw new UserException("Kahoot not found");
        }

        if (!kahoot.getOwner().equals(user)) {
            throw new UserException("Kahoot owner mismatch");
        }

        questions.forEach(question -> {
            if (kahoot instanceof Quiz) {
                quizDao.addQuestion(kahoot, question);
            } else if (kahoot instanceof StrawPoll) {
                strawPollDao.addQuestion(kahoot, question);
            }
        });
    }
}
