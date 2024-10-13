package fr.istic.tpjpa2024_spring.application.controller;

import fr.istic.tpjpa2024_spring.application.dto.KahootDto;
import fr.istic.tpjpa2024_spring.application.service.KahootService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/kahoot")
public class KahootController {

    KahootService kahootService;

    public KahootController(KahootService kahootService) {
        this.kahootService = kahootService;
    }

    @Operation(summary = "Create kahoot", description = "Create ether a Quiz or a StrawPoll base on the KahootType")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Kahoot created",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = KahootDto.class)
                    )})
    })
    @PostMapping("/createKahoot/{userId}")
    public ResponseEntity<KahootDto> createKahoot(KahootDto kahootDto, @PathVariable Long userId) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(kahootService.createKahoot(kahootDto, userId));
    }


    @Operation(summary = "Find a kahoot with it's id", description = "Use the id to find the correct kahoot in the database")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Kahoot found",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = KahootDto.class)
                    )})
    })
    @GetMapping("/{kahootId}")
    public ResponseEntity<KahootDto> getKahootById(@PathVariable Long kahootId) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(kahootService.findKahootById(kahootId));
    }


    @Operation(summary = "Get all Kahoots", description = "Retrieve a list of all Kahoots available in the database")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "List of all Kahoots",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = KahootDto.class)
                    )})
    })
    @GetMapping("/getAll")
    public ResponseEntity<List<KahootDto>> getAllKahoot() {
        return ResponseEntity.status(HttpStatus.OK)
                .body(kahootService.findALl());
    }


    @Operation(summary = "Delete a kahoot", description = "Delete a kahoot using its ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Kahoot deleted successfully"),
            @ApiResponse(responseCode = "404", description = "Kahoot not found",
                    content = @Content(schema = @Schema(hidden = true)))
    })
    @DeleteMapping("/{kahootId}")
    public ResponseEntity<Void> deleteKahoot(@PathVariable Long kahootId) {
        kahootService.deleteKahoot(kahootId);
        return ResponseEntity.noContent().build();  // Retourne un statut 204 No Content si la suppression est réussie
    }


    @Operation(summary = "Update a kahoot", description = "Update an existing kahoot using its ID and the provided updated information")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Kahoot updated successfully",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = KahootDto.class)
                    )}),
            @ApiResponse(responseCode = "404", description = "Kahoot not found",
                    content = @Content(schema = @Schema(hidden = true)))
    })
    @PutMapping("/updateKahoot")
    public ResponseEntity<KahootDto> updateKahoot(@RequestBody KahootDto kahootDto) {
        KahootDto updatedKahoot = kahootService.updateKahoot(kahootDto);
        return ResponseEntity.status(HttpStatus.OK).body(updatedKahoot);
    }
}
