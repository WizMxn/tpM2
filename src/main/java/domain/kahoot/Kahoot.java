package domain.kahoot;

import domain.User;
import domain.question.Question;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

@Entity
@Data
public abstract class Kahoot {

    @Id
    @GeneratedValue
    private Long id;

    private Long pin;

    @OneToMany(mappedBy = "kahoot")
    private Collection<User> user;

}
