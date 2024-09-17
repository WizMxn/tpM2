package service.impl;

import dao.IKahootDao;
import dao.IQuizDao;
import dao.IStrawPollDao;
import dao.IUserDao;
import domain.User;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.kahoot.StrawPoll;
import domain.question.Question;
import service.IKahootService;
import service.exception.UserException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class KahootServiceImpl implements IKahootService {

    private final IUserDao userDao;
    private final IKahootDao kahootDao;
    private final IQuizDao quizDao;
    private final IStrawPollDao strawPollDao;

    public KahootServiceImpl(IUserDao userDao, IKahootDao kahootDao, IQuizDao quizDao, IStrawPollDao strawPollDao) {
        this.userDao = userDao;
        this.kahootDao = kahootDao;
        this.quizDao = quizDao;
        this.strawPollDao = strawPollDao;
    }

    @Override
    public void createQuiz(String username, String title) throws UserException { //TODO add a name to the quizz maybe ?
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UserException("User not found");
        }
        Quiz quiz = new Quiz();
        quiz.setOwner(user);
        quiz.setTitle(title);
        quiz.setPin(1L);

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


    @Override
    public List<Question> getAllQuestionFromKahoot(Long kahootId) {
        Optional<Kahoot> kahootOptional = Optional.ofNullable(kahootDao.findOne(kahootId));
        kahootOptional.orElseThrow();

        Kahoot kahoot = kahootOptional.get();
        if (kahoot instanceof Quiz) {
            System.out.println("quizz");
            return (List<Question>) ((Quiz) kahoot).getQuestions();
        } else if (kahoot instanceof StrawPoll) {
            System.out.println("straw");
            return (List<Question>) ((StrawPoll) kahoot).getQuestions();
        }

        //TODO verify this
        return new ArrayList<>();
    }

}
