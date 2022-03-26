package com.shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;


import com.shopping.models.Product;

@Component
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> findAll(){
		return jdbcTemplate.query("select *from product",new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Product p=new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				return p;
			}
		});
	}
	
	
	public Product find(int pId) {

		PreparedStatementSetter setter = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, pId);
				//ps.setString(2, password);
			}
		};

		return jdbcTemplate.query("select * from product where pid=?", setter,
				new ResultSetExtractor<Product>() {

					@Override
					public Product extractData(ResultSet rs) throws SQLException, DataAccessException {

						Product p = null;
						if (rs.next()) {
							p=new Product();
							p.setProductId(rs.getInt(1));
							p.setProductName(rs.getString(2));
							p.setProductPrice(rs.getDouble(3));
							
						}
						return p;
					}
				});
	}

	
	public boolean addProduct(Product product) {
		int r=0;
		r= jdbcTemplate.update("insert into product values (?,?,?)",product.getProductId(),product.getProductName(),product.getProductPrice());
		if(r>0) {return true;}
		else {return false;}
	}
	
	public boolean deleteProduct(int productId) {
		System.out.println(productId);
		int r=0;
		r= jdbcTemplate.update("delete from product where pid=?",productId);
		if(r>0) {return true;}
		else {return false;}
	}
	
	public boolean update(Product product) {
		int r=0;
		System.out.println(product.getProductName());
		System.out.println(product.getProductPrice());
		r= jdbcTemplate.update("update product set pname=?,price=? where pid=?",product.getProductName(),product.getProductPrice(),product.getProductId());
		if(r>0) {return true;}
		else {return false;}
		
		
	}
	
}
