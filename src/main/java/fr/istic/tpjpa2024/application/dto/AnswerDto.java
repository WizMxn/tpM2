package fr.istic.tpjpa2024.application.dto;


import lombok.NonNull;

import java.io.Serializable;

/**
 * DTO for {@link fr.istic.tpjpa2024.application.domain.Answer}
 */
public record AnswerDto(@NonNull Long userId, @NonNull Long questionId, String userAnswer,
                        Long id) implements Serializable {

}