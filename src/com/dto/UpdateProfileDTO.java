package com.dto;

import java.sql.Connection;
import java.sql.SQLException;

import com.database.DataBaseConnection;

import bean.Objects.Customer;
import bean.Objects.ObjectFactory;
import bean.Objects.Parent;
import xtra.UserLoginAs;
import xtra.Usertype;

public class UpdateProfileDTO {
	public static  void setProfileData(String userType) throws ClassNotFoundException, SQLException{
	String table=userType.toLowerCase();
	Connection cn=DataBaseConnection.connect();
	

	}
	
}
