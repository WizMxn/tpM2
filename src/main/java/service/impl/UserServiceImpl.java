package service.impl;

import dao.*;
import domain.User;
import domain.kahoot.Kahoot;
import jakarta.transaction.Transactional;
import service.IUserService;
import service.exception.UserException;

import java.util.Optional;

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

    @Transactional
    @Override
    public void joinKahoot(Long userId, Long kahootPin) {
        //recherche le kahhot en fonction d'un pin
        Optional<User> userOptional = Optional.ofNullable(userDao.findOne(userId));
        userOptional.orElseThrow();

        //recherche de l'utilisateur avec un id
        Optional<Kahoot> kahootOptional = Optional.ofNullable(kahootDao.findKahootByPin(kahootPin));
        kahootOptional.orElseThrow();

        User user = userOptional.get();
        Kahoot kahoot = kahootOptional.get();

        //ajoute le kahoot a l'utilisateur
        user.setJoinedKahoot(kahoot);
        //Ajoute l'utilisateur a la liste du kahoot
        kahoot.addUser(user);

        //save les deux
        kahootDao.save(kahoot);
        userDao.save(user);
    }
}
