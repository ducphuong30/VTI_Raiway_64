-- Question 2: lấy ra tất cả các phòng ban - Question 3:lấy ra id của phòng ban "Sale" 
SELECT * 
FROM testing_system_assignment_3.department
WHERE DepartmentName LIKE 'Sale'
;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT * 
FROM testing_system_assignment_3.Group
ORDER BY CreateDate < '2019/12/20'
;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT * 
FROM testing_system_assignment_3.Group
ORDER BY CreateDate < '2019/12/20'
;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * 
FROM testing_system_assignment_3.Account
WHERE Fullname LIKE 'd%o'
;
-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(AccountID)  
AS 'SO NHAN VIEN'
FROM testing_system_assignment_3.Account
WHERE DepartmentID = '2'
;
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT  QuestionID, COUNT(*) soluong
 FROM testing_system_assignment_3.Answer
GROUP BY QuestionID
HAVING soluong >=4
;

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT * 
FROM testing_system_assignment_3.Account
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM Account )
ORDER BY Fullname DESC
;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * 
FROM testing_system_assignment_3.Account
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM Account ) AND DepartmentID = 3
ORDER BY Fullname DESC
;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * 
FROM testing_system_assignment_3.Group
ORDER BY CreateDate DESC
LIMIT 5
;
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE Account SET Fullname = N 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5
;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
SET FOREIGN_KEY_CHECK=0;
UPDATE GroupAccount SET AccountID = 5 
WHERE GroupID = 4 ;
SET FOREIGN_KEY_CHECK=1;