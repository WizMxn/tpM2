package fr.istic.tpjpa2024.application.domain.kahoot;

import fr.istic.tpjpa2024.application.domain.User;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

@Entity
@Data
public abstract class Kahoot {

    @Id
    @GeneratedValue
    public Long id;

    public String title;

    public Long pin;

    @ManyToOne
    public User owner;

    @OneToMany(mappedBy = "joinedKahoot")
    public Collection<User> user;

    public void addUser(User user) {
        this.user.add(user);
    }

}
