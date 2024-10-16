package fr.istic.tpjpa2024_spring.application.service.exception;

import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.AnswerNotFoundException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.KahootNotFoundException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.QuestionNotFoundException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.UserNotFoundException;
import io.swagger.v3.oas.annotations.Hidden;
import jakarta.validation.ValidationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@Hidden
@RestControllerAdvice
public class CustomExceptionHandler extends ResponseEntityExceptionHandler {

    // Gestion des NotFoundException avec un statut 404
    @ExceptionHandler({KahootNotFoundException.class, AnswerNotFoundException.class, QuestionNotFoundException.class, UserNotFoundException.class})
    protected ResponseEntity<Object> handleNotFound(Exception ex, WebRequest request) {
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("error", "Not Found");
        responseBody.put("message", "Ressource non trouvée");

        return handleExceptionInternal(ex, responseBody, new HttpHeaders(), HttpStatus.NOT_FOUND, request);
    }

    // Gestion des IllegalIdOnCreateException avec un statut 400 (Bad Request)
    @ExceptionHandler({IllegalIdOnCreateException.class})
    protected ResponseEntity<Object> handleIllegalIdOnCreateException(Exception ex, WebRequest request) {
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("error", "Bad Request");
        responseBody.put("message", "Entity id must not be provided when creating a new one.");

        return handleExceptionInternal(ex, responseBody,
                new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
    }

    // Gestion des ValidationException avec un statut 400 (Bad Request)
    @ExceptionHandler({ValidationException.class})
    protected ResponseEntity<Object> handleValidationException(Exception ex, WebRequest request) {
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("error", "Bad Request");
        responseBody.put("message", "Erreur de validation");

        return handleExceptionInternal(ex, "Erreur de validation: " + ex.getMessage(), new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
    }

    @ExceptionHandler({IllegalArgumentException.class})
    protected ResponseEntity<Object> handleIllegalArgumentException(Exception ex, WebRequest request) {
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("error", "Bad Request");
        responseBody.put("message", "illegalArgumentException:: " + ex.getMessage());
        return handleExceptionInternal(ex, responseBody, new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
    }
}
