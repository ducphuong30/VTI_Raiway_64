-- thêm cột trong bảng 
 
SELECT M.MONTH, count(month(Q.CreateDate)) AS SL FROM Question M
LEFT JOIN (SELECT * FROM Question Q WHERE year(Q1.CreateDate) = year(now()) ) Q
ON M.MONTH = month(Q.CreateDate)
GROUP BY M.MONTH;


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



-- trigger_Departmenttrigger_DepartmentTạo trigger ngăn người dùng xóa Department có id = 1
DROP TRIGGER IF EXISTS trigger_Department;
DELIMITER $$
CREATE TRIGGER  trigger_Department
BEFORE DELETE  ON Testing_System_Assignment_3.Department
FOR EACH ROW 
BEGIN
		DELETE
		FROM Testing_System_Assignment_3.Department
		WHERE DepartmentID = 1;
END $$
DELIMITER ;
-- Disable trigger_Department 
SHOW TRIGGERS