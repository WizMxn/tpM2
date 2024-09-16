package service.exception;

import java.io.Serializable;

public class QuestionException extends Throwable implements Serializable {

    private static final long serialVersionUID = 1L;

    private String message;

    public QuestionException(String message) {
        this.message = message;
    }
}
