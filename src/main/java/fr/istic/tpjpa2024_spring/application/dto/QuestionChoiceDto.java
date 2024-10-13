package fr.istic.tpjpa2024_spring.application.dto;

import java.io.Serializable;
import java.util.List;

/**
 * DTO for {@link fr.istic.tpjpa2024_spring.application.domain.question.QuestionChoice}
 */
public record QuestionChoiceDto(Long id, String userQuestion, List<String> options, String goodAnswer) implements Serializable {
  }