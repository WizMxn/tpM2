package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KahootRepository extends JpaRepository<Kahoot, Long> {
}
