package service.exception;

import java.io.Serializable;

public class KahootException extends Throwable implements Serializable {

    private static final long serialVersionUID = 1L;

    private String message;

    public KahootException(String message) {
        this.message = message;
    }
}
