package fr.istic.tpjpa2024.application.mapper;

import fr.istic.tpjpa2024.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024.application.dto.QuizDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = MappingConstants.ComponentModel.JAKARTA)
public interface QuizMapper {

    public static QuizMapper instance = Mappers.getMapper(QuizMapper.class);

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
