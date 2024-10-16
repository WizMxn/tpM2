package fr.istic.tpjpa2024_spring.application.dto;

import org.springframework.lang.NonNull;

import java.io.Serializable;

/**
 * DTO for {@link fr.istic.tpjpa2024_spring.application.domain.Answer}
 */
public record AnswerDto(@NonNull Long userId,@NonNull Long questionId, String userAnswer, Long id) implements Serializable {

}