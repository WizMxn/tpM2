package fr.istic.tpjpa2024.application.domain.question;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Collection;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class QuestionChoice extends Question {

    public Collection<String> options;

    public String goodAnswer;
}
