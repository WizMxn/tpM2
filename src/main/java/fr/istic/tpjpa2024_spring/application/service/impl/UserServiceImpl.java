package fr.istic.tpjpa2024_spring.application.service.impl;

import fr.istic.tpjpa2024_spring.application.domain.User;
import fr.istic.tpjpa2024_spring.application.repository.UserRepository;
import fr.istic.tpjpa2024_spring.application.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public boolean userExists(String username) {
        return userRepository.findByUsername(username) != null;
    }

    @Override
    public void createUser(String username) {
        User user = new User();
        user.setUsername(username);
        userRepository.save(user);
    }

    @Override
    public void joinKahoot(Long userId, Long kahootPin) {
        //TODO improve
        throw new IllegalCallerException();
    }
}
