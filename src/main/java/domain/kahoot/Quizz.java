package domain.kahoot;

import domain.question.Question;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Entity
@Data
@NoArgsConstructor
public class Quizz extends Kahoot {

    @OneToMany(mappedBy = "question")
    private Collection<Question> questions;
}
