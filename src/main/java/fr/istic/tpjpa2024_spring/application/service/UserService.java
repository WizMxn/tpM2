package fr.istic.tpjpa2024_spring.application.service;

import fr.istic.tpjpa2024_spring.application.domain.User;
import fr.istic.tpjpa2024_spring.application.dto.AnswerDto;

import java.util.Optional;


public interface UserService {

    Optional<User> findById(Long id);

    boolean userExists(String username);

    void createUser(String username); //TODO: Use UserDto

    void joinKahoot(Long userId, Long kahootPin);

}
