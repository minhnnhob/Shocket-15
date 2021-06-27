DROP DATABASE IF EXISTS testing_system_assignment_2;

CREATE DATABASE IF NOT EXISTS testing_system_assignment_2;

USE testing_system_assignment_2;

CREATE TABLE Department (
Department_ID INT AUTO_INCREMENT PRIMARY key,
Department_name varchar(40) NOT NULL UNIQUE KEY
);

CREATE TABLE Position (
Position_ID INT AUTO_INCREMENT PRIMARY KEY,
Position_name ENUM ('Dev', 'Test', 'Scrum Master','PM', 'Unknow') DEFAULT 'Unknow' 
);



CREATE TABLE `Account` (
    Account_id INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE KEY NOT NULL,
    User_name VARCHAR(50) NOT NULL UNIQUE KEY,
    Full_name VARCHAR(70) NOT NULL,
    Department_ID INT UNSIGNED NOT NULL,
    Position_ID INT UNSIGNED NOT NULL,
    Create_date DATE,
    FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID),
    FOREIGN KEY (Position_ID)
        REFERENCES `Position` (Position_ID)
);

create table `Group` (
Group_id int AUTO_INCREMENT PRIMARY KEY,
Group_name varchar(50) NOT NULL UNIQUE KEY,
Creator_id int UNSIGNED NOT NULL,
Create_date date,
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

create table GroupAccount (
Group_ID int UNSIGNED PRIMARY KEY,
Account_id int UNSIGNED NOT NULL,
Join_date date,
FOREIGN KEY(Account_ID) REFERENCES `Account`(Account_ID),
FOREIGN KEY(Group_ID) REFERENCES `Group`(Group_ID)
);

create table TypeQuestion (
Type_id int AUTO_INCREMENT PRIMARY KEY,
Type_name ENUM ('Essay', 'Multiple-Choice') DEFAULT 'Essay' NOT NULL
);

create table CategoryQuestion (
Category_id INT AUTO_INCREMENT PRIMARY KEY,
Category_name varchar(30)
);

create table Question (
Question_id int AUTO_INCREMENT PRIMARY KEY,
Content TEXT,
Category_id int UNSIGNED NOT NULL,
Type_id int UNSIGNED NOT NULL,
Creator_id int UNSIGNED NOT NULL,
Create_date date,
FOREIGN KEY (Category_id) REFERENCES CategoryQuestion(Category_id),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID),
FOREIGN KEY (Type_id) REFERENCES TypeQuestion(Type_id) 
);

create table Answer (
Answer_id int AUTO_INCREMENT PRIMARY KEY,
Content TEXT,
Question_id int UNSIGNED NOT NULL,
is_Correct ENUM('TRUE','FALSE'),
FOREIGN KEY (Question_id) REFERENCES Question(Question_id)
);

create table Exam ( 
Exam_id int AUTO_INCREMENT PRIMARY KEY,
`Code` TINYINT UNSIGNED NOT NULL,
Title TEXT,
Category_id int UNSIGNED NOT NULL,
Duration time,
Creator_id int UNSIGNED NOT NULL,
Create_date date,
FOREIGN KEY (Category_id) REFERENCES CategoryQuestion(Category_id),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE ExamQuestion (
Exam_id INT PRIMARY KEY ,
Question_id INT UNSIGNED NOT NULL,
FOREIGN KEY (Question_id) REFERENCES Question(Question_id)
);

-- add data department
INSERT INTO Department(Department_ID, Department_name)
VALUES 
(1, N'Marketing' ),
(2, N'Sale' ),
(3, N'Bảo vệ' ),
(4, N'Nhân sự' ),
(5, N'Kỹ thuật' );


-- add data `Position`
INSERT INTO `Position`(Position_ID, Position_name)
VALUES
(1,'Dev'),
(2,'test'),
(3,'Scrum Master'),
(4,'PM');

-- ADD data `Account`
INSERT INTO `Account`(Email, User_name, Full_name, Department_ID, Position_ID, Create_date)
VALUES
('EMAIL1' 'FULL name1', '1', '1', '2021-6-28'),
('EMAIL2' 'FULL name2', '2', '2', '2021-6-28'),
('EMAIL3' 'FULL name3', '3', '3', '2021-6-28'),
('EMAIL4' 'FULL name4', '4', '4', '2021-6-28'),
('EMAIL5' 'FULL name5', '5', '5', '2021-6-28');


-- ADD data `group`
INSERT INTO `Group`(Group_name, Create_id, Create_date)
VALUES 
('Group1', '1', '2021-6-28'),
('Group2', '2', '2021-6-28'),
('Group3', '3', '2021-6-28'),
('Group4', '4', '2021-6-28'),
('Group5', '5', '2021-6-28');

-- ADD data `Group account`
INSERT INTO GroupAccount (Group_id, Account_id, Join_date)
VALUES
(1, 1, '2021-6-28'),
(2, 2, '2021-6-28'),
(3, 3, '2021-6-28'),
(4, 4, '2021-6-28'),
(5, 5, '2021-6-28');

INSERT INTO TypeQuestion (Type_id, Type_name)
VALUES
(1, 'Essay'),
(2, 'Multiple-Choice');

-- ADD data CategoryQuestion
INSERT INTO CategoryQuestion (Category_id, Category_Name)
VALUES 
(1, Category1),
(2, Category2),
(3, Category3),
(4, Category4),
(5, Category5);

-- add data Question
INSERT INTO Question (Content, Category_id, Creator_id, Create_date)
VALUES
('Content1', 1, 1, '2021-6-28'),
('Content2', 2, 2, '2021-6-28'),
('Content3', 3, 3, '2021-6-28'),
('Content4', 4, 4, '2021-6-28'),
('Content5', 5, 5, '2021-6-28');

-- add data `Answer`
INSERT INTO Answer (Content, Question_id, is_Correct)
VALUES
('Content1', 1, 'TRUE'),
('Content2', 2, 'FALSE'),
('Content3', 3, 'TRUE'),
('Content4', 4, 'TRUE'),
('Content5', 5, 'TRUE');

-- ADD DATA Exam
INSERT INTO Exam (`Code`, Title, Category_id, Duration, Creator_id, Create_date)
VALUES
('Code1', 'Tilte1', '60', 1,'2021-6-28'),
('Code1', 'Tilte1', '60', 1,'2021-6-28'),
('Code1', 'Tilte1', '60', 1,'2021-6-28'),
('Code1', 'Tilte1', '60', 1,'2021-6-28'),
('Code1', 'Tilte1', '60', 1,'2021-6-28');

-- add data ExamQuestion
INSERT INTO ExamQuestion(Exam_id, Question_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

