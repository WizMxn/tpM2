package fr.istic.tpjpa2024.application.dao;

import fr.istic.tpjpa2024.application.domain.User;

import java.util.Optional;

public interface UserDao extends GenericDao<User, Long> {

    Optional<User> findByUsername(String username);
}
