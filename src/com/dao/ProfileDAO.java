package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.apache.struts2.ServletActionContext;

import com.database.DataBaseConnection;

import bean.Objects.Customer;
import bean.Objects.ObjectFactory;
import bean.Objects.Parent;
import bean.Objects.Provider;

public class ProfileDAO {
	String user;
	public Customer getCustomerProfile() throws ClassNotFoundException, SQLException{
		
	HttpSession session= ServletActionContext.getRequest().getSession(true);
    String table=(String)session.getAttribute("usertype");
    String username=(String)session.getAttribute("user");
    if(username.contains("@")&&username.contains("."))
    	user="email_id";
    else user="username";
   Connection cn=DataBaseConnection.connect();
  String sql="SELECT *from customer where "+user+"='"+username+"'";
  System.out.println("under profiledao:"+sql);  //test
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery(sql);
	Customer customer=new Customer();
	    rs.next();
		customer.setCust_id(rs.getInt("cust_id"));
		customer.setUsername(rs.getString("username"));
		customer.setPassword(rs.getString("password"));
		//System.out.println("password under profile dao"+rs.getString("password"));  //checking password   customer.setF_name(rs.getString("f_name"));
		customer.setL_name(rs.getString("l_name"));
		customer.setGender(rs.getString("gender"));
		customer.setDob(rs.getDate("dob"));
		customer.setFacebook(rs.getString("facebook"));
		customer.setAadhar_number(rs.getString("aadhar_number"));
		customer.setCity(rs.getString("city"));
		customer.setCountry(rs.getString("country"));
		customer.setDist((rs.getString("dist")));
		customer.setEmail_id(rs.getString("email_id"));
		customer.setFathers_name(rs.getString("fathers_name"));
		customer.setFeedback(rs.getString("feedback"));
		customer.setFirst_address(rs.getString("first_address"));
		customer.setLinkedin(rs.getString("linkedin"));
		customer.setPincode(rs.getInt("pincode"));
		customer.setProfilepic(rs.getString("profile_pic"));
		customer.setQualification(rs.getString("qualification"));
		customer.setSecond_address(rs.getString("second_address"));
		customer.setSecretkey(rs.getString("secretkey"));
		customer.setState(rs.getString("state"));
		customer.setStatus(rs.getString("status"));
		customer.setTwitter(rs.getString("twitter"));
		customer.setWork(rs.getString("work"));
		return customer;
	}
	
	public Provider getProviderProfile() throws ClassNotFoundException, SQLException{
		HttpSession session= ServletActionContext.getRequest().getSession();
	    String table=(String)session.getAttribute("usertype");
	    String username=(String)session.getAttribute("user");
	    if(username.contains("@")&&username.contains("."))
	    user="email_id";
	    else user="username";
	    Connection cn=DataBaseConnection.connect();
	    String sql="SELECT *from serviceprovider where "+user+"='"+username+"'";
	    System.out.println("query under profile dao:"+sql);  //test
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		Provider provider=new Provider();
		rs.next();
		provider.setSp_id(rs.getInt("sp_id"));
		provider.setUsername(rs.getString("username"));
		provider.setPassword(rs.getString("password"));
		provider.setF_name(rs.getString("f_name"));
		provider.setL_name(rs.getString("l_name"));
		provider.setGender(rs.getString("gender"));
		provider.setDob(rs.getDate("dob"));
		provider.setFathers_name(rs.getString("fathers_name"));
		provider.setEmail_id(rs.getString("email_id"));
		provider.setFirst_address(rs.getString("first_address"));
		provider.setSecond_address(rs.getString("second_address"));
		provider.setCity(rs.getString("city"));
		provider.setDist(rs.getString("district"));
		provider.setState(rs.getString("state"));
		provider.setCountry(rs.getString("country"));
		provider.setPincode(rs.getInt("pincode"));
		provider.setQualification(rs.getString("qualification"));
		provider.setAadhar_number(rs.getString("aadhar_number"));
		provider.setWork(rs.getString("work"));
		provider.setFacebook(rs.getString("facebook"));
		provider.setTwitter(rs.getString("twitter"));
		provider.setLinkedin(rs.getString("linkedin"));
		provider.setRating(rs.getInt("rating"));
		provider.setStatus(rs.getString("status"));
		provider.setProfilepic(rs.getString("profile_pic"));
		provider.setSecretkey(rs.getString("secretkey"));
		provider.setPAN(rs.getString("pan_number"));
		provider.setFee(rs.getDouble("fee_to_work"));
		provider.setAvailable_from(rs.getDate("available_from"));
		provider.setAvailable_to(rs.getDate("available_to"));
		provider.setAvailability_Status(rs.getString("availability_status"));
		provider.setFeedback(rs.getString("feedback"));
		provider.setCategory(rs.getString("category"));
		provider.setAbout_me(rs.getString("about_me"));
		return provider;
			
	} 
	//TESTING
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

	new ProfileDAO().getProviderProfile().getCity();
     
		
	}
	
	
}
