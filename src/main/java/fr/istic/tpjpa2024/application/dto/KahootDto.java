package fr.istic.tpjpa2024.application.dto;

import fr.istic.tpjpa2024.application.domain.KahootType;

public record KahootDto(Long id, String title, Long pin, KahootType kahootType) {
}
