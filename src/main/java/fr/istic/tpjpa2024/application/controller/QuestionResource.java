package fr.istic.tpjpa2024.application.controller;

import fr.istic.tpjpa2024.application.dao.impl.KahootDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.QuestionDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;
import fr.istic.tpjpa2024.application.domain.question.Question;
import fr.istic.tpjpa2024.application.domain.question.QuestionChoice;
import fr.istic.tpjpa2024.application.domain.question.QuestionText;
import fr.istic.tpjpa2024.application.dto.QuestionChoiceDto;
import fr.istic.tpjpa2024.application.dto.QuestionDto;
import fr.istic.tpjpa2024.application.dto.QuestionListDto;
import fr.istic.tpjpa2024.application.dto.QuestionTextDto;
import fr.istic.tpjpa2024.application.mapper.KahootMapper;
import fr.istic.tpjpa2024.application.mapper.QuestionMapper;
import fr.istic.tpjpa2024.application.service.KahootService;
import fr.istic.tpjpa2024.application.service.QuestionService;
import fr.istic.tpjpa2024.application.service.impl.KahootServiceImpl;
import fr.istic.tpjpa2024.application.service.impl.QuestionServiceImpl;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.mapstruct.factory.Mappers;

import java.util.ArrayList;
import java.util.List;

@Path("/api/questions")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class QuestionResource {

    QuestionService questionService;

    KahootService kahootService;

    QuestionMapper questionMapper;

    KahootMapper kahootMapper;

    public QuestionResource() {
        KahootMapper instance = KahootMapper.instance;
        this.questionService = new QuestionServiceImpl(
                new QuestionDaoImpl()
        );
        this.kahootService = new KahootServiceImpl(
                new KahootDaoImpl(),
                new UserDaoImpl(),
                instance
        );
        this.questionMapper = QuestionMapper.instance;
        this.kahootMapper = instance;
    }

    @GET
    @Path("/{kahootId}")
    public QuestionListDto getQuestions(@PathParam("kahootId") Long kahootId) {
        List<Question> questions = questionService.getQuestionsByKahootId(kahootId);
        List<QuestionDto> questionsDto = new ArrayList<>();
        for (Question question : questions) {
            questionsDto.add(questionMapper.toDto(question));
        }
        return new QuestionListDto(questionsDto);
    }

    @POST
    @Path("/createQuestionText/{kahootId}")
    public Response createQuestionText(
            QuestionTextDto questionTextDto,
            @PathParam("kahootId") Long kahootId) {
        QuestionText questionText = questionMapper.toEntity(questionTextDto);
        Kahoot kahoot = kahootMapper.toEntity(kahootService.findKahootById(kahootId));
        questionText.setKahoot(kahoot);
        questionService.addQuestion(questionText);
        return Response.ok(questionTextDto.toString()).build();
    }

    @POST
    @Path("/createQuestionChoice/{kahootId}")
    public Response createQuestionChoice(
            QuestionChoiceDto questionChoiceDto,
            @PathParam("kahootId") Long kahootId) {
        QuestionChoice questionChoice = questionMapper.toEntity(questionChoiceDto);
        Kahoot kahoot = kahootMapper.toEntity(kahootService.findKahootById(kahootId));
        questionChoice.setKahoot(kahoot);
        questionService.addQuestion(questionChoice);
        return Response.ok(questionChoiceDto.toString()).build();
    }
}
