package fr.istic.tpjpa2024.application.service.impl;

import fr.istic.tpjpa2024.application.dao.impl.KahootDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.domain.User;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.dto.KahootDto;
import fr.istic.tpjpa2024.application.mapper.KahootMapper;
import fr.istic.tpjpa2024.application.service.KahootService;
import fr.istic.tpjpa2024.application.service.exception.IllegalIdOnCreateException;
import fr.istic.tpjpa2024.application.service.exception.MissingIdException;
import fr.istic.tpjpa2024.application.service.exception.NotFound.KahootNotFoundException;
import fr.istic.tpjpa2024.application.service.exception.NotFound.UserNotFoundException;
import jakarta.validation.ValidationException;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class KahootServiceImpl implements KahootService {

    private final KahootDaoImpl kahootRepository;

    private final UserDaoImpl userRepository;

    private final KahootMapper kahootMapper;

    public KahootServiceImpl(KahootDaoImpl kahootRepository, UserDaoImpl userRepository, KahootMapper kahootMapper) {
        this.kahootRepository = kahootRepository;
        this.userRepository = userRepository;
        this.kahootMapper = kahootMapper;
    }


    @Override
    public KahootDto createKahoot(KahootDto kahootDto, Long userId) {
        if (kahootDto == null) {
            throw new ValidationException("The kahoot DTO cannot be null.");
        }
        if (kahootDto.id() != null) {
            throw new IllegalIdOnCreateException("The kahoot ID must not already be defined at the time of creation.");
        }
        if (userId == null) {
            throw new ValidationException("The User Id cannot be null.");
        }

        User user = Optional.ofNullable(userRepository.findOne(userId))
                .orElseThrow(() -> new UserNotFoundException(userId));

        Kahoot kahoot = kahootMapper.toEntity(kahootDto);
        kahootRepository.save(kahoot);

        user.getOwnedKahoot().add(kahoot);
        userRepository.save(user);

        return kahootMapper.toDto(kahoot);
    }

    @Override
    public KahootDto findKahootById(Long id) {
        Objects.requireNonNull(id);
        Optional<Kahoot> kahootOptional = Optional.ofNullable(kahootRepository.findOne(id));
        Kahoot kahoot = kahootOptional.orElseThrow(() -> new KahootNotFoundException(id));
        return kahootMapper.toDto(kahoot);
    }

    @Override
    public List<KahootDto> findALl() {
        List<Kahoot> answerDtoList = kahootRepository.findAll();
        return answerDtoList.stream().map(kahootMapper::toDto).toList();
    }

    @Override
    public void deleteKahoot(Long id) {
        Objects.requireNonNull(id);
        Optional.ofNullable(kahootRepository.findOne(id)).orElseThrow(() -> new KahootNotFoundException(id));
        kahootRepository.deleteById(id);
    }


    @Override
    public KahootDto updateKahoot(KahootDto kahootDto) {
        if (kahootDto == null) {
            throw new ValidationException("The kahoot DTO cannot be null.");
        }
        if (kahootDto.id() == null) {
            throw new MissingIdException("The kahoot's id must not be null during update");
        }
        Optional.ofNullable(kahootRepository.findOne(kahootDto.id())).orElseThrow(() -> new KahootNotFoundException(kahootDto.id()));
        Kahoot kahoot = kahootMapper.toEntity(kahootDto);
        kahootRepository.save(kahoot);
        return kahootMapper.toDto(kahoot);
    }

}
