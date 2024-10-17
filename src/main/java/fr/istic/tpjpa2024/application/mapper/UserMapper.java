package fr.istic.tpjpa2024.application.mapper;

import fr.istic.tpjpa2024.application.domain.User;
import fr.istic.tpjpa2024.application.dto.UserDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserMapper {

    public static UserMapper instance = Mappers.getMapper(UserMapper.class);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "username", source = "username")
    UserDto userToUserDto(User user);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "username", source = "username")
    User userDtoToUser(UserDto userDto);
}
