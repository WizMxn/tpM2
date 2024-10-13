package fr.istic.tpjpa2024_spring.application.controller;

import fr.istic.tpjpa2024_spring.application.dto.AnswerDto;
import fr.istic.tpjpa2024_spring.application.service.AnswerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/answer")
public class AnswerController {

    private final AnswerService answerService;

    public AnswerController(AnswerService answerService) {
        this.answerService = answerService;
    }

    @Operation(summary = "Find a answer with it's id", description = "Use the id to find the correct answer in the database")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = AnswerDto.class)
                    )})
    })
    @GetMapping("/{id}")
    public ResponseEntity<AnswerDto> findAnswerById(@PathVariable Long id) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(answerService.findAnswerById(id));
    }

    @Operation(summary = "Create a new answer", description = "Creates a new answer based on the provided AnswerDto.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Answer created successfully",
                    content = {@Content(mediaType = "application/json", schema = @Schema(implementation = AnswerDto.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid input", content = @Content),
            @ApiResponse(responseCode = "500", description = "Server error", content = @Content)
    })
    @PostMapping("/createAnswer")
    public ResponseEntity<AnswerDto> createAnswer(@RequestBody AnswerDto answerDto) {
        AnswerDto createdAnswer = answerService.createAnswer(answerDto);
        return new ResponseEntity<>(createdAnswer, HttpStatus.CREATED);
    }

    @Operation(summary = "Find all the answer", description = "Find every answer in the database")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "",
                    content = {@Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = AnswerDto.class))
                    )})
    })
    @GetMapping("/findAll")
    public ResponseEntity<List<AnswerDto>> findAllAnswer(){
        List<AnswerDto> answerDtoList = answerService.findAll();
        return new ResponseEntity<>(answerDtoList, HttpStatus.CREATED);
    }


}
