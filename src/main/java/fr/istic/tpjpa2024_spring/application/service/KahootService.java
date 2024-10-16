package fr.istic.tpjpa2024_spring.application.service;

import fr.istic.tpjpa2024_spring.application.domain.KahootType;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.StrawPoll;
import fr.istic.tpjpa2024_spring.application.dto.KahootDto;
import fr.istic.tpjpa2024_spring.application.mapper.KahootMapper;
import fr.istic.tpjpa2024_spring.application.service.exception.MissingIdException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.KahootNotFoundException;
import jakarta.validation.ValidationException;

import java.util.List;

public interface KahootService {

    /**
     * Creates a new Kahoot based on the provided {@link KahootDto}.
     * The type of Kahoot to be created (either {@link Quiz} or {@link StrawPoll})
     * is determined by the {@link KahootType} field within the {@link KahootDto}.
     * Depending on the type, either a {@link Quiz} or a {@link StrawPoll}
     * instance will be instantiated and saved.
     *
     * @param kahootDto the data transfer object containing the details of the Kahoot to be created.
     * @return the created {@link KahootDto}.
     * @throws IllegalArgumentException if the {@link KahootType} is null or not recognized.
     */
    KahootDto createKahoot(KahootDto kahootDto, Long userid);

    /**
     * Retrieves a {@link Kahoot} by its unique identifier.
     * This method looks up a Kahoot in the repository using the provided ID. If no Kahoot
     * is found, a {@link KahootNotFoundException} is thrown. The retrieved Kahoot is then
     * mapped to a {@link KahootDto} and returned.
     *
     * @param id the unique identifier of the Kahoot to be retrieved. Must not be null.
     * @return a {@link KahootDto} representing the Kahoot found in the repository.
     * @throws NullPointerException    if the provided {@code id} is null.
     * @throws KahootNotFoundException if no Kahoot is found for the given ID.
     */
    KahootDto findKahootById(Long id);

    /**
     * Retrieves a list of all Kahoots from the repository.
     * This method fetches all Kahoot entities from the database, maps each entity
     * to a {@link KahootDto} using the {@link KahootMapper}, and returns the list of
     * mapped DTOs.
     *
     * @return a {@link List} of {@link KahootDto} representing all Kahoots in the repository.
     */
    List<KahootDto> findALl();

    /**
     * Deletes a Kahoot entity from the database based on its ID.
     *
     * <p>This method first checks if a Kahoot with the specified ID exists.
     * If it does, the entity is deleted. If not, a {@link KahootNotFoundException} is thrown.
     * This method is transactional, meaning that if any part of the deletion fails,
     * the transaction will be rolled back to maintain data integrity.</p>
     *
     * @param id the ID of the Kahoot to be deleted; must not be null
     * @throws NullPointerException    if the provided ID is null
     * @throws KahootNotFoundException if no Kahoot entity with the specified ID exists in the database
     */
    void deleteKahoot(Long id);

    /**
     * Updates an existing Kahoot in the database.
     * Once the existence of the Kahoot is verified, the DTO is mapped to an entity, and the repository
     * is called to persist the changes in the database. The updated entity is then mapped back to a DTO
     * and returned.
     *
     * @param kahootDto The DTO containing the updated Kahoot data. Must not be null, and must contain a valid ID.
     * @return The updated KahootDto after persisting the changes.
     * @throws ValidationException     if the KahootDto is null.
     * @throws MissingIdException      if the KahootDto does not contain a valid ID for the update operation.
     * @throws KahootNotFoundException if the Kahoot with the given ID is not found in the database.
     * @Transactional ensures that all operations within this method are part of a single transaction.
     */
    KahootDto updateKahoot(KahootDto kahootDto);
}
