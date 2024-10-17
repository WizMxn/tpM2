package fr.istic.tpjpa2024.application.controller;

import fr.istic.tpjpa2024.application.dao.impl.KahootDaoImpl;
import fr.istic.tpjpa2024.application.dao.impl.UserDaoImpl;
import fr.istic.tpjpa2024.application.dto.KahootDto;
import fr.istic.tpjpa2024.application.mapper.KahootMapper;
import fr.istic.tpjpa2024.application.service.KahootService;
import fr.istic.tpjpa2024.application.service.impl.KahootServiceImpl;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;

@Path("/api/kahoot")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class KahootResource {

    KahootService kahootService;

    public KahootResource() {
        this.kahootService = new KahootServiceImpl(
                new KahootDaoImpl(),
                new UserDaoImpl(),
                KahootMapper.instance
        );
    }

    @POST
    @Path("/createKahoot/{userId}")
    public Response createKahoot(KahootDto kahootDto, @PathParam("userId") Long userId) {
        KahootDto createdKahoot = kahootService.createKahoot(kahootDto, userId);
        return Response.status(Response.Status.CREATED)
                .entity(createdKahoot).build();
    }

    @GET
    @Path("/{kahootId}")
    public Response getKahootById(@PathParam("kahootId") Long kahootId) {
        KahootDto kahoot = kahootService.findKahootById(kahootId);
        return Response.status(Response.Status.OK).entity(kahoot).build();
    }

    @GET
    @Path("/getAll")
    public Response getAllKahoot() {
        List<KahootDto> kahoots = kahootService.findALl();
        return Response.status(Response.Status.OK).entity(kahoots).build();
    }

    @DELETE
    @Path("/{kahootId}")
    public Response deleteKahoot(@PathParam("kahootId") Long kahootId) {
        kahootService.deleteKahoot(kahootId);
        return Response.noContent().build();  // Retourne un statut 204 No Content si la suppression est réussie
    }

    @PUT
    @Path("/updateKahoot")
    public Response updateKahoot(KahootDto kahootDto) {
        KahootDto updatedKahoot = kahootService.updateKahoot(kahootDto);
        return Response.status(Response.Status.OK).entity(updatedKahoot).build();
    }
}
