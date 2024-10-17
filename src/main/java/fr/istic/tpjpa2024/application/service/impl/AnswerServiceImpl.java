package fr.istic.tpjpa2024.application.service.impl;

import fr.istic.tpjpa2024.application.dao.impl.AnswerDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.QuestionDaoImpl;
import fr.istic.tpjpa2024.application.domain.Answer;
import fr.istic.tpjpa2024.application.domain.question.Question;
import fr.istic.tpjpa2024.application.dto.AnswerDto;
import fr.istic.tpjpa2024.application.mapper.AnswerMapper;
import fr.istic.tpjpa2024.application.service.AnswerService;
import fr.istic.tpjpa2024.application.service.exception.IllegalIdOnCreateException;
import fr.istic.tpjpa2024.application.service.exception.NotFound.AnswerNotFoundException;
import jakarta.validation.ValidationException;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class AnswerServiceImpl implements AnswerService {

    private final AnswerDaoImpl answerDao;
    private final QuestionDaoImpl questionDao;
    private final AnswerMapper answerMapper;

    public AnswerServiceImpl(AnswerDaoImpl answerDao, QuestionDaoImpl questionDao, AnswerMapper answerMapper) {
        this.answerDao = answerDao;
        this.questionDao = questionDao;
        this.answerMapper = answerMapper;
    }

    @Override
    public AnswerDto createAnswer(AnswerDto answerDto) {
        if (answerDto == null) {
            throw new ValidationException("The answer DTO cannot be null.");
        }
        if (answerDto.id() != null) {
            throw new IllegalIdOnCreateException("The response ID must not already be defined at the time of creation.");
        }
        Answer answer = answerMapper.toEntity(answerDto);
        answerDao.save(answer);

        Question question = answer.getQuestion();
        question.getAnswers().add(answer);

        questionDao.save(question);

        return answerMapper.toDto(answer);
    }

    @Override
    public AnswerDto findAnswerById(Long id) {
        Objects.requireNonNull(id);
        Optional<Answer> answer = Optional.ofNullable(answerDao.findOne(id));
        return answerMapper.toDto(answer.orElseThrow(() -> new AnswerNotFoundException(id)));
    }

    @Override
    public List<AnswerDto> findAll() {
        List<Answer> answerDtoList = answerDao.findAll();
        return answerDtoList.stream().map(answerMapper::toDto).toList();
    }

    @Override
    public AnswerDto updateAnswer(Long id, AnswerDto answerDto) {
        return null;
    }
}
