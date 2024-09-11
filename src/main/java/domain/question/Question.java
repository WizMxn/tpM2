package domain.question;

import domain.Answer;
import domain.kahoot.Kahoot;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public abstract class Question {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private Kahoot kahoot;

    private String question;

    @OneToMany(mappedBy = "question")
    private Collection<Answer> answers;
}
