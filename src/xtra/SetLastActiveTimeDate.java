package xtra;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.database.*;

import com.database.DataBaseConfig;
import com.database.DataBaseConnection;

public class SetLastActiveTimeDate {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		try{
		Connection cn=DataBaseConnection.connect();
		String sql="insert into serviceprovider (f_name,l_name,email_id,password,category,last_active_time) "+" values(?,?,?,?,?,NOW())";
		PreparedStatement ps=cn.prepareStatement(sql);
        ps.setString(1, "love");
        ps.setString(2, "love");
        ps.setString(3, "lov");
        ps.setString(4, "love");
        ps.setString(5, "love");

        
        int f=ps.executeUpdate();
	if(f==1){
		System.out.println("ok done");
	}
		
		
	}catch(Exception e){
		System.out.println(e.toString());
		
	}

	}}
