package fr.istic.tpjpa2024_spring.application.service;

import fr.istic.tpjpa2024_spring.application.domain.Answer;
import fr.istic.tpjpa2024_spring.application.dto.AnswerDto;
import jakarta.persistence.EntityNotFoundException;

import java.util.List;

/**
 * Service interface for managing {@link Answer} entities.
 * This interface provides methods to create, retrieve, and update Answer entities using DTOs.
 * <p>
 * The implementation of this service should handle business logic and interact with the persistence layer.
 * </p>
 *
 * @see AnswerDto
 * @see Answer
 */
public interface AnswerService {

    /**
     * Creates a new {@link Answer} based on the provided {@link AnswerDto}.
     *
     * @param answerDto the data transfer object containing the information to create a new Answer
     * @return the {@link AnswerDto} of the newly created Answer
     * @throws IllegalArgumentException if the provided {@link AnswerDto} is invalid
     * @see AnswerDto
     */
    public AnswerDto createAnswer(AnswerDto answerDto);

    /**
     * Retrieves an {@link Answer} entity by its identifier and converts it to {@link AnswerDto}.
     *
     * @param id the identifier of the Answer to be retrieved
     * @return the {@link AnswerDto} corresponding to the Answer with the specified id
     * @throws EntityNotFoundException if no Answer with the given id is found
     * @see AnswerDto
     */
    public AnswerDto findAnswerById(Long id);

    public List<AnswerDto> findAll();

    /**
     * Updates an existing {@link Answer} entity with new data from the provided {@link AnswerDto}.
     *
     * @param id the identifier of the Answer to update
     * @param answerDto the data transfer object containing updated information
     * @return the updated {@link AnswerDto}
     * @throws EntityNotFoundException if no Answer with the given id is found
     * @throws IllegalArgumentException if the provided {@link AnswerDto} is invalid
     * @see AnswerDto
     */
    public AnswerDto updateAnswer(Long id, AnswerDto answerDto);

}
