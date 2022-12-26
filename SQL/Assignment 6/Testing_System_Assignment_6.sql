USE Testing_System_Assignment_3;


DROP PROCEDURE IF EXISTS get_department_name;
DELIMITER $$
CREATE PROCEDURE get_department_name (IN depID_input  INT, OUT depName_output NVARCHAR(50))
				BEGIN 
					SELECT		D.DepartmentName INTO depName_output
                    FROM		Testing_System_Assignment_3.Department D
                    WHERE		D.DepartmentID = depID_input ;
				END$$
DELIMITER ;

-- Use

SET @v_department_1_name = '';
CALL Testing_System_Assignment_3.get_department_name ('5', @v_department_1_name);
SELECT @v_department_1_name;
                    
                    
-- Truyền DepartmentName ra DepartmentID

DROP PROCEDURE IF EXISTS get_department_id;
DELIMITER $$
CREATE PROCEDURE get_department_id (IN depName_input  NVARCHAR(50), OUT depId_output INT)
				BEGIN 
					SELECT		D.DepartmentID INTO depId_output
                    FROM		Testing_System_Assignment_3.Department D
                    WHERE		D.DepartmentName = depName_input ;
				END$$
DELIMITER ;
-- Use
SET @v_department_1_id = '';
CALL Testing_System_Assignment_3.get_department_id (@v_department_1_name, @v_department_1_id);
SELECT @v_department_1_id;


-- đưa input vào trong 
-- DROP PROCEDURE IF EXISTS get_department_id;
-- DELIMITER $$
-- CREATE PROCEDURE get_department_id (IN in_author_variable  NVARCHAR(50))
				-- BEGIN 
					-- DECLARE 		
					-- SELECT		D.DepartmentID INTO depId_output
                    -- FROM		Testing_System_Assignment_3.Department D
                    -- WHERE		D.DepartmentName = depName_input ;
				-- END$$
-- DELIMITER ;
-- Use
-- SET @v_department_1_id = '';
-- CALL Testing_System_Assignment_3.get_department_id (@v_department_1_name, @v_department_1_id);
-- SELECT @v_department_1_id;


-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_AccountFromDepartment;
DELIMITER $$
CREATE PROCEDURE get_AccountFromDepartment(IN dep_name NVARCHAR(50))
				BEGIN
						SELECT A.AccountID, A.FullName, D.DepartmentName 
						FROM Testing_System_Assignment_3.Account A
						INNER JOIN Testing_System_Assignment_3.Department D ON D.DepartmentID = A.DepartmentID
						WHERE D.DepartmentName = dep_name;
				END$$
DELIMITER ;
Call get_AccountFromDepartment('Nhân sự');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
-- đang lỗi chưa chạy đc 
DROP PROCEDURE IF EXISTS get_AccountFromGroup;
DELIMITER $$
CREATE PROCEDURE get_AccountFromGroup(IN group_name NVARCHAR(50))
				BEGIN
						SELECT G.GroupName, COUNT(GA.AccountID) AS SL 
						FROM Testing_System_Assignment_3.GroupAccount GA
						INNER JOIN Testing_System_Assignment_3.Group G ON GA.GroupID = G.GroupID
						WHERE G.GroupName = group_name;
				END$$
DELIMITER ;
Call get_AccountFromGroup('VTI Sale 02');

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS get_CountTypeInMonth;
DELIMITER $$
CREATE PROCEDURE get_CountTypeInMonth(IN date_now DATE)
BEGIN
SELECT TQ.TypeName, count(Q.TypeID) 
FROM Testing_System_Assignment_3.Question Q
INNER JOIN Testing_System_Assignment_3.TypeQuestion TQ ON Q.TypeID = TQ.TypeID
WHERE month(Q.CreateDate) = month(now()) AND year(Q.CreateDate) = year(now())
GROUP BY Q.TypeID;
END$$
DELIMITER ;
SET @v_get_CountTypeInMonth_1 = '';
Call Testing_System_Assignment_3.get_CountTypeInMonth();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS get_CountQuesFromType;
DELIMITER $$
CREATE PROCEDURE get_CountQuesFromType()
BEGIN
WITH CTE_MaxTypeID AS(
					SELECT count(Q.TypeID) AS SL 
					FROM Testing_System_Assignment_3.Question Q
					GROUP BY Q.TypeID
				 )
SELECT TQ.TypeName, count(Q.TypeID) AS SL 
FROM Question Q
INNER JOIN Testing_System_Assignment_3.TypeQuestion TQ ON TQ.TypeID = Q.TypeID
GROUP BY Q.TypeID
HAVING count(Q.TypeID) = (
							SELECT MAX(SL) 
                            FROM CTE_MaxTypeID
						 );
END$$
DELIMITER ;
Call Testing_System_Assignment_3.get_CountQuesFromType();


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question

DROP PROCEDURE IF EXISTS get_CountQuesFromType;
DELIMITER $$
CREATE PROCEDURE get_CountQuesFromType()
BEGIN
WITH MaxTypeID AS(
					SELECT count(Q.TypeID) AS SL 
                    FROM Testing_System_Assignment_3.Question Q
					GROUP BY Q.TypeID
				 )
SELECT TQ.TypeName, count(Q.TypeID) AS SL 
FROM Testing_System_Assignment_3.Question Q
INNER JOIN TypeQuestion TQ ON TQ.TypeID = Q.TypeID
GROUP BY Q.TypeID
HAVING count(Q.TypeID) = (
							SELECT MAX(SL) 
							FROM MaxTypeID
						 );
END$$
DELIMITER ;
Call get_CountQuesFromType();
SET @ID = '';
Call get_CountQuesFromType(@ID);
SELECT * FROM TypeQuestion WHERE TypeID = @ID;


-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS Question_7;
DELIMITER $$
CREATE PROCEDURE Question_7(IN full_name VARCHAR(50), IN email NVARCHAR(50))
	BEGIN
		SELECT @userName := SUBSTRING_INDEX(@email, "@", 1);
		SET @full_name = "Nguyen Hai Dang";
		INSERT INTO `Account` (Email, Username, Fullname, DepartmentID	, PositionID, createDate)
		VALUE (@email	, @userName		, @full_name		, 5				, 1			, '2020-03-05'	) ;
	END$$
DELIMITER ;
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Bảng Exam có liên kết khóa ngoại đến bảng examquestion vì vậy trước khi xóa dữ liệu trong
-- bảng exam cần xóa dữ liệu trong bảng examquestion trước
DROP PROCEDURE IF EXISTS DeleteExamID;
DELIMITER $$
CREATE PROCEDURE DeleteExamID (IN in_ExamID SMALLINT UNSIGNED)
BEGIN
DELETE FROM Testing_System_Assignment_3.ExamQuestion
WHERE ExamID = in_ExamID;
DELETE FROM Testing_System_Assignment_3.Exam
WHERE ExamID = in_ExamID;
END$$
DELIMITER ;
CALL DeleteExamID(7);

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
USE quanlybaithi;
DROP PROCEDURE IF EXISTS MaxQuest;
DELIMITER $$
CREATE PROCEDURE MaxQuest( IN essay_or_multi VARCHAR(50))
BEGIN
DECLARE ID INT ;
SET ID = (SELECT tq.TypeID FROM typequestion tq WHERE tq.TypeName = essay_or_multi);
WITH CTE_LengContent AS(
						SELECT length(q.Content) AS leng FROM question q
						WHERE TypeID = ID
                        )
SELECT * FROM question q
WHERE TypeID = ID
AND length(q.Content) = (SELECT MAX(leng) FROM CTE_LengContent);
END$$
DELIMITER ;
CALL MaxQuest('Essay');


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

