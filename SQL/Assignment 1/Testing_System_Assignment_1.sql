CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
CREATE TABLE Department (
Department_ID INT,
Department_name varchar(40)
);

CREATE TABLE Position (
Position_ID INT,
Position_name varchar(30)
);

create table `Account` (
Account_id int,
Email varchar(70),
User_name varchar(50),
Full_name varchar(70),
Department_ID INT,
Position_ID int,
Create_date date
);

create table `Group` (
Group_id int,
Group_name varchar(50),
Creator_id int,
Create_date date
);

create table GroupAccount (
Group_ID int,
Account_id int,
Join_date date
);

create table TypeQuestion (
Type_id int,
Type_name varchar(50)
);

create table CategoryQuestion (
Category_id int,
Category_name varchar(30)
);

create table Question (
Question_id int,
Content varchar(500),
Category_id int,
Type_id int,
Creator_id int,
Create_date date);

create table Answer (
Answer_id int,
Content varchar(500),
Question_id int,
is_Correct varchar(7)
);

create table Exam ( 
Exam_id int,
`Code` int,
Title varchar(40),
Category_id int,
Duration time,
Creator_id int,
Create_date date
);

Create table ExamQuestion (
Exam_id int,
Question_id int
);



hgfhfgh