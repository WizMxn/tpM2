package domain.question;

import domain.kahoot.Kahoot;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class QuestionChoice extends Question {

    private String options;

    private String answers;
}
