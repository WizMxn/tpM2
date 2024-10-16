package fr.istic.tpjpa2024_spring.application.service.exception.NotFound;

public class AnswerNotFoundException extends RuntimeException {
    public AnswerNotFoundException(Long id) {
        super("Answer with ID " + id + " not found.");
    }

}
