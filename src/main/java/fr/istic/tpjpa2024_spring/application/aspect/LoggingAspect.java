package fr.istic.tpjpa2024_spring.application.aspect;

import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Arrays;
import java.util.stream.Stream;

@Component
@Aspect
public class LoggingAspect {

    private static final Logger log = LoggerFactory.getLogger(LoggingAspect.class);

    @Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
    public void controller() {
    }

    @Pointcut("within(@org.springframework.web.bind.annotation.RestControllerAdvice *)")
    public void controllerAdvice() {
    }

    @Pointcut("execution(* fr.istic.tpjpa2024_spring.application.*.*())")
    protected void allMethod() {
    }

    /**
     * @param joinPoint we can find inside it all the details of the method called inside the join point
     *                  <p>
     *                  the AOP will execute this method before execute controller method
     */
    @Before("controller()")
    public void logRequest(JoinPoint joinPoint) {
        HttpServletRequest request = getCurrentHttpRequest();
        log.info("HTTP Method: {}({}), Parameters: [{}]",
                request.getMethod(),
                request.getServletPath(),
                createJoinPointForLogs(joinPoint));
    }

    /**
     * @param joinPoint we need to use it to see attributes in the original method
     * @return will return String after building all the attributes
     */
    private String createJoinPointForLogs(JoinPoint joinPoint) {
        if (joinPoint.getArgs().length < 1) {
            return joinPoint.getSignature().getName()
                    .concat("None");
        }
        return Arrays.toString(joinPoint.getArgs());
    }

    /**
     * Logs the response after the controller method is executed.
     *
     * @param response  the response object returned by the controller method
     */
    @AfterReturning(pointcut = "controller() || controllerAdvice()", returning = "response")
    public void logsResponse(Object response) {
        StringBuilder requestValue = new StringBuilder();
        requestValue.append("HTTP Response: ");
        if (response != null) {
            requestValue.append(response);
        } else {
            requestValue.append("Response is null");
        }
        log.info(requestValue.toString());
    }

    private HttpServletRequest getCurrentHttpRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attributes.getRequest();
    }
}
