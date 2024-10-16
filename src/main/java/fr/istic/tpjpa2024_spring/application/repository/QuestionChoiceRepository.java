package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.question.QuestionChoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionChoiceRepository extends JpaRepository<QuestionChoice, Long> {
}
