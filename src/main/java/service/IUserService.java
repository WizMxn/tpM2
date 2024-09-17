package service;

import service.exception.UserException;


public interface IUserService {

    void createUser(String username) throws UserException;

    void joinKahoot(Long userId, Long kahootPin);


}
