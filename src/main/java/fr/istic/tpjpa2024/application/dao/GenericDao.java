package fr.istic.tpjpa2024.application.dao;

import java.util.List;

public interface GenericDao<T, K> {

    T findOne(final K id);

    List<T> findAll();

    void save(final T entity);

    void update(final T entity);

    void delete(final T entity);

    void deleteById(final K entityId);
}