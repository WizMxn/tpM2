package service;

import domain.User;
import service.exception.UserException;

import java.util.List;


public interface IUserService {

    void createUser(String username) throws UserException;

    void joinKahoot(Long userId, Long kahootPin);

    List<User> getAll();

}
