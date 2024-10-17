package fr.istic.tpjpa2024.application.service.exception;

import java.io.Serializable;

public class QuestionException extends RuntimeException implements Serializable {

    private static final long serialVersionUID = 1L;

    private String message;

    public QuestionException(String message) {
        this.message = message;
    }
}
