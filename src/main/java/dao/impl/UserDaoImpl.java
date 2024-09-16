package dao.impl;

import dao.AbstractJpaDao;
import dao.IUserDao;
import domain.User;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class UserDaoImpl extends AbstractJpaDao<Long, User> implements IUserDao {

    public UserDaoImpl() {
        super(User.class);
    }

    @Override
    public User findByUsername(String username) {
        TypedQuery<User> query = entityManager.createQuery(
                "select e from " + User.class.getName() +
                " e where e.username like :username",
                User.class);
        query.setParameter("username", username);
        User result = null;
        try {
            result = query.getSingleResult();
        } catch (NoResultException ignored) {}
        return result;
    }
}
