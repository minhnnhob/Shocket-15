DROP DATABASE IF EXISTS Extra_assignment;

Create database IF NOT EXISTS Extra_assignment;

USE FresherTrainingManagement;

drop TABLE IF EXISTS Trainee;

CREATE TABLE IF NOT EXISTS Trainee (
    Trainee_Id INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(50),
    Birth_Date DATE NOT NULL,
    Gender ENUM('MALE', 'FEMALE', 'UNKNOWN') DEFAULT 'UNKNOWN',
    ET_IQ TINYINT UNSIGNED,
    CHECK (ET_IQ <= 20),
    ET_Gmath TINYINT UNSIGNED,
    CHECK (ET_Gmath <= 20),
    ET_ENGLISH TINYINT UNSIGNED,
    CHECK (ET_ENGLISH <= 50),
    TRAINING_CLASS INT UNSIGNED,
    Evaluation_Notes TEXT
);  

ALTER TABLE Trainee
    ADD VTI_Account varchar(70) not null unique key;

