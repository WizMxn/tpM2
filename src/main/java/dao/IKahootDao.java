package dao;

import domain.kahoot.Kahoot;
import domain.question.Question;

import java.util.List;

public interface IKahootDao extends IGenericDao<Long, Kahoot> {

    Kahoot findKahootByPin(Long pin);
}
