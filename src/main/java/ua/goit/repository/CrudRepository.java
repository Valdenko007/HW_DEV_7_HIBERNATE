package ua.goit.repository;

import ua.goit.model.BaseEntity;

import java.util.List;
import java.util.Optional;

public interface CrudRepository<E extends BaseEntity<ID>, ID> {

    List<E> saveAll(Iterable<E> itrb);

    E save(E e);

    void deleteById(ID id);

    Optional<E> findById(ID id);

    List<E> findAll();

    void close();

}
