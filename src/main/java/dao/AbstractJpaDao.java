package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jpa.EntityManagerHelper;
import lombok.Setter;

import java.util.List;
import java.util.function.Consumer;

public abstract class AbstractJpaDao<K, T> implements IGenericDao<K, T> {

    @Setter
    private Class<T> clazz;

    protected EntityManager entityManager;

    public AbstractJpaDao(Class<T> clazz) {
        this.entityManager = EntityManagerHelper.getEntityManager();
        this.clazz = clazz;
    }

    public T findOne(K id) {
        return entityManager.find(clazz, id);
    }

    public List<T> findAll() {
        return entityManager.createQuery("select e from " + clazz.getName() + " as e", clazz).getResultList();
    }

    public void save(T t) {
        executeInsideTransaction(entityManager -> {
            entityManager.persist(t);
        });
    }

    public void update(T t) {
        executeInsideTransaction(entityManager -> {
            entityManager.merge(t);
        });
    }

    public void delete(T entity) {
        executeInsideTransaction(entityManager1 -> {
            entityManager.remove(entity);
        });
    }

    public void deleteById(K entityId) {
        T entity = findOne(entityId);
        delete(entity);
    }

    public void executeInsideTransaction(Consumer<EntityManager> action) {
        EntityTransaction tx = entityManager.getTransaction();
        try {
            tx.begin();
            action.accept(entityManager);
            tx.commit();
        } catch (RuntimeException e) {
            tx.rollback();
            throw e;
        }
    }

}