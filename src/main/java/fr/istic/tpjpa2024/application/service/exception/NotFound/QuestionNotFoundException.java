package fr.istic.tpjpa2024.application.service.exception.NotFound;

public class QuestionNotFoundException extends RuntimeException {
    public QuestionNotFoundException(Long id) {
        super("Question with ID " + id + " not found.");
    }
}
