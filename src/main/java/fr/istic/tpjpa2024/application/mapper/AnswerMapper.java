package fr.istic.tpjpa2024.application.mapper;

import fr.istic.tpjpa2024.application.dao.impl.AnswerDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.QuestionDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.domain.Answer;
import fr.istic.tpjpa2024.application.domain.User;
import fr.istic.tpjpa2024.application.domain.question.Question;
import fr.istic.tpjpa2024.application.dto.AnswerDto;
import fr.istic.tpjpa2024.application.service.UserService;
import fr.istic.tpjpa2024.application.service.exception.NotFound.UserNotFoundException;
import fr.istic.tpjpa2024.application.service.impl.UserServiceImpl;
import org.mapstruct.*;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = MappingConstants.ComponentModel.JAKARTA, unmappedTargetPolicy = ReportingPolicy.IGNORE)
public abstract class AnswerMapper {

    protected QuestionDaoImpl questionDao;

    protected AnswerDaoImpl answerRepository;

    protected UserService userService;

    public static AnswerMapper instance = Mappers.getMapper(AnswerMapper.class);

    public AnswerMapper() {
        questionDao = new QuestionDaoImpl();
        answerRepository = new AnswerDaoImpl();
        userService = new UserServiceImpl(
                new UserDaoImpl()
        );
    }

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
        return questionDao.findOne(questionId);
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
