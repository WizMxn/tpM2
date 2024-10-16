package fr.istic.tpjpa2024_spring.application.mapper;

import fr.istic.tpjpa2024_spring.application.domain.Answer;
import fr.istic.tpjpa2024_spring.application.domain.User;
import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.dto.AnswerDto;
import fr.istic.tpjpa2024_spring.application.repository.AnswerRepository;
import fr.istic.tpjpa2024_spring.application.repository.QuestionRepository;
import fr.istic.tpjpa2024_spring.application.service.UserService;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.QuestionNotFoundException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.UserNotFoundException;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ReportingPolicy;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public abstract class AnswerMapper {

    @Autowired
    protected QuestionRepository questionRepository;

    @Autowired
    protected AnswerRepository answerRepository;

    @Autowired
    protected UserService userService;

    @Mapping(source = "questionId", target = "question", qualifiedByName = "idToQuestion")
    @Mapping(source = "userId", target = "user", qualifiedByName = "idToUser")
    public abstract Answer toEntity(AnswerDto answerDto);

    @Mapping(source = "question.id", target = "questionId")
    @Mapping(source = "user.id", target = "userId")
    public abstract AnswerDto toDto(Answer answer);

    @Named("idToQuestion")
    protected Question idToQuestion(Long questionId) {
        if (questionId == null) {
            throw new IllegalArgumentException("Question's id must not be null");
        }
        return questionRepository.findById(questionId)
                .orElseThrow(() -> new QuestionNotFoundException(questionId)); // Gestion d'exception
    }

    @Named("idToUser")
    protected User idToUser(Long userId) {
        if (userId == null) {
            throw new IllegalArgumentException("User's id must not be null");
        }
        return userService.findById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId));// Remplacer par la logique d'accès à l'utilisateur
    }
}
