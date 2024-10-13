package fr.istic.tpjpa2024_spring.application.service.exception.NotFound;

public class UserNotFoundException extends RuntimeException{
    public UserNotFoundException(Long id) {
        super("User with ID " + id + " not found.");
    }

}
