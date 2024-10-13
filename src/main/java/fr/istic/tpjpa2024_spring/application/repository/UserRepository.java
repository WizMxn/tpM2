package fr.istic.tpjpa2024_spring.application.repository;

import fr.istic.tpjpa2024_spring.application.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
