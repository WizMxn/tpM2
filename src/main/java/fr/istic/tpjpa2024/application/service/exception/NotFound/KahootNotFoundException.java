package fr.istic.tpjpa2024.application.service.exception.NotFound;

public class KahootNotFoundException extends RuntimeException {
    public KahootNotFoundException(Long id) {
        super("Kahoot with ID " + id + " not found.");
    }
}
