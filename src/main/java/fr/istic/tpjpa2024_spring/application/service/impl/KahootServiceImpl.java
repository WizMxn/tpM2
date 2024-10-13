package fr.istic.tpjpa2024_spring.application.service.impl;

import fr.istic.tpjpa2024_spring.application.domain.User;
import fr.istic.tpjpa2024_spring.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024_spring.application.dto.KahootDto;
import fr.istic.tpjpa2024_spring.application.mapper.KahootMapper;
import fr.istic.tpjpa2024_spring.application.mapper.QuizMapper;
import fr.istic.tpjpa2024_spring.application.repository.KahootRepository;
import fr.istic.tpjpa2024_spring.application.repository.QuizRepository;
import fr.istic.tpjpa2024_spring.application.repository.StrawPollRepository;
import fr.istic.tpjpa2024_spring.application.repository.UserRepository;
import fr.istic.tpjpa2024_spring.application.service.KahootService;
import fr.istic.tpjpa2024_spring.application.service.exception.IllegalIdOnCreateException;
import fr.istic.tpjpa2024_spring.application.service.exception.MissingIdException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.KahootNotFoundException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.UserNotFoundException;
import jakarta.transaction.Transactional;
import jakarta.validation.ValidationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class KahootServiceImpl implements KahootService {

    private final KahootRepository kahootRepository;

    private final UserRepository userRepository;

    private final KahootMapper kahootMapper;

    public KahootServiceImpl(KahootRepository kahootRepository, QuizRepository quizRepository, StrawPollRepository strawPollRepository, QuizMapper quizMapper, UserRepository userRepository, KahootMapper kahootMapper) {
        this.kahootRepository = kahootRepository;
        this.userRepository = userRepository;
        this.kahootMapper = kahootMapper;
    }


    @Transactional
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

        User user = userRepository.findById(userId)
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
        Optional<Kahoot> kahootOptional = kahootRepository.findById(id);
        Kahoot kahoot = kahootOptional.orElseThrow(() -> new KahootNotFoundException(id));
        return kahootMapper.toDto(kahoot);
    }

    @Override
    public List<KahootDto> findALl() {
        List<Kahoot> answerDtoList = kahootRepository.findAll();
        return answerDtoList.stream().map(kahootMapper::toDto).toList();
    }

    @Transactional
    @Override
    public void deleteKahoot(Long id) {
        Objects.requireNonNull(id);
        kahootRepository.findById(id).orElseThrow(() -> new KahootNotFoundException(id));
        kahootRepository.deleteById(id);
    }


    @Transactional
    @Override
    public KahootDto updateKahoot(KahootDto kahootDto) {
        if (kahootDto == null) {
            throw new ValidationException("The kahoot DTO cannot be null.");
        }
        if (kahootDto.id() == null) {
            throw new MissingIdException("The kahoot's id must not be null during update");
        }
        kahootRepository.findById(kahootDto.id()).orElseThrow(() -> new KahootNotFoundException(kahootDto.id()));
        Kahoot kahoot = kahootMapper.toEntity(kahootDto);
        kahootRepository.save(kahoot);
        return kahootMapper.toDto(kahoot);
    }

}
