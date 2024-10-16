package fr.istic.tpjpa2024_spring.application.controller;

import fr.istic.tpjpa2024_spring.application.dto.UserDto;
import fr.istic.tpjpa2024_spring.application.domain.User;
import fr.istic.tpjpa2024_spring.application.service.KahootService;
import fr.istic.tpjpa2024_spring.application.service.UserService;
import fr.istic.tpjpa2024_spring.application.mapper.UserMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping(value = "/api/users")
public class UserController {

    private final UserService userService;
    private final UserMapper userMapper;

    public UserController(UserService userService, UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }

    @Operation(summary = "Create user with username")
    @ApiResponse(responseCode = "201", description = "User created")
    @ApiResponse(responseCode = "409", description = "User with this username already exists")
    @PostMapping(value = "/createUser")
    public ResponseEntity<String> createUser(@RequestBody @Validated UserDto userDto){
        if (userService.userExists(userDto.username())) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body("Username already exists");
        }
        userService.createUser(userDto.username());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body("User created");
    }

    @Operation(summary = "Get a user by ID")
    @ApiResponse(responseCode = "200", description = "User found")
    @ApiResponse(responseCode = "404", description = "User not found")
    @GetMapping("/{id}")
    public ResponseEntity<UserDto> getUserById(@PathVariable Long id){
        Optional<User> user = userService.findById(id);
        if (user.isPresent()) {
            UserDto userDto = userMapper.userToUserDto(user.get());
            return new ResponseEntity<>(userDto, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
