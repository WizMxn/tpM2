package fr.istic.tpjpa2024_spring.application.mapper;

import fr.istic.tpjpa2024_spring.application.domain.KahootType;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Quiz;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.StrawPoll;
import fr.istic.tpjpa2024_spring.application.dto.KahootDto;
import fr.istic.tpjpa2024_spring.application.dto.UserDto;
import org.mapstruct.*;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = UserMapper.class) // Ajout de UserMapper
public abstract class KahootMapper {

    @Mapping(source = "id", target = "id")
    @Mapping(source = "title", target = "title")
    @Mapping(source = "pin", target = "pin")
    public abstract Kahoot toEntity(KahootDto kahootDto);

    // Méthode de fabrique pour retourner une instance concrète en fonction du type
    @ObjectFactory
    public Kahoot createKahoot(KahootDto kahootDto) {
        if (kahootDto.kahootType() == KahootType.QUIZ) {
            return new Quiz();
        } else if (kahootDto.kahootType() == KahootType.STRAWPOLL) {
            return new StrawPoll();
        }
        throw new IllegalArgumentException("Unknown Kahoot type: " + kahootDto.kahootType());
    }

    @Mapping(source = "id", target = "id")
    @Mapping(source = "pin", target = "pin")
    @Mapping(source = "title", target = "title")
    public abstract KahootDto toDto(Kahoot kahoot);

    @AfterMapping
    protected KahootDto updateType(Kahoot kahoot, @MappingTarget KahootDto kahootDto) {
        KahootType kahootType;

        if (kahoot instanceof Quiz) {
            kahootType = KahootType.QUIZ;
        } else if (kahoot instanceof StrawPoll) {
            kahootType = KahootType.STRAWPOLL;
        } else {
            throw new IllegalArgumentException("Unknown Kahoot type: " + kahoot.getClass().getName());
        }

        // Retourner un nouveau KahootDto avec le type ajusté et conserver l'owner
        return new KahootDto(kahootDto.id(), kahootDto.title(), kahootDto.pin(), kahootType);
    }

}
