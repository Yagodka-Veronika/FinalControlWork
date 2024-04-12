package Animals;

import java.time.LocalDate;
import java.util.List;

public class Horse extends PackAnimal implements Teachable {

    public Horse(Integer id, String name, LocalDate birthday) {
        super(id, name, birthday);
    }
    public String toString() {
        return "Horse" +
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
