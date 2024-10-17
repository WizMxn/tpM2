package fr.istic.tpjpa2024.application.mapper;

import fr.istic.tpjpa2024.application.domain.question.Question;
import fr.istic.tpjpa2024.application.domain.question.QuestionChoice;
import fr.istic.tpjpa2024.application.domain.question.QuestionText;
import fr.istic.tpjpa2024.application.dto.QuestionChoiceDto;
import fr.istic.tpjpa2024.application.dto.QuestionDto;
import fr.istic.tpjpa2024.application.dto.QuestionTextDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = MappingConstants.ComponentModel.JAKARTA)
public interface QuestionMapper {

    public static QuestionMapper instance = Mappers.getMapper(QuestionMapper.class);

    @Mapping(source = "question", target = "userQuestion")
    QuestionText toEntity(QuestionTextDto questionTextDto);

    @Mapping(source = "userQuestion", target = "question")
    QuestionTextDto toDto(QuestionText questionText);

    QuestionChoice toEntity(QuestionChoiceDto questionChoiceDto);

    QuestionChoiceDto toDto(QuestionChoice questionChoice);

    QuestionDto toDto(Question question);


}