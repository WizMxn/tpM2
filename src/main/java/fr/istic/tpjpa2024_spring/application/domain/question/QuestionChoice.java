package fr.istic.tpjpa2024_spring.application.domain.question;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Collection;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class QuestionChoice extends Question {

    private Collection<String> options;

    private String goodAnswer;
}
