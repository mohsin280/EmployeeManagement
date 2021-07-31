package com.nagarro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nagarro.model.User;



@Repository
public class UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void saveUser(User user) {
		hibernateTemplate.save(user);
		
	}
	
	public boolean findUser(String uname,String upwd) {
		boolean isValidUser = false;
		try {
			User user = hibernateTemplate.get(User.class, uname);
			if (user != null && user.getPassword().equals(upwd)) {
                isValidUser = true;
            }
        } catch(Exception e) {
            isValidUser = false;    
        }
		
		return isValidUser;
	}

}
