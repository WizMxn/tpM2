package dao;

import domain.User;

public interface IUserDao {

    User findByUsername(String username);
}
