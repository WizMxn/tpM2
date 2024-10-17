package fr.istic.tpjpa2024.application.dto;


import jakarta.annotation.Nullable;
import lombok.NonNull;

public record UserDto(@NonNull String username, @Nullable Long id) {
}
