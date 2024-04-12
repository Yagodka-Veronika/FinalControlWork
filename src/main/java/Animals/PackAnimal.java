package Animals;

import java.time.LocalDate;

public abstract class PackAnimal extends Animal {
    public PackAnimal(Integer id, String name, LocalDate birthday) {
        super(id, name, birthday);
    }
}
