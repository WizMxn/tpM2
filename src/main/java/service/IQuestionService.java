package service;

import java.util.List;

public interface IQuestionService {


    void createQuestionText(String userQuestion);

    void createQuestionChoice(List<String> choices);

}
