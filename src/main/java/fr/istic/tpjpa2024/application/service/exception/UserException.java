package fr.istic.tpjpa2024.application.service.exception;

import java.io.Serializable;

public class UserException extends Throwable implements Serializable {

    private static final long serialVersionUID = 1L;

    private String message;

    public UserException(String message) {
        this.message = message;
    }
}
