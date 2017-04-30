package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.sun.crypto.provider.RSACipher;

import xtra.UserLoginAs;

public class LoginDAO {
	
	public static boolean validateUser(String username,String password,String usertype){
		boolean status=false;
		String loginThrough;
		if(username.contains("@")&& username.contains(".")){
			loginThrough="email_id";
		}else
			loginThrough="username";
		try {
   Connection cn=DataBaseConnection.connect();
   UserLoginAs.setUsernametype(loginThrough);
  String sql="SELECT *";
 sql=sql.concat("from "+usertype+" where "+loginThrough+"=? and password=?");
/* System.out.println(sql);                          //FOR TESTING*/
  PreparedStatement ps=cn.prepareStatement(sql);
  ps.setString(1, username);
  ps.setString(2, password);
 System.out.println(ps);
ResultSet rs=ps.executeQuery();
  status=rs.next();
			
	/*SETTING CURRENT DATE FOR THE USER*/
/*	if(status==true){
	String sql2="update "+usertype+" set last_active_time=NOW() where "+loginThrough+"='"+username+"'";
    Statement st=cn.createStatement();
    st.executeUpdate(sql2);
    
	}*/
	/*END SETTING CURRENT DATE*/	
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
		
	} 

public static String getPassword(String usertype,String username,String secretkey){
	String password=null;
	String loginThrough;
	if(username.contains("@")&& username.contains(".")){
		loginThrough="email_id";
	}else
		loginThrough="username";
	
	try {
		  Connection cn=DataBaseConnection.connect();
		  String sql="select password from "+usertype+" where "+loginThrough+"=? AND secretkey=?";
		  System.out.println(sql);    //testing
		  PreparedStatement ps=cn.prepareStatement(sql);
		  ps.setString(1, username);
		  ps.setString(2, secretkey);
		  ResultSet rs= ps.executeQuery();
		  rs.next();
	password=rs.getString("password");
	}catch(Exception e){
		e.printStackTrace();
	}
	return password;
}	
	
	
	
	
	
	/* //TESTING
	public static void main(String[] args) {
	Boolean status=	LoginDAO.validateUser("piyush@gmail.com","password","serviceprovider");
	if(status==true){
		System.out.println("success!!!");
	}
	}*/
	
	//TESTING
/*public static void main(String[] args) {
	String password=LoginDAO.getPassword("customer","inayat.asdf@gmail.com","82278");
System.out.println(password);
}*/
	
	

}
