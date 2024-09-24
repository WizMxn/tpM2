package jpa;

import dao.impl.*;
import domain.question.Question;
import service.IKahootService;
import service.exception.UserException;
import service.impl.KahootServiceImpl;
import service.impl.UserServiceImpl;

import java.util.List;

public class JpaTest {


    /**
     * @param args
     */
    public static void main(String[] args) throws UserException {

        //TODO change the injection dependance
        UserServiceImpl userService = new UserServiceImpl(new UserDaoImpl(), new QuizDaoImpl(), new StrawPollDaoImpl(), new KahootDaoImpl(), new QuestionTextDaoImpl(), new QuestionChoiceDaoImpl());
        IKahootService kahootService = new KahootServiceImpl(new UserDaoImpl(), new KahootDaoImpl(), new QuizDaoImpl(), new StrawPollDaoImpl());

 /*       //créer un user
        userService.createUser("mathis");

        //créer un quizz
        kahootService.createQuiz("mathis", "quizz1");*/

        //créer un autre user
        /*userService.createUser("Raphaël");*/

        //Join a kahoot
        /*kahootService.joinKahoot(2L, 1L);*/

/*
        QuestionText questionText = new QuestionText();
        questionText.setUserQuestion("questionTexte 1 ");

        QuestionChoice questionChoice = new QuestionChoice();
        questionChoice.setUserQuestion("QuestionChoice 2");

        kahootService.addQuestion(1L, 1L, List.of(questionText, questionChoice));*/

     /*   List<Question> questions = kahootService.getAllQuestionFromKahoot(1L);
        questions.forEach(q -> {
            System.out.println(q.getUserQuestion());
        });
*/
        // On est dans le controller

        // Ici on reçoit une requête de john ( le mieux est d'avoir un dto)



        EntityManagerHelper.closeEntityManagerFactory();
        System.out.println(".. done");
    }
}
