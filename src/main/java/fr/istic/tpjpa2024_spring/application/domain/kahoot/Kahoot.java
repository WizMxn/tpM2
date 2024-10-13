package fr.istic.tpjpa2024_spring.application.domain.kahoot;

import fr.istic.tpjpa2024_spring.application.domain.User;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

@Entity
@Data
public abstract class Kahoot {

    @Id
    @GeneratedValue
    private Long id;

    private String title;

    private Long pin;

    @ManyToOne
    private User owner;

    @OneToMany(mappedBy = "joinedKahoot")
    private Collection<User> user;

    public void addUser(User user){
        this.user.add(user);
    }

}
