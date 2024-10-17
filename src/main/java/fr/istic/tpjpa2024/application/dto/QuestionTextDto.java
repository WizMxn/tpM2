package fr.istic.tpjpa2024.application.dto;

import java.io.Serializable;

/**
 * DTO for {@link fr.istic.tpjpa2024.application.domain.question.QuestionText}
 */
public record QuestionTextDto(Long id, Long kahootId, String question) implements Serializable {
}