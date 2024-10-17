package fr.istic.tpjpa2024;

import fr.istic.tpjpa2024.application.controller.AnswerResource;
import fr.istic.tpjpa2024.application.controller.KahootResource;
import fr.istic.tpjpa2024.application.controller.QuestionResource;
import fr.istic.tpjpa2024.application.controller.UserResource;
import fr.istic.tpjpa2024.application.domain.Answer;
import jakarta.ws.rs.ApplicationPath;
import io.swagger.v3.jaxrs2.integration.resources.OpenApiResource;
import jakarta.ws.rs.core.Application;

import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/")
public class Tpjpa2024Application extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        final Set<Class<?>> classes = new HashSet<Class<?>>();

        classes.add(AnswerResource.class);
        classes.add(KahootResource.class);
        classes.add(QuestionResource.class);
        classes.add(UserResource.class);
        classes.add(OpenApiResource.class);

        return classes;
    }
}
