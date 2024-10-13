package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.kahoot.StrawPoll;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StrawPollRepository extends JpaRepository<StrawPoll, Long> {
}
