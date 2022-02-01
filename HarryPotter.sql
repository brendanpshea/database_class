/*
Tables:

Student(id#, last_name, first_name, dob, year_in_school, email, house)
Course(id#, title, instructor_id)
Instructor(id#, last_name, first_name, salary, date_of_hire)
Enrolled(student_id, course_id)
House(id, house_name, history)
*/
  

DROP TABLE IF EXISTS House;
CREATE TABLE House (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- a typical way of handing primary key
    name VARCHAR(32) UNIQUE NOT NULL, -- max of 32 characters. 
    history TEXT NOT NULL -- "text" for arbitrarly long text fields. Don't want to sort/search this!
);


DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    last_name NOT NULL,
    first_name NOT NULL,
    dob DATE, -- a new data type!
    year_in_school INTEGER NOT NULL DEFAULT 1,
    email VARCHAR(32) UNIQUE, -- a "logical key"
    house_id INTEGER,   -- a "foreign" key
        FOREIGN KEY(house_id) REFERENCES House(id) ON DELETE SET NULL
 );
 
DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    last_name NOT NULL,
    first_name NOT NULL,
	salary INTEGER, -- some versions allow 'Currency'. Don't use real!
    date_of_hire DATE
 );
 
DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	credits INTEGER,
	name VARCHAR (24) NOT NULL	
);

DROP TABLE IF EXISTS Enrolled;
CREATE TABLE Enrolled (
	course_id INTEGER,
	student_id INTEGER,
	UNIQUE(course_id, student_id),
	FOREIGN KEY (course_id) REFERENCES Course(id) ON DELETE CASCADE,
	FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE
);

-- Begin by creating the four houses
INSERT INTO House (name, history) VALUES ('Gryffindor', 
    'Gryffindor was one of the four Houses of Hogwarts School of Witchcraft and Wizardry and was founded by Godric Gryffindor...');
INSERT INTO House (name, history) VALUES ('Hufflepuff', 
    'Hufflepuff was founded by Helga Hufflepuff, and is the most inclusive among the four houses, valuing hard work, dedication, patience, loyalty, and fair play rather than a particular aptitude in its members');
INSERT INTO House (name, history) VALUES ('Ravenclaw', 
    'Ravenclaw was founded by Rowena Ravenclaw. Members of this house were characterised by their wit, learning, and wisdom...');
INSERT INTO House (name, history) VALUES ('Slytherin', 
    'Slytherin was founded by Salazar Slytherin. House characteristics included cunning, resourcefulness, leadership, and ambition...');
    
    
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Diggory', 'Cedric', '5/25/1978', 5, 'diggory.dog@gmail.com', 2);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Chang', 'Cho', '3/11/1979', 4, 'Chang23@hogwarts.edu', 3);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Potter', 'Harry', '7/31/1980', 3, 'harry.potter@gmail.com', 1);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Granger', 'Hermione', '9/19/1979', 3, 'hgrangerr@hogwarts.edu', 1);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Malfoy', 'Draco', '10/31/1979', 3, 'DracoM79@hogwarts.edu', 4);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Weasley', 'Ginny', '7/19/1981', 2, 'great_ginny@yahoo.com', 1);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Weasley', 'Ron', '3/01/1980', 3, 'ronron@yahoo.com', 1);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Lovegood', 'Luna', '2/13/1981', 3, 'luna.loves@gmail.com', 3);
INSERT INTO Student (last_name, first_name, dob, year_in_school, email, house_id)
    VALUES ('Parkinson', 'Pansy', '1/12/1980', 3, 'pansy_p_parkinson@yahoo.com', 4);
	
--Insert Instructors	
INSERT INTO Instructor (last_name, first_name, salary, date_of_hire) VALUES ('Dumbledore', 'Albus', 74000, 1935);
INSERT INTO Instructor (last_name, first_name, salary, date_of_hire) VALUES('Snape', 'Severus', 43000, 1997);
INSERT INTO Instructor (last_name, first_name, salary, date_of_hire) VALUES ('McGonagall', 'Minerva', 62000, 1969);
INSERT INTO Instructor (last_name, first_name, salary, date_of_hire) VALUES('Trelawney', 'Sybil', 54500, 1980);

--Insert Courses
INSERT INTO Course (name, credits) VALUES ('Potions', 3);
INSERT INTO Course (name, credits) VALUES ('History of Magic', 3);
INSERT INTO Course (name, credits) VALUES ('Transmutation', 4);
INSERT INTO Course (name, credits) VALUES ('Defense Against Dark Arts', 4);

--Determine enrollment
INSERT INTO ENROLLED (student_id, course_id) VALUES (1,1);
INSERT INTO ENROLLED (student_id, course_id) VALUES (1,3);
INSERT INTO ENROLLED (student_id, course_id) VALUES (2,1);
INSERT INTO ENROLLED (student_id, course_id) VALUES (2,2);
INSERT INTO ENROLLED (student_id, course_id) VALUES (3,3);
INSERT INTO ENROLLED (student_id, course_id) VALUES (4,1);
INSERT INTO ENROLLED (student_id, course_id) VALUES (4,2);
INSERT INTO ENROLLED (student_id, course_id) VALUES (4,3);