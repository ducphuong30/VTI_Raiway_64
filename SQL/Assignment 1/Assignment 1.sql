drop database if exists Testing_System_Assignment_1 ;
CREATE DATABASE if not exists Testing_System_Assignment_1 ;
USE Testing_System_Assignment_1 ;
drop table if exists Department;
CREATE TABLE Department (
DepartmentID                INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName              NVARCHAR(50) UNIQUE KEY
 
);

CREATE TABLE Position (
PositionID                  INT AUTO_INCREMENT PRIMARY KEY ,
PositionName                NVARCHAR(50) NOT NULL
);

CREATE TABLE `Account` (
AccountID                   SMALLINT AUTO_INCREMENT PRIMARY KEY ,
Email                       NVARCHAR(50) NOT NULL ,
Fullname                    VARCHAR(50) ,
DepartmentID                INT UNSIGNED,
PositionID                  INT ,
createDate                  DATE,
FOREIGN KEY (DepartmentID)  REFERENCES Department (DepartmentID),
FOREIGN KEY (PositionID)    REFERENCES Position (PositionID)
);
CREATE TABLE `Group` (
GroupID                     INT PRIMARY KEY AUTO_INCREMENT,
GroupName                   NVARCHAR(50) NOT NULL,
CreatorID                   SMALLINT,
CreateDate                  DATE,
FOREIGN KEY (CreatorID )    REFERENCES `Account`(AccountID)
);
CREATE TABLE GroupAccount (
GroupID                     INT AUTO_INCREMENT PRIMARY KEY,
AccountID                   SMALLINT NOT NULL,
JoinDate                    DATE,
FOREIGN KEY (GroupID)       REFERENCES `Group`(GroupID),
FOREIGN KEY (AccountID)     REFERENCES `Account`(AccountID)
);
CREATE TABLE TypeQuestion (
TypeID                      SMALLINT AUTO_INCREMENT PRIMARY KEY,
TypeName                    NVARCHAR(100) NOT NULL
);
CREATE TABLE CategoryQuestion (
CategoryID                  SMALLINT AUTO_INCREMENT PRIMARY KEY,
CategoryName                NVARCHAR(100) NOT NULL
);
CREATE TABLE Question (
QuestionID                  SMALLINT AUTO_INCREMENT PRIMARY KEY,
Content                     NVARCHAR(100) NOT NULL,
CategoryID                  SMALLINT NOT NULL,
TypeID                      SMALLINT NOT NULL,
CreatorID                   SMALLINT NOT NULL,
CreateDate                  DATE,
FOREIGN KEY  (TypeID)       REFERENCES TypeQuestion (TypeID),
FOREIGN KEY  (CategoryID)   REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY  (CreatorID)    REFERENCES `Account`(AccountID)
);
CREATE TABLE Answer (
AnswerID                    MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
Content                     NVARCHAR(100) NOT NULL,
QuestionID                  SMALLINT NOT NULL,
isCorrect                   VARCHAR(50) NOT NULL,
FOREIGN KEY (QuestionID)    REFERENCES Question(QuestionID)
);
CREATE TABLE Exam (
ExamID                      SMALLINT AUTO_INCREMENT PRIMARY KEY,
`Code`                      INT NOT NULL,
Title                       NVARCHAR(50) NOT NULL,
CategoryID                  SMALLINT NOT NULL,
Duration                    DATE,
CreatorID                   INT NOT NULL,
CreateDate                  DATE,
FOREIGN KEY (CategoryID)    REFERENCES CategoryQuestion(CategoryID)
);
CREATE TABLE ExamQuestion (
ExamID                      SMALLINT AUTO_INCREMENT PRIMARY KEY,
QuestionID                  SMALLINT NOT NULL,
FOREIGN KEY (ExamID)        REFERENCES Exam(ExamID),
FOREIGN KEY (QuestionID )   REFERENCES Question(QuestionID)
);
INSERT INTO Department(DepartmentID,DepartmentName)
VALUES                  ('1','ghdshvg'),
						 ('2','ghdshv'),
                          ('3','ghdsh');
                        
