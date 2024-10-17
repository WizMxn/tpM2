package fr.istic.tpjpa2024.application.domain.question;

import fr.istic.tpjpa2024.application.domain.Answer;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
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
    public Long id;

    @ManyToOne
    public Kahoot kahoot;

    public String userQuestion;

    @OneToMany(mappedBy = "question")
    public Collection<Answer> answers;
}
