package domain.kahoot;

public enum KahootType {
    QUIZ("Quiz"),
    STRAWPOLL("Strawpoll"),;

    private String name;

    KahootType(String name) {
        this.name = name;
    }
}
