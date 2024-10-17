package fr.istic.tpjpa2024.application.controller;

import fr.istic.tpjpa2024.application.dao.impl.AnswerDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.QuestionDaoImpl;
import fr.istic.tpjpa2024.application.dto.AnswerDto;
import fr.istic.tpjpa2024.application.mapper.AnswerMapper;
import fr.istic.tpjpa2024.application.service.AnswerService;
import fr.istic.tpjpa2024.application.service.impl.AnswerServiceImpl;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Path("/answer")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AnswerResource {

    private final AnswerService answerService;

    public AnswerResource() {
        this.answerService = new AnswerServiceImpl(
                new AnswerDaoImpl(),
                new QuestionDaoImpl(),
                AnswerMapper.instance
        );
    }

    @GET
    @Path("/{id}")
    public Response findAnswerById(@PathParam("id") Long id) {
        AnswerDto answerDto = answerService.findAnswerById(id);
        return Response.status(Response.Status.OK)
                .entity(answerDto)
                .build();
    }

    @POST
    @Path("/createAnswer")
    public Response createAnswer(AnswerDto answerDto) {
        AnswerDto createdAnswer = answerService.createAnswer(answerDto);
        return Response.status(Response.Status.CREATED)
                .entity(createdAnswer)
                .build();
    }

    @GET
    @Path("/findAll")
    public Response findAllAnswer() {
        List<AnswerDto> answerDtoList = answerService.findAll();
        return Response.status(Response.Status.OK)
                .entity(answerDtoList)
                .build();
    }
}
