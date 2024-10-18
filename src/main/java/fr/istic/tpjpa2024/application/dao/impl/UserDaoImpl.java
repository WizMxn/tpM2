package fr.istic.tpjpa2024.application.dao.impl;

import fr.istic.tpjpa2024.application.dao.AbstractJpaDao;
import fr.istic.tpjpa2024.application.dao.UserDao;
import fr.istic.tpjpa2024.application.domain.User;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.Optional;

public class UserDaoImpl extends AbstractJpaDao<User, Long> implements UserDao {

    public UserDaoImpl() {
        super(User.class);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        TypedQuery<User> query = entityManager.createQuery(
                "select e from User e where e.username like :username",
                User.class);
        query.setParameter("username", username);
        User result = null;
        try {
            result = query.getSingleResult();
        } catch (NoResultException ignored) {
        }
        return Optional.ofNullable(result);
    }

}
