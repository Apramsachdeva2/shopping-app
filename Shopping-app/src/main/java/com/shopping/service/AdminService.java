package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.AdminDao;
import com.shopping.models.Admin;


@Service
public class AdminService {
	@Autowired 
	private AdminDao dao;
	
	public boolean validAdmin(String username,String password) {
		
		if(dao.find(username, password)!=null) {
			return true;
		}
		else 
			return false;
	}
	public boolean addAdmin(Admin a) {
		if(dao.addAdmin(a)) {return true;}
		else {return false;}
	}
	public boolean deleteAdmin(String p) {
		System.out.println(p);
		if(dao.deleteAdmin(p)) {return true;}
		else {return false;}
	}
}
