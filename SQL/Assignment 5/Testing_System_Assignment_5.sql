-- KHI JION THÌ FOREIGN KEY (KHÓA PHỤ) = PRIMARY KEY(KHÓA CHÍNH)
USE Testing_System_Assignment_3;
DROP VIEW IF EXISTS Group30;
CREATE VIEW Group30 AS
SELECT G3.GroupID 
FROM (
		SELECT G.GroupID, G.GroupName, COUNT(*) soluongnhanvien 
		FROM testing_system_assignment_3.Group G
		JOIN testing_system_assignment_3.GroupAccount GA ON G.GroupID = GA.GroupID
		GROUP BY G.GroupID , G.GroupName
		HAVING soluongnhanvien = (
				SELECT MIN(soluongnhanvien) 
                FROM(
					SELECT G.GroupID , G.GroupName, COUNT(*) soluongnhanvien
					FROM testing_system_assignment_3.Group G 
					JOIN testing_system_assignment_3.GroupAccount GA ON G.GroupID = GA.GroupID
					GROUP BY G.GroupID , G.GroupName
				) AS soluongnhanvien 
		)
) G3;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS Question_1;
CREATE VIEW Question_1 AS
SELECT Q1.DepartmentID
FROM(
SELECT *
		FROM testing_system_assignment_3.Account
		WHERE DepartmentID =(
							SELECT DepartmentID
							FROM testing_system_assignment_3.Department
							WHERE DepartmentName = 'Sale'
							)
	) Q1
;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW get_Account AS
WITH CTE_GetListCountAccount AS(
								SELECT count(GA1.AccountID) AS countGA1 
								FROM testing_system_assignment_3.GroupAccount GA1
								GROUP BY GA1.AccountID
								)
SELECT A.AccountID, A.Username, count(GA.AccountID) AS SL 
FROM testing_system_assignment_3.GroupAccount GA
INNER JOIN testing_system_assignment_3.Account A ON GA.AccountID = A.AccountID
GROUP BY GA.AccountID
HAVING count(GA.AccountID) = (
							  SELECT MAX(countGA1) AS maxCount 
                              FROM CTE_GetListCountAccount
							 )
;
SELECT * FROM get_Account;
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW ContenTren300Tu AS
SELECT *
FROM Question
WHERE LENGTH(Content) > 7
;
SELECT * FROM ContenTren300Tu
;
DELETE FROM ContenTren300Tu
;
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW MaxNV AS
SELECT D.DepartmentName, count(A.DepartmentID) AS SL
FROM testing_system_assignment_3.Account A
INNER JOIN testing_system_assignment_3.Department D ON D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
HAVING count(A.DepartmentID) = (
								SELECT MAX(countDEP_ID) AS maxDEP_ID 
                                FROM(
										SELECT count(A1.DepartmentID) AS countDEP_ID 
										FROM testing_system_assignment_3.Account A1
										GROUP BY A1.DepartmentID
									) AS Q4
								);
SELECT * FROM MaxNV
;
