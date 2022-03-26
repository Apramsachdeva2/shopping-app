package com.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ProductDao;
import com.shopping.models.Product;

@Service
public class ProductService {
	@Autowired
	private ProductDao productDao;

	public List<Product> findProducts(){
		return productDao.findAll();
		
	} 

	public boolean addProduct(Product p) {
		if(productDao.addProduct(p)) {return true;}
		else {return false;}
	}
	public boolean deleteProduct(int p) {
		System.out.println(p);
		if(productDao.deleteProduct(p)) {return true;}
		else {return false;}
	}
	
	public Product find(int pId) {
		return productDao.find(pId);
	}
	public boolean updateProduct(Product p) {
		
		if(productDao.update(p)) {return true;}
		else {return false;}
		
	}
	
}
