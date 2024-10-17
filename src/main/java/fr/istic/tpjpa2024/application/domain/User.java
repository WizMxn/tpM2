package fr.istic.tpjpa2024.application.domain;

import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
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
    public Long id;

    public String username;

    @ManyToOne
    public Kahoot joinedKahoot;

    @OneToMany(mappedBy = "owner")
    public Collection<Kahoot> ownedKahoot;

    @OneToMany(mappedBy = "user")
    public Collection<Answer> answers;

}
