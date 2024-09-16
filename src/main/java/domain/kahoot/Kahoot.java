package domain.kahoot;

import domain.User;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

@Entity
@Data
public abstract class Kahoot {

    @Id
    @GeneratedValue
    private Long id;

    private KahootType type;

    @GeneratedValue
    private Long pin;

    @ManyToOne
    private User owner;

    @OneToMany(mappedBy = "joinedKahoot")
    private Collection<User> user;

}
