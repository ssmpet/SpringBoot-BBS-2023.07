package com.ys.sbbs.service;

import java.sql.Connection;
import java.util.List;

import com.ys.sbbs.entity.User;

public interface UserService {
	public static final int CORRECT_LOGIN = 0;
	public static final int WRONG_PASSWORD = 1;
	public static final int UID_NOT_EXIST = 2;

	Connection getConnection();

	int getUserCount();
	
	User getUser(String uid);
	
	List<User> getUserList(int page);
	
	void registerUser(User user);
	
	void updateUser(User user);
	
	void updateUserPassword(String pwd, String uid);
	
	void deleteUser(String uid);

	int login(String uid, String pwd);
}