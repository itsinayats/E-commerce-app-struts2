package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

import bean.Objects.Provider;

public class SearchDAO {

	@SuppressWarnings("unused")
	public ArrayList<Provider> getProfile(String category,String sortitem,String ascdsc) throws ClassNotFoundException, SQLException{
		
		Connection cn=DataBaseConnection.connect();
	String	sql="Select *from serviceprovider where category='"+category+"'"
				+ " ORDER BY "+sortitem+" "+ascdsc+"";
	System.out.println("hello baby thisis ascdsc::"+ascdsc);
	ArrayList<Provider> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next()!=false){
Provider provider=new Provider();
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
list.add(provider);
}
return list;
	}
	
	
public String getParentCategory(String sc_name) throws ClassNotFoundException, SQLException{
	Connection cn=DataBaseConnection.connect();
	String  sql="select parent from sub_categories where sc_name='"+sc_name+"'";
	Statement stm=cn.createStatement();
ResultSet rs=stm.executeQuery(sql);
rs.next();

String result=rs.getString("parent");
return result;

	
}


public ArrayList<Provider> getResult(String key,String sortitem,String ascdsc) throws ClassNotFoundException, SQLException{
	
	Connection cn=DataBaseConnection.connect();
String	sql="SELECT * FROM serviceprovider where "+
"category like '%"+key+"%'"+
 "or f_name like '%"+key+"%'"+ 
 "or l_name like '%"+key+"%'"+
 "or first_address like '%"+key+"%'"+
 "or second_address like '%"+key+"%'"+
 "or district like '%"+key+"%'"+
 "or state like '%"+key+"%'"+
 "or category like '%"+key+"%'"+
 "or city like '%"+key+"%'"
 + " ORDER BY "+sortitem+" "+ascdsc+"";
ArrayList<Provider> list=new ArrayList<>();
Statement st=cn.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next()!=false){
Provider provider=new Provider();
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
list.add(provider);
}
return list;
}
	
	
	/*For TESTING*/
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {


//okTESTED
/*ArrayList<Provider> p=new SearchDAO().getProfile("dinner","gzb","f_name","ASC");
	int i=0;
	while(p!=null&&i<p.size()){
System.out.println(p.get(i).getF_name());
	i++;}*/
		//okTESTED
/*	String name=new SearchDAO().getParentCategory("plumber");
	System.out.println(name);*/
	/*ArrayList<Provider> p=new SearchDAO().getResult("d","f_name","ASC");
	int i=0;
	while(p!=null&&i<p.size()){
	System.out.println(p.get(i).getF_name());
    i++;}*/
	//OK passed	
	}
}
