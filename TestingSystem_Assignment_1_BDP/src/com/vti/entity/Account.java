package com.vti.entity;

import java.time.LocalDate;

import javax.swing.GroupLayout.Group;

public class Account {
	public int id;
	public String email;
	public String userName;
	public String fullName;
	public Department department;
	public Position position;
	public LocalDate createDate;
	public com.vti.entity.Group[] groups;

}
