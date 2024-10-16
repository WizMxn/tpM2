package fr.istic.tpjpa2024_spring.application.dto;

import fr.istic.tpjpa2024_spring.application.domain.KahootType;
import io.micrometer.common.lang.NonNull;

public record KahootDto(Long id, String title, Long pin, KahootType kahootType) {
}
