package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jpa.EntityManagerHelper;
import lombok.Setter;

import java.util.List;

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

    public void save(T entity) {
        EntityTransaction t = this.entityManager.getTransaction();
        t.begin();
        entityManager.persist(entity);
        t.commit();
    }

    public T update(final T entity) {
        EntityTransaction t = this.entityManager.getTransaction();
        t.begin();
        T res = entityManager.merge(entity);
        t.commit();
        return res;
    }

    public void delete(T entity) {
        EntityTransaction t = this.entityManager.getTransaction();
        t.begin();
        entityManager.remove(entity);
        t.commit();
    }

    public void deleteById(K entityId) {
        T entity = findOne(entityId);
        delete(entity);
    }
}