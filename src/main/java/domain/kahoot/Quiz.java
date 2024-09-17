package domain.kahoot;

import domain.question.Question;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Collection;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
public class Quiz extends Kahoot {

    @OneToMany(mappedBy = "kahoot")
    private Collection<Question> questions;

    public Quiz() {
        super.setType(KahootType.QUIZ);
    }
}
