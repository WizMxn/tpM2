package fr.istic.tpjpa2024.application.dao;

import fr.istic.tpjpa2024.application.domain.kahoot.Kahoot;

public interface KahootDao extends GenericDao<Kahoot, Long> {

    Kahoot findKahootByPin(Long pin);
}
