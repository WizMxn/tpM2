package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.question.QuestionText;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionTextRepository extends JpaRepository<QuestionText, Long> {
}
