package domain.question;

import domain.kahoot.Kahoot;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class QuestionChoice extends Question {

    private String options;

    private String choice;
}
