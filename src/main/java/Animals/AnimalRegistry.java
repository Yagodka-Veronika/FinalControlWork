package Animals;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class AnimalRegistry {
    public static List<Animal> ANIMAL_LIST = new ArrayList<>();

    public static List<Animal> animalRegistry() {
        Animal cat = new Cat(1, "Happy", LocalDate.of(2019, 5, 12));
        Animal dog = new Dog(2, "Zevs", LocalDate.of(2020, 11, 10));
        Animal hamster = new Hamster(3, "Xoma", LocalDate.of(2023, 9, 16));
        Animal camel = new Camel(4, "Bongo", LocalDate.of(2015, 7, 10));
        Animal donkey = new Donkey(5, "Ia", LocalDate.of(2017, 4, 15));
        Animal horse = new Horse(6, "Black", LocalDate.of(2019, 8, 22));

        cat.teachable("Mew");
        cat.teachable("Go to the toilet");
        dog.teachable("Voice");
        dog.teachable("Sit down");
        dog.teachable("Take");
        hamster.teachable("Running");
        hamster.teachable("Go to the toilet");
        camel.teachable("Take a ride");
        camel.teachable("Wallking");
        camel.teachable("Running");
        donkey.teachable("Take a ride");
        donkey.teachable("Wallking");
        donkey.teachable("Running");
        horse.teachable("Take a ride");
        horse.teachable("Wallking");
        horse.teachable("Running");

        Collections.addAll(ANIMAL_LIST, cat, dog, hamster, camel, donkey, horse);
        return ANIMAL_LIST;
    }

    public static List<Animal> addAnimal(Animal animal) {
        ANIMAL_LIST.add(animal);
        return ANIMAL_LIST;
    }

    public static void show(Integer choos) {
        if (ANIMAL_LIST.isEmpty()) {
            System.out.println("Реестр животных пуст.");
        } else {
            if (choos == 1) {
                ANIMAL_LIST.forEach(System.out::println);
            } else if (choos == 2) {
                ANIMAL_LIST.stream().filter(animal -> animal instanceof Pet).forEach(System.out::println);
            } else if (choos == 3) {
                ANIMAL_LIST.stream().filter(animal -> animal instanceof PackAnimal).forEach(System.out::println);
            }
        }
    }

    public static void listOfCommand() {
        for (Animal animal : ANIMAL_LIST) {
            if (animal.getAllCommands().isEmpty()) {
                System.out.println(animal + " - Это животное ничего не умеет");
            } else System.out.println(animal + " " + animal.getAllCommands());
        }
    }

    public static void birthdaySort() {

        Comparator<Animal> comparatorDesc = (prod1, prod2) -> prod2.getBirthday()
                .compareTo(prod1.getBirthday());

        Collections.sort(ANIMAL_LIST, comparatorDesc);
        ANIMAL_LIST.forEach(animal -> System.out.println(animal));
    }
}
