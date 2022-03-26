package com.shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;


import com.shopping.models.Admin;


@Component
public class AdminDao {
	@Autowired
	private JdbcTemplate jdbctemplate;

	public Admin find(String username,String password) {

		PreparedStatementSetter setter = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, username);
				ps.setString(2, password);
			}
		};

		return jdbctemplate.query("select * from admin where uname=? and pass=?", setter,
				new ResultSetExtractor<Admin>() {

					@Override
					public Admin extractData(ResultSet rs) throws SQLException, DataAccessException {

						Admin emp = null;
						if (rs.next()) {
							emp=new Admin();
							emp.setUsername(rs.getString(1));
							emp.setPassword(rs.getString(2));
						}
						return emp;
					}
				});
	}
	
	public boolean addAdmin(Admin admin) {
		int r=0;
		r= jdbctemplate.update("insert into admin values (?,?)",admin.getUsername(),admin.getPassword());
		if(r>0) {return true;}
		else {return false;}
	}

	public boolean deleteAdmin(String uname) {
		System.out.println(uname);
		int r=0;
		r= jdbctemplate.update("delete from admin where uname=?",uname);
		if(r>0) {return true;}
		else {return false;}
	}	
		
}
