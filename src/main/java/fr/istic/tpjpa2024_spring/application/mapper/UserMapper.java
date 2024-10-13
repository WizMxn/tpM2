package fr.istic.tpjpa2024_spring.application.mapper;

import fr.istic.tpjpa2024_spring.application.dto.UserDto;
import fr.istic.tpjpa2024_spring.application.domain.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {

    @Mapping(target = "id", source = "id")
    @Mapping(target = "username", source = "username")
    UserDto userToUserDto(User user);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "username", source = "username")
    User userDtoToUser(UserDto userDto);
}
