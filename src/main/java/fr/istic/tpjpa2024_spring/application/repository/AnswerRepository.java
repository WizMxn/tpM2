package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AnswerRepository extends JpaRepository<Answer, Long> {

}
