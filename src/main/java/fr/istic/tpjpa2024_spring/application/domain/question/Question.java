package fr.istic.tpjpa2024_spring.application.domain.question;

import fr.istic.tpjpa2024_spring.application.domain.Answer;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Collection;

@Entity
@Getter
@Setter
@NoArgsConstructor
public abstract class Question {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private Kahoot kahoot;

    private String userQuestion;

    @OneToMany(mappedBy = "question")
    private Collection<Answer> answers;
}
