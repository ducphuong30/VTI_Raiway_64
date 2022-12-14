drop database if exists Testing_System_Assignment_3 ;
CREATE DATABASE if not exists Testing_System_Assignment_3 ;
USE Testing_System_Assignment_3 ;
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
Username                    NVARCHAR(50) NOT NULL ,
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
CreateDate                  DATE ,
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
AnswerID                    INT AUTO_INCREMENT PRIMARY KEY,
Content                     NVARCHAR(100) NOT NULL,
QuestionID                  SMALLINT NOT NULL,
isCorrect                   VARCHAR(50) NOT NULL,
FOREIGN KEY (QuestionID)    REFERENCES Question(QuestionID)
);
CREATE TABLE Exam (
ExamID                      SMALLINT AUTO_INCREMENT PRIMARY KEY,
`Code`                      VARCHAR(50) NOT NULL,
Title                       NVARCHAR(50) NOT NULL,
CategoryID                  SMALLINT NOT NULL,
Duration                    TINYINT,
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
-- Insert data into department
INSERT INTO Department	(DepartmentName )
VALUE 					('Marketing'),
						('Sale'),
						('B???o v???'),
						('Nh??n s???'),
						('K??? thu???t'),
						('T??i ch??nh'),
						('Ph?? gi??m ?????c'),
						('Gi??m ?????c'),
						('Th?? k??'),
						('B??n h??ng'); 
    
-- Insert data into position
INSERT INTO position	(PositionName)
VALUE 					('Dev'),
						('Test'),
						('Scrum Master'),
						('PM');


-- Insert data into account
INSERT INTO `Account` (Email								, Username			, Fullname				, DepartmentID	, PositionID, createDate 	)
VALUE 					('haidang29productions@gmail.com'	, 'dangblack'		, 'Nguyen Hai Dang'		, 5				, 1			, '2020-03-05'	),
						('account1@gmail.com'				, 'quanganh'		, 'Tong Quang Anh'		, 1				, 2			, '2020-03-05'	),
						('account2@gmail.com'				, 'vanchien'		, 'Nguyen Van Chien'	, 2				, 3			, '2020-03-07'	),
						('account3@gmail.com'				, 'cocoduongqua'	, 'Duong Do'			, 3				, 4			, '2020-03-08'	),
						('account4@gmail.com'				, 'doccocaubai'		, 'Nguyen Chien Thang'	, 4				, 4			, '2020-03-10'	),
						('dapphatchetngay@gmail.com'		, 'khabanh'			, 'Ngo Ba Kha'			, 6				, 3			, '2020-04-05'	),
						('songcodaoly@gmail.com'			, 'huanhoahong'		, 'Bui Xuan Huan'		, 7				, 2			, '2020-04-05'	),
						('sontungmtp@gmail.com'				, 'tungnui'			, 'Nguyen Thanh Tung'	, 8				, 1			, '2020-04-07'	),
						('duongghuu@gmail.com'				, 'duongghuu'		, 'Duong Van Huu'		, 9				, 2			, '2020-04-07'	),
						('vtiaccademy@gmail.com'			, 'vtiaccademy'		, 'Vi Ti Ai'			, 10			, 1			, '2020-04-09'	);

-- Insert data into group
INSERT INTO `Group`	(GroupName				, CreatorID		    , CreateDate	)
VALUE 				('Testing System'		,   '5'				, '2019-03-05'	),
					('Developement'			,   '1'				, '2020-03-07'	),
                    ('VTI Sale 01'			,   '2'				, '2020-03-09'	),
                    ('VTI Sale 02'			,   '3'				, '2020-03-10'	),
                    ('VTI Sale 03'			,   '4'				, '2020-03-28'	),
                    ('VTI Creator'			,   '6'				, '2020-04-06'	),
                    ('VTI Marketing 01'		,   '7'				, '2020-04-07'	),
                    ('Management'			,   '8'				, '2020-04-08'	),
                    ('Chat with love'		,   '9'				, '2020-04-09'	),
                    ('Vi Ti Ai'				,   '10'			, '2022-12-10'	);

-- Insert data into group_account
INSERT INTO GroupAccount	(  GroupID	, AccountID, JoinDate		)
VALUE 						(	1		,    1		, '2019-03-05'	),
							(	2		,    2		, '2020-03-07'	),
							(	3		,    3		, '2020-03-09'	),
							(	4		,    4		, '2020-03-10'	),
							(	5		,    5		, '2020-03-28'	),
							(	6		,    6		, '2020-04-06'	),
							(	7		,    7		, '2020-04-07'	),
							(	8		,    8		, '2020-04-08'	),
							(	9		,    9		, '2020-04-09'	),
							(	10		,    10		, '2020-04-10'	);


-- Insert data into type_question
INSERT INTO TypeQuestion	(TypeName) VALUE ('Essay'), ('Multiple-Choice'); 

-- Insert data into category_question
INSERT INTO CategoryQuestion	(CategoryName)
VALUE							('Java'),
								('ASP.NET'),
								('ADO.NET'),
								('SQL'),
								('Postman'),
								('Ruby'),
								('Python'),
								('C++'),
								('C Sharp'),
								('PHP'); 

-- Insert data into question
INSERT INTO Question	(Content			, CategoryID, TypeID 		, CreatorID	, CreateDate )
VALUE 					('C??u h???i v??? Java'	,	1		,   '1'			,   '1'			,'2020-04-05'),
						('C??u H???i v??? PHP'	,	10		,   '2'			,   '2'			,'2020-04-05'),
						('H???i v??? C#'		,	9		,   '2'			,   '3'			,'2020-04-06'),
						('H???i v??? Ruby'		,	6		,   '1'			,   '4'			,'2020-04-06'),
						('H???i v??? Postman'	,	5		,   '1'			,   '5'			,'2020-04-06'),
						('H???i v??? ADO.NET'	,	3		,   '2'			,   '6'			,'2020-04-06'),
						('H???i v??? ASP.NET'	,	2		,   '1'			,   '7'			,'2020-04-06'),
						('H???i v??? C++'		,	8		,   '1'			,   '8'			,'2020-04-07'),
						('H???i v??? SQL'		,	4		,   '2'			,   '9'			,'2020-04-07'),
						('H???i v??? Python'	,	7		,   '1'			,   '10'		,'2020-12-07');

-- Insert data into answer
INSERT INTO Answer	(Content		, QuestionID	, isCorrect )
VALUE 				('Tr??? l???i 01'	,   1			,	0		),
					('Tr??? l???i 02'	,   1			,	1		),
                    ('Tr??? l???i 03'	,   1			,	0		),
                    ('Tr??? l???i 04'	,   1			,	1		),
                    ('Tr??? l???i 05'	,   2			,	1		),
                    ('Tr??? l???i 06'	,   3			,	1		),
                    ('Tr??? l???i 07'	,   4			,	0		),
                    ('Tr??? l???i 08'	,   8			,	0		),
                    ('Tr??? l???i 09'	,   9			,	1		),
                    ('Tr??? l???i 10'	,   10			,	1		);
	
-- Insert data into exam
INSERT INTO Exam	(`Code` 		, Title				    , CategoryID	, Duration	, CreatorID 	, CreateDate )
VALUE 				('VTIQ001'		, '????? thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, '????? thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    ('VTIQ003'		, '????? thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, '????? thi Java'			,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, '????? thi Ruby'			,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, '????? thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, '????? thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, '????? thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, '????? thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, '????? thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
-- Insert data into exam_question
INSERT INTO ExamQuestion	(QuestionID, 	ExamID 	)
VALUE 						(1			,	1		),
							(2			,	2		),
							(3			,	3		),
							(4			,	4		),
							(5			,	5		),
							(6			,	6		),
							(7			,	7		),
							(8			,	8		),
							(9			,	9		),
							(10			,	10		);
