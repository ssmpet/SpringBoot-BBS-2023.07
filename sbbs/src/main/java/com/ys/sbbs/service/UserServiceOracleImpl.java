package com.ys.sbbs.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.ys.sbbs.db.UserDaoOracle;
import com.ys.sbbs.entity.User;

@Primary
@Service
public class UserServiceOracleImpl implements UserService {
	@Autowired UserDaoOracle userDao;
	
	@Override
	public int getUserCount() {
		return userDao.getUserCount();
	}

	@Override
	public User getUser(String uid) {
		return userDao.getUser(uid);
	}

	@Override
	public List<User> getUserList(int page) {
		int offset = (page - 1) * 10;
		List<User> list = userDao.getUserList(offset);
		return list;
	}

	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void updateUserPassword(String pwd, String uid) {
		userDao.updateUserPassword(pwd, uid);
	}

	@Override
	public void deleteUser(String uid) {
		userDao.deleteUser(uid);
	}

	@Override
	public int login(String uid, String pwd) {
		User user = userDao.getUser(uid);
		if (user == null)
			return UID_NOT_EXIST;
		else if (BCrypt.checkpw(pwd, user.getPwd()))
			return CORRECT_LOGIN;
		else
			return WRONG_PASSWORD;
	}

}