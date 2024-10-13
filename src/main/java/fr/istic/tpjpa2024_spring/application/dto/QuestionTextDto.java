package fr.istic.tpjpa2024_spring.application.dto;

import java.io.Serializable;

/**
 * DTO for {@link fr.istic.tpjpa2024_spring.application.domain.question.QuestionText}
 */
public record QuestionTextDto(Long id, Long kahootId, String question) implements Serializable {
}