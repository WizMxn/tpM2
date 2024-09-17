package jpa;

import dao.impl.*;
import domain.Answer;
import domain.User;
import domain.kahoot.Kahoot;
import domain.kahoot.Quiz;
import domain.question.QuestionChoice;
import domain.question.QuestionText;
import service.exception.QuestionException;
import service.exception.UserException;
import service.impl.QuestionServiceImpl;
import service.impl.UserServiceImpl;

import java.util.List;

public class JpaTest {


    /**
     * @param args
     */
    public static void main(String[] args) throws UserException {

        //TODO change the injection dependance
        UserServiceImpl userService = new UserServiceImpl(new UserDaoImpl(), new QuizDaoImpl(), new StrawPollDaoImpl(), new KahootDaoImpl(), new QuestionTextDaoImpl(), new QuestionChoiceDaoImpl());

        userService.createUser("mathis");

        userService.createQuiz("mathis");


        QuestionText questionText = new QuestionText();
        questionText.setUserQuestion("questionTexte 1 ");

        QuestionChoice questionChoice = new QuestionChoice();
        questionChoice.setUserQuestion("QuestionChoice 2");

        userService.addQuestion(1L, 1L, List.of(questionText, questionChoice));

        //userService.addQuestionId(1L, "raph", 1L);


        // On est dans le controller

        // Ici on reçoit une requête de john ( le mieux est d'avoir un dto)



        EntityManagerHelper.closeEntityManagerFactory();
        System.out.println(".. done");
    }
}
