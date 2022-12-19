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
					FROM testing_system_assignment_3.department
					WHERE DepartmentName = 'Sale'
)
) Q1
;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

