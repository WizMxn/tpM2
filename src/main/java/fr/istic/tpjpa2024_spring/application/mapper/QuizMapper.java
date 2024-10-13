package fr.istic.tpjpa2024_spring.application.mapper;

import fr.istic.tpjpa2024_spring.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024_spring.application.dto.QuizDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface QuizMapper {

    @Mapping(target = "pin", source = "pin")
    @Mapping(target = "id", source = "quizId")
    @Mapping(target = "owner.id", source = "ownerId")
    @Mapping(target = "title", source = "title")
    Quiz quizDtoToQuiz(QuizDto quizDto);

    @Mapping(target = "quizId", source = "id")
    @Mapping(target = "ownerId", source = "owner.id")
    @Mapping(target = "title", source = "title")
    QuizDto quizToQuizDto(Quiz quiz);
}
