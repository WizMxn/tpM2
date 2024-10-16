package fr.istic.tpjpa2024_spring.application.dto;

import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;

import java.util.Objects;

public record UserDto(@NonNull String username, @Nullable Long id) {
}
