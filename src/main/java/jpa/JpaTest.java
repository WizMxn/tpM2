package jpa;

import service.exception.QuestionException;
import service.exception.UserException;
import service.impl.QuestionServiceImpl;
import service.impl.UserServiceImpl;

public class JpaTest {


    /**
     * @param args
     */
    public static void main(String[] args) {

        UserServiceImpl userService = new UserServiceImpl();
        QuestionServiceImpl questionTextService = new QuestionServiceImpl();
        try {
           // userService.createUser("raph");
           // userService.createQuiz("raph");

           // questionTextService.createQuestionText("Comment ca va ?");

            userService.addQuestion(1L, "raph", 1L);
        } catch (UserException e) {
            e.printStackTrace();
        } catch (QuestionException e) {
            e.printStackTrace();
        }


        // On est dans le controller

        // Ici on reçoit une requête de john ( le mieux est d'avoir un dto)



        EntityManagerHelper.closeEntityManagerFactory();
        System.out.println(".. done");
    }
}
