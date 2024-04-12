package Animals;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public abstract class Animal implements Teachable{
    private final Integer id;
    private final String name;
    private final LocalDate birthday;
    private final List<String> commands;

    public Animal(Integer id, String name, LocalDate birthday) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.commands = new ArrayList<>();
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public List<String> getCommands() {
        return commands;
    }
}