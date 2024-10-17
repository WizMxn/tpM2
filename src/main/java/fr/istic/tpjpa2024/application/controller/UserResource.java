package fr.istic.tpjpa2024.application.controller;

import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.domain.User;
import fr.istic.tpjpa2024.application.dto.UserDto;
import fr.istic.tpjpa2024.application.mapper.UserMapper;
import fr.istic.tpjpa2024.application.service.UserService;
import fr.istic.tpjpa2024.application.service.impl.UserServiceImpl;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.mapstruct.factory.Mappers;

import java.util.Optional;

@Path("/api/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {

    private UserService userService;

    private UserMapper userMapper;

    public UserResource() {
        this.userService = new UserServiceImpl(
                new UserDaoImpl()
        );
        this.userMapper = UserMapper.instance;
    }

    @POST
    @Path("/createUser")
    public Response createUser(UserDto userDto) {
        if (userService.userExists(userDto.username())) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Username already exists").build();
        }
        userService.createUser(userDto.username());
        return Response.status(Response.Status.CREATED)
                .entity("User created").build();
    }

    @GET
    @Path("/{id}")
    public Response getUserById(@PathParam("id") Long id) {
        Optional<User> user = userService.findById(id);
        if (user.isPresent()) {
            UserDto userDto = userMapper.userToUserDto(user.get());
            return Response.ok(userDto).build();
        }
        return Response.status(Response.Status.NOT_FOUND).build();
    }
}
