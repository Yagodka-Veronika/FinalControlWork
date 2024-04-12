package Animals;

import java.time.LocalDate;

public abstract class Pet extends Animal{

    public Pet(Integer id, String name, LocalDate birthday) {
        super(id, name, birthday);
    }

}