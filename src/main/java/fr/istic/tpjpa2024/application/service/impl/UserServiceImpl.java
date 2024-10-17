package fr.istic.tpjpa2024.application.service.impl;

import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.domain.User;
import fr.istic.tpjpa2024.application.service.UserService;

import java.util.Optional;

public class UserServiceImpl implements UserService {

    UserDaoImpl userDao;

    public UserServiceImpl(UserDaoImpl userDao) {
        this.userDao = userDao;
    }


    @Override
    public Optional<User> findById(Long id) {
        return Optional.ofNullable(userDao.findOne(id));
    }

    @Override
    public boolean userExists(String username) {
        return Optional.ofNullable(userDao.findByUsername(username)).isPresent();
    }

    @Override
    public void createUser(String username) {
        User user = new User();
        user.setUsername(username);
        userDao.save(user);
    }

    @Override
    public void joinKahoot(Long userId, Long kahootPin) {
        //TODO improve
        throw new IllegalCallerException();
    }
}
