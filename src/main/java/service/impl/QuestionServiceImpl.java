package service.impl;

import dao.impl.QuestionChoiceDaoImpl;
import dao.impl.QuestionTextDaoImpl;
import domain.question.QuestionChoice;
import domain.question.QuestionText;
import service.IQuestionService;

import java.util.List;

public class QuestionServiceImpl implements IQuestionService {

    @Override
    public void createQuestionText(String userQuestion) {
        QuestionText questionText = new QuestionText();
        questionText.setUserQuestion(userQuestion);

        QuestionTextDaoImpl questionTextDao = new QuestionTextDaoImpl();
        questionTextDao.save(questionText);
    }

    @Override
    public void createQuestionChoice(List<String> choices) {
        QuestionChoice questionChoice = new QuestionChoice();
        questionChoice.setOptions(String.join(",", choices)); //TODO faire mieux

        QuestionChoiceDaoImpl questionChoiceDao = new QuestionChoiceDaoImpl();
        questionChoiceDao.save(questionChoice);
    }
}
