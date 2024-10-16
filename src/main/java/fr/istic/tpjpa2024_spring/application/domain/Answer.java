package fr.istic.tpjpa2024_spring.application.domain;

import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
public class Answer implements Serializable {

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private User user;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Question question;

    private String userAnswer;

    @Id
    @GeneratedValue
    private Long id;
}
