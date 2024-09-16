package dao;

import domain.kahoot.Kahoot;

import java.util.Optional;

public interface IKahootDao<T extends Kahoot> {

    Optional<T> findByIdPolymorphic(Long id);
}
