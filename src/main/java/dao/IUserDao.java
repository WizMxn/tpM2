package dao;

import domain.User;

public interface IUserDao extends IGenericDao<Long, User>{

    User findByUsername(String username);
}
