package com.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBaseConnection;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import xtra.Usertype;

public class RegisterDTO {
	static int status;
	public static String message="!!!Congratulations!!<br>SuccessFully Registered!!";
	
	
	public static String getMessage() {
		return message;
	}
	public static void setMessage(String message) {
		RegisterDTO.message = message;
	}
	
	
	public static boolean doRegisterProvider(String firstName,String lastName,String email,String password,String category) throws ClassNotFoundException, SQLException{	
		Connection cn=DataBaseConnection.connect();
		System.out.println(firstName+lastName+email+password+category);//test
		String sql="insert into serviceprovider(f_name,l_name,email_id,password,category,last_active_time,status,availability_status) "+" values(?,?,?,?,?,NOW(),'Active','Available')";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, email);
		ps.setString(4, password);
		ps.setString(5, category);
		try{
		status=ps.executeUpdate();
		
		}catch(MySQLIntegrityConstraintViolationException e){
			System.out.println(e.getMessage());           //FOR TEST
		
			RegisterDTO.setMessage("Email_Id Already Registered in our database");
           // System.out.println(RegisterDTO.getMessage());	
		}
		if(status!=0){
			RegisterDTO.setMessage("!!!Congratulations!!SuccessFully Registered!!");
			return true;
		}
			else return false;
	} 
	
	
	

	public static boolean doRegisterCustomer(String firstName, String lastName, String email, String password) throws SQLException, ClassNotFoundException {
     	Connection cn=DataBaseConnection.connect();
     	System.out.println(firstName+lastName+email+password);
		String sql="insert into customer(f_name,l_name,email_id,password,last_active_time,status) "+" values(?,?,?,?,NOW(),'Active')";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, email);
		ps.setString(4, password);
		try{
		status=ps.executeUpdate();
		
		}catch(MySQLIntegrityConstraintViolationException e){
			System.out.println(e.getMessage());           //FOR TEST
		
			RegisterDTO.setMessage("Email_Id Already Registered in our database");
           // System.out.println(RegisterDTO.getMessage());	
		}
		if(status!=0){
			RegisterDTO.setMessage("!!!Congratulations!!SuccessFully Registered!!");
			return true;
		}
			else return false;	
	}
	
	
	//TESTING STARTS............
public static void main(String[] args) throws ClassNotFoundException, SQLException {
	
// FOR TESTING
boolean status=	RegisterDTO.doRegisterCustomer("mmmm","mmmmmmmmmm" , "isihihis.@g", "4444444444");
System.out.println(status);
System.out.println(RegisterDTO.getMessage());
	
	//TESTING ENDS..............
	}
	
}
