package fr.istic.tpjpa2024_spring.application.domain;

import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode
public class User {

    @Id
    @GeneratedValue
    private Long id;

    private String username;

    @ManyToOne
    private Kahoot joinedKahoot;

    @OneToMany(mappedBy = "owner")
    private Collection<Kahoot> ownedKahoot;

    @OneToMany(mappedBy = "user")
    private Collection<Answer> answers;

}
