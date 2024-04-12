package Animals;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        AnimalRegistry.animalRegistry();
        while (true) {
            System.out.println("\nВведите show, если хотите посмотреть список животных. \nВведите add, если хотите " +
                    "добавить животное. \nВведите command, если хотите добавить или посмотреть команды животных. " +
                    "\nВведите sort, чтобы отсортировать список животных по дате рождения.");
            Scanner scanner = new Scanner(System.in);
            String text = scanner.nextLine();
            switch (text) {
                case "show":
                    AnimalService.show();
                    break;
                case "add":
                    AnimalService.addAnimal();
                    break;
                case "command":
                    System.out.println("Если хотите посмотреть список животных с их текущими командами, напишите command. " +
                            "Если хотите добавить новые команды, впишите new");
                    Scanner newScanner = new Scanner(System.in);
                    String textWithScanner = newScanner.next();
                    if (textWithScanner.equals("command")) {
                        AnimalService.listOfCommand();
                    } else if (textWithScanner.equals("new")) {
                        AnimalService.addMoreCommand();
                    }
                    break;
                case "sort":
                    AnimalService.birthdaySort();
                    break;

            }
        }
    }
}
