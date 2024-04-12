package Animals;

import java.time.LocalDate;
import java.util.List;

public class Hamster extends Pet{
    public Hamster(Integer id, String name, LocalDate birthday) {
        super(id, name, birthday);
    }

    public String toString() {
        return "Hamster" +
                ", name: " + super.getName() +
                ", birthday: " + super.getBirthday();
    }

    @Override
    public void teachable(String command) {
        super.getCommands().add(command);
    }

    @Override
    public List<String> getAllCommands() {
        return super.getCommands();
    }
}


