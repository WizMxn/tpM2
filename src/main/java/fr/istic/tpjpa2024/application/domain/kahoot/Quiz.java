package fr.istic.tpjpa2024.application.domain.kahoot;

import fr.istic.tpjpa2024.application.domain.question.Question;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;

@Entity
@Getter
@Setter
public class Quiz extends Kahoot {

    @OneToMany(mappedBy = "kahoot", cascade = {CascadeType.REMOVE})
    public Collection<Question> questions;
}
