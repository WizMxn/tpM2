package service;

import service.exception.UserException;

import java.util.List;

public interface IUserService {

    void createUser(String username) throws UserException;

}
