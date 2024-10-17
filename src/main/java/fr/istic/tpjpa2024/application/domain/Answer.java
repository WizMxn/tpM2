package fr.istic.tpjpa2024.application.domain;

import fr.istic.tpjpa2024.application.domain.question.Question;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
public class Answer implements Serializable {

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    public User user;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    public Question question;

    public String userAnswer;

    @Id
    @GeneratedValue
    public Long id;
}
