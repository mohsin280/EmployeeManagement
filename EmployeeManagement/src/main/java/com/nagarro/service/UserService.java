package com.nagarro.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nagarro.dao.UserDao;
import com.nagarro.model.User;



@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public void createUser(User user) {
		userDao.saveUser(user);
	}
	
	public boolean validateUser(User user) {
		String uname = user.getUsername();
		String pwd = user.getPassword();
		return userDao.findUser(uname, pwd);
	}
}
