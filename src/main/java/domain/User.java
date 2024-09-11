package domain;

import domain.kahoot.Kahoot;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Entity
@Data
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue
    private Long id;

    private String username;

    @ManyToOne
    private Kahoot kahoot;

    @OneToMany(mappedBy = "user")
    private Collection<Answer> answers;

}
