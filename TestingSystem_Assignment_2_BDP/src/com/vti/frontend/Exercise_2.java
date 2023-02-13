package com.vti.frontend;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.Position.PositionName;

public class Exercise_2 {
	public static void main(String[] args) {
		// Tạo Department

		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "Marketing";
		Department dep2 = new Department();
		dep2.id = 2;
		dep2.name = "Sale";
		Department dep3 = new Department();
		dep3.id = 3;
		dep3.name = "BOD";

		// Tạo Position

		Position pos1 = new Position();
		pos1.id = 1;
		pos1.name = PositionName.Dev;
		Position pos2 = new Position();
		pos2.id = 2;
		pos2.name = PositionName.PM;
		Position pos3 = new Position();
		pos3.id = 3;
		pos3.name = PositionName.Scrum_Master;

		// Tạo Group

		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Testing System";
		group1.createDate = LocalDate.of(2021, 1, 1);
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Development";

		group2.createDate = LocalDate.of(2020, 2, 1);
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Sale";
		group3.createDate = LocalDate.of(2019, 9, 23);

		// Tạo Account

		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "NguyenVanA@gmail.com";
		acc1.userName = "Nguyễn";
		acc1.fullName = "Nguyễn Văn A";
		acc1.department = dep2;
		acc1.position = pos1;
		acc1.createDate = LocalDate.now();
		Group[] groupAcc1 = { group1, group2 };
		acc1.groups = groupAcc1;
		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "NguyenVanB@gmail.com";
		acc2.userName = "Nguyễn";
		acc2.fullName = "Nguyễn Văn B";
		acc2.department = dep1;
		acc2.position = pos2;
		acc2.createDate = LocalDate.of(2021, 03, 17);
		acc2.groups = new Group[] { group3, group2 };
		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "phuong@gmail.com";
		acc3.userName = "Bui";
		acc3.fullName = "Phuong Bui";
		acc3.department = dep3;
		acc3.position = pos3;
		acc3.createDate = LocalDate.now();

		// add Group Account

		group1.accounts = new Account[] { acc1 };
		group2.accounts = new Account[] { acc1, acc2 };
		group3.accounts = new Account[] { acc2 };

		// Question 1:

		System.out
				.println("Question 1:Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số nguyên đó");
		int i = 5;
		System.out.printf("%d%n", i);
		System.out.printf("%d%n", i);

		// Question 2:

		System.out.println(
				"Question 2:Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in ra số nguyên đó ");
		int i1 = 100000000;
		System.out.printf(Locale.US, "%,d%n", i1);

		// Question 3:

		System.out.println("-------------Question 3:-------------");
		float c = 5.567098f;
		System.out.printf("%5.4f%n", c);

		// Question 4:

		System.out.println("-------------Question 4:-------------");
		String s = "Nguyễn Văn A";
		System.out.printf("Tên tôi là \"" + s + "\" và tôi đang độc thân\n");

		// Question 5:

		System.out.println("-------------Question 5:-------------");
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);
		
		// Question 6:
	}

}
