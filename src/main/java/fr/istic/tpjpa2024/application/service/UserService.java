package fr.istic.tpjpa2024.application.service;

import fr.istic.tpjpa2024.application.domain.User;

import java.util.Optional;


public interface UserService {

    Optional<User> findById(Long id);

    boolean userExists(String username);

    void createUser(String username); //TODO: Use UserDto

    void joinKahoot(Long userId, Long kahootPin);

}
