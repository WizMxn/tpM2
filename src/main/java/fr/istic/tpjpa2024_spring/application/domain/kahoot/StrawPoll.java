package fr.istic.tpjpa2024_spring.application.domain.kahoot;

import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;

@Entity
@Getter
@Setter
public class StrawPoll extends Kahoot {

    @OneToMany(mappedBy = "kahoot", cascade = {CascadeType.REMOVE}) //TODO vérifier tout
    private Collection<Question> questions;
}
