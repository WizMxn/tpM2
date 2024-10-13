package fr.istic.tpjpa2024_spring.application.mapper;

import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.domain.question.QuestionChoice;
import fr.istic.tpjpa2024_spring.application.domain.question.QuestionText;
import fr.istic.tpjpa2024_spring.application.dto.QuestionChoiceDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionListDto;
import fr.istic.tpjpa2024_spring.application.dto.QuestionTextDto;
import fr.istic.tpjpa2024_spring.application.repository.QuestionRepository;
import fr.istic.tpjpa2024_spring.application.service.QuestionService;
import org.mapstruct.*;

import java.util.Optional;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = MappingConstants.ComponentModel.SPRING)
public interface QuestionMapper {

    @Mapping(source = "question", target = "userQuestion")
    QuestionText toEntity(QuestionTextDto questionTextDto);

    @Mapping(source = "userQuestion", target = "question")
    QuestionTextDto toDto(QuestionText questionText);

    QuestionChoice toEntity(QuestionChoiceDto questionChoiceDto);

    QuestionChoiceDto toDto(QuestionChoice questionChoice);

    QuestionDto toDto(Question question);


}