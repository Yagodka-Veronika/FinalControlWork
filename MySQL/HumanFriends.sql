
CREATE SCHEMA IF NOT EXISTS HumanFriends;
USE HumanFriends;

CREATE TABLE IF NOT EXISTS animal
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    typeOfAnimal VARCHAR(50)
);

INSERT INTO animal (typeOfAnimal) VALUES 
("Pet"),
("PackAnimal");
 
CREATE TABLE IF NOT EXISTS pet
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal VARCHAR(50),
    animal_id INT,
    FOREIGN KEY (animal_id)
	REFERENCES animal(id)
);

CREATE TABLE IF NOT EXISTS packAnimal
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal VARCHAR(50),
    animal_id INT,
    FOREIGN KEY (animal_id)
	REFERENCES animal(id)
); 


INSERT INTO pet (animal, animal_id) VALUES
("Cat", 1),
("Dog", 1),
("Hamster", 1);


INSERT INTO packAnimal (animal, animal_id) VALUES
("Camel", 2),
("Donkey", 2),
("Horse", 2);


CREATE TABLE IF NOT EXISTS cat 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    pet_id INT,
    FOREIGN KEY (pet_id)
	REFERENCES pet(id)
);

CREATE TABLE IF NOT EXISTS dog 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    pet_id INT,
    FOREIGN KEY (pet_id)
	REFERENCES pet(id)
);

CREATE TABLE IF NOT EXISTS hamster
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    pet_id INT,
    FOREIGN KEY (pet_id)
	REFERENCES pet(id)
);


CREATE TABLE IF NOT EXISTS camel
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    packAnimal_id INT,
    FOREIGN KEY (packAnimal_id)
	REFERENCES packAnimal(id)
);

CREATE TABLE IF NOT EXISTS donkey 
(
	 id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    packAnimal_id INT,
    FOREIGN KEY (packAnimal_id)
	REFERENCES packAnimal(id)
);

CREATE TABLE IF NOT EXISTS horse 
(
	 id INT PRIMARY KEY AUTO_INCREMENT,
    animal_name VARCHAR(50),
    birthday DATE,
    commands TEXT,
    packAnimal_id INT,
    FOREIGN KEY (packAnimal_id)
	REFERENCES packAnimal(id)
);


INSERT INTO cat (animal_name, birthday, commands, pet_id) VALUES 
("Happy", "2019-05-12", "Mew, Go to the loilet", 1);

INSERT INTO dog (animal_name, birthday, commands, pet_id) VALUES 
("Zevs", "2020-11-10", "Voice, Sit down, Take", 2);

INSERT INTO hamster (animal_name, birthday, commands, pet_id) VALUES
("Xoma", "2023-09-16", "Running, Go to the loilet", 3);

INSERT INTO camel (animal_name, birthday, commands, packAnimal_id) VALUES 
("Bongo", "2015-07-10", "Take a ride, Wallking, Running", 1);

INSERT INTO donkey (animal_name, birthday, commands, packAnimal_id) VALUES 
("Ia", "2017-4-15", "Take a ride, Wallking, Running", 2);

INSERT INTO horse (animal_name, birthday, commands, packAnimal_id) VALUES 
("Black", "2019-8-22", "Take a ride, Wallking, Running", 3);



TRUNCATE camel;

INSERT INTO horse (animal_name, birthday, commands, packAnimal_id)
SELECT animal_name, birthday, commands, packAnimal_id
FROM donkey;

DROP TABLE donkey;

RENAME TABLE horse TO horse_donkey;

CREATE TABLE IF NOT EXISTS young_animal (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name VARCHAR(50),
    commands TEXT,
    birthday DATE,
    age TEXT
);

DELIMITER //
CREATE FUNCTION age_animal (date_b DATE)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE res TEXT DEFAULT '';
	SET res = CONCAT(
            TIMESTAMPDIFF(YEAR, date_b, CURDATE()),
            ' years ',
            TIMESTAMPDIFF(MONTH, date_b, CURDATE()) % 12,
            ' month'
        );
	RETURN res;
END //
DELIMITER ;

INSERT INTO young_animal (animal_name, commands, birthday, age)
SELECT animal_name, commands, birthday, age_animal(birthday)
FROM cat
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT animal_name, commands, birthday, age_animal(birthday)
FROM dog
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT animal_name, commands, birthday, age_animal(birthday)
FROM hamster
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT animal_name, commands, birthday, age_animal(birthday)
FROM horse_donkey
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM cat 
-- WHERE TIMESTAMPDIFF(YEAR, cat.birthday, CURDATE()) IN (1, 2, 3);
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM dog 
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM hamster
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM horse_donkey 
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM camel 
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 3;


CREATE TABLE animals (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name VARCHAR(50),
    commands TEXT,
    birthday DATE,
    age TEXT,
    animal_type ENUM('cat','dog','hamster', 'horse_donkey', 'camel', 'young_animals') NOT NULL
);

INSERT INTO animals (animal_name, commands, birthday, age, animal_type)
SELECT animal_name, commands, birthday, age_animal(birthday), 'cat'
FROM cat;

INSERT INTO animals (animal_name, commands, birthday, age, animal_type)
SELECT animal_name, commands, birthday, age_animal(birthday), 'dog'
FROM dog;

INSERT INTO animals (animal_name, commands, birthday, age, animal_type)
SELECT animal_name, commands, birthday, age_animal(birthday), 'hamster'
FROM hamster;

INSERT INTO animals (animal_name, commands, birthday, age, animal_type)
SELECT animal_name, commands, birthday, age_animal(birthday), 'horse_donkey'
FROM horse_donkey;

INSERT INTO animals (animal_name, commands, birthday, age, animal_type)
SELECT animal_name, commands, birthday, age_animal(birthday), 'young_animals'
FROM young_animal;


