package fr.istic.tpjpa2024_spring.application.service.impl;

import fr.istic.tpjpa2024_spring.application.domain.Answer;
import fr.istic.tpjpa2024_spring.application.domain.question.Question;
import fr.istic.tpjpa2024_spring.application.dto.AnswerDto;
import fr.istic.tpjpa2024_spring.application.mapper.AnswerMapper;
import fr.istic.tpjpa2024_spring.application.repository.AnswerRepository;
import fr.istic.tpjpa2024_spring.application.repository.QuestionRepository;
import fr.istic.tpjpa2024_spring.application.service.AnswerService;
import fr.istic.tpjpa2024_spring.application.service.exception.IllegalIdOnCreateException;
import fr.istic.tpjpa2024_spring.application.service.exception.NotFound.AnswerNotFoundException;
import jakarta.transaction.Transactional;
import jakarta.validation.ValidationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class AnswerServiceImpl implements AnswerService {

    private final AnswerRepository answerRepository;
    private final QuestionRepository questionRepository;
    private final AnswerMapper answerMapper;

    public AnswerServiceImpl(AnswerRepository answerRepository, QuestionRepository questionRepository, AnswerMapper answerMapper) {
        this.answerRepository = answerRepository;
        this.questionRepository = questionRepository;
        this.answerMapper = answerMapper;
    }

    @Transactional
    @Override
    public AnswerDto createAnswer(AnswerDto answerDto) {
        if (answerDto == null) {
            throw new ValidationException("The answer DTO cannot be null.");
        }
        if (answerDto.id() != null) {
            throw new IllegalIdOnCreateException("The response ID must not already be defined at the time of creation.");
        }
        Answer answer = answerMapper.toEntity(answerDto);
        answerRepository.save(answer);

        Question question = answer.getQuestion();
        question.getAnswers().add(answer);

        questionRepository.save(question);

        return answerMapper.toDto(answer);
    }

    @Override
    public AnswerDto findAnswerById(Long id) {
        Objects.requireNonNull(id);
        Optional<Answer> answer = answerRepository.findById(id);
        return answerMapper.toDto(answer.orElseThrow(() -> new AnswerNotFoundException(id)));
    }

    @Override
    public List<AnswerDto> findAll() {
        List<Answer> answerDtoList = answerRepository.findAll();
        return answerDtoList.stream().map(answerMapper::toDto).toList();
    }

    @Override
    public AnswerDto updateAnswer(Long id, AnswerDto answerDto) {
        return null;
    }
}
