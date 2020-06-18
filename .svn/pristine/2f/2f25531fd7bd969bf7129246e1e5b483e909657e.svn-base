package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;
import com.br.vo.Product;

/**
 * 
 * @author naru057
 *
 */
public class ProductDao {
	ArrayList<Product> products;

	/**
	 * 
	 * @param product
	 */
	public void insertProduct(Product product) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.insertProduct"));
		connection.setAutoCommit(false);
		pstmt.setString(1, product.getName());
		pstmt.setInt(2, product.getAmount());
		pstmt.setInt(3, product.getPrice());
		pstmt.setInt(4, product.getPoint());
		pstmt.setInt(5, product.getDiscountPrice());
		pstmt.setString(6, product.getCategory());
		pstmt.setString(7, product.getExplain());
		pstmt.executeUpdate();
		System.out.println("main insert complete");
		pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductNo"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			product.setNo(rs.getInt("product_no"));
		}
		System.out.println("get product_no complete : " + product.getNo());
		
		pstmt = connection.prepareStatement(QueryUtil.getSQL("product.insertImagePath"));
		pstmt.setInt(1,product.getNo());
		pstmt.setString(2, product.getImagePath());
		pstmt.executeUpdate();
		System.out.println("image path insert complete");
		List<String> tags = product.getTags();
		for(String tag : tags) {
		pstmt = connection.prepareStatement(QueryUtil.getSQL("product.insertProductTags"));
		pstmt.setInt(1,product.getNo());
		pstmt.setString(2, tag);
		pstmt.executeUpdate();
		}
		System.out.println("tag insert complete");
		connection.commit();
		
		ConnectionUtil.close(connection, pstmt, rs);
	}

	/**
	 * 
	 * @param category
	 */
	public List<Product> getProductsByCategory(String category) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductsByCategory"));
		pstmt.setString(1, category);
		ResultSet rs = pstmt.executeQuery();
		products = new ArrayList<Product>();
		while (rs.next()) {
			Product product = new Product();
			int no = rs.getInt("product_no");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int point = rs.getInt("point");
			int discountPrice = rs.getInt("discount_price");
			String imagePath = rs.getString("image_path");
			String explain = rs.getString("explain");
			product.setNo(no);
			product.setName(name);
			product.setPrice(price);
			product.setPoint(point);
			product.setDiscountPrice(discountPrice);
			product.setExplain(explain);
			product.setImagePath(imagePath);
			product.setCategory(category);
			product.setTags(getProductTagByProductNo(rs.getInt("product_no")));
			products.add(product);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return products;
	}

	public List<Product> getProductsByTag(String tag) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductsByTag"));
		pstmt.setString(1, tag);
		ResultSet rs = pstmt.executeQuery();
		products = new ArrayList<Product>();
		while (rs.next()) {
			Product product = new Product();
			int no = rs.getInt("product_no");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int point = rs.getInt("point");
			int discountPrice = rs.getInt("discount_price");
			String imagePath = rs.getString("image_path");
			String explain = rs.getString("explain");
			String category = rs.getString("category");
			product.setNo(no);
			product.setName(name);
			product.setPrice(price);
			product.setPoint(point);
			product.setDiscountPrice(discountPrice);
			product.setExplain(explain);
			product.setImagePath(imagePath);
			product.setTags(getProductTagByProductNo(rs.getInt("product_no")));
			product.setCategory(category);
			products.add(product);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return products;
	}

	/**
	 * 
	 * @param productNo
	 */
	public Product getProductByProductNo(int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		Product product = new Product();
		if (rs.next()) {
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int point = rs.getInt("point");
			int amount = rs.getInt("amount");
			int discountPrice = rs.getInt("discount_price");
			String imagePath = rs.getString("image_path");
			String explain = rs.getString("explain");
			String category = rs.getString("category");
			product.setNo(rs.getInt("product_no"));
			product.setName(name);
			product.setPrice(price);
			product.setPoint(point);
			product.setAmount(amount);
			product.setDiscountPrice(discountPrice);
			product.setExplain(explain);
			product.setImagePath(imagePath);
			product.setCategory(category);
			product.setTags(getProductTagByProductNo(productNo));
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return product;
	}

	/**
	 * 
	 * @param product
	 */
	public void updateProduct(Product product) throws SQLException {
	}

	public ArrayList<String> getProductTagByProductNo(int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductTagByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<String> tags = new ArrayList<String>();
		while (rs.next()) {
			tags.add(rs.getString("product_tag"));
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return tags;
	}

	public ArrayList<Product> getAllProducts() throws SQLException {
		ArrayList<Product> products = new ArrayList<Product>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getAllProducts"));
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Product product = new Product();
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int point = rs.getInt("point");
			int discountPrice = rs.getInt("discount_price");
			String imagePath = rs.getString("image_path");
			String explain = rs.getString("explain");
			String category = rs.getString("category");
			product.setName(name);
			product.setPrice(price);
			product.setPoint(point);
			product.setDiscountPrice(discountPrice);
			product.setExplain(explain);
			product.setImagePath(imagePath);
			product.setCategory(category);
			product.setTags(getProductTagByProductNo(rs.getInt("product_no")));
			products.add(product);
		}

		ConnectionUtil.close(connection, pstmt, rs);

		return products;
	}

}
