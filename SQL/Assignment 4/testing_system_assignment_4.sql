USE testing_system_assignment_3;

-- Q1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT A.FullName, D.DepartmentName 
FROM testing_system_assignment_3.`Account` A 
JOIN testing_system_assignment_3.Department D ON A.DepartmentID = D.DepartmentID;


-- Q2: Viết lệnh để lấy thông tin các account được tạo sau ngày 20/12/2010
SELECT A.Email, A.Username, A.FullName, A.CreateDate 
FROM testing_system_assignment_3.`Account` A
ORDER BY CreateDate > 2010/12/20;


-- Q3: Viết lệnh để lấy ra tất cả các developer
SELECT A.FullName, P.PositionName 
FROM testing_system_assignment_3.`Account` A 
JOIN testing_system_assignment_3.Position P ON A.PositionID = P.PositionID
WHERE P.PositionName = 'Dev';


-- Q4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.DepartmentID, D.DepartmentName, count(*) as SLNV 
FROM testing_system_assignment_3.department D 
JOIN testing_system_assignment_3.`Account` A ON D.DepartmentID = A.DepartmentID
GROUP BY D.DepartmentID, D.DepartmentName
HAVING SLNV >=3;


-- Q5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT C.CategoryID, count(*)
FROM testing_system_assignment_3.CategoryQuestion C
JOIN testing_system_assignment_3.Question Q  on C.CategoryID = Q.CategoryID 
GROUP BY C.CategoryID;
-- Q12:Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT Q.QuestionID, C.CategoryID,  T.TypeID, E.CreatorID, An.QuestionID, COUNT(*)
FROM testing_system_assignment_3.Question Q
JOIN testing_system_assignment_3.CategoryQuestion C on C.CategoryID = Q.CategoryID
JOIN testing_system_assignment_3.TypeQuestion T on T.TypeID = Q.TypeID
JOIN testing_system_assignment_3.Exam E on E.CreatorID = Q.CreatorID
JOIN testing_system_assignment_3.Answer An on An.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID
;
