package domain;

import domain.question.Question;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Answer {

    @ManyToOne
    private User user;

    @ManyToOne
    private Question question;

    private String answer;

    @Id
    @GeneratedValue
    private Long id;
}
