package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.database.DataBaseConnection;

public class MenuDAO {
	
	public static ArrayList<String > getMenuItems() throws ClassNotFoundException, SQLException{
		ArrayList<String> list=new ArrayList<>();
	
Connection cn=DataBaseConnection.connect();
		String sql="SELECT *from category_menu where menu_status='Y'";
		Statement st=cn.createStatement();
        ResultSet rs=st.executeQuery(sql);
        while(rs.next()){
        	list.add(rs.getString("menu_name"));
        }
		rs.close();
		st.close();
		cn.close();
		return list;
		
	}
	
	public static ArrayList<String > getSubMenuItems(String parent) throws ClassNotFoundException, SQLException{
		ArrayList<String> list=new ArrayList<>();
		Connection cn=DataBaseConnection.connect();
		System.out.println(parent);   //for test
		String sql="SELECT * from sub_categories where parent=? and status=?";
	    PreparedStatement st=cn.prepareStatement(sql);
	    st.setString(1, parent);
	    st.setString(2, "Y");
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			list.add(rs.getString("sc_name"));
		}
		rs.close();
		st.close();
		cn.close();
		return list;
		}
	
	
	public static ArrayList<String> getAllSubMenuItems() throws ClassNotFoundException, SQLException{
		
		ArrayList<String> list=new ArrayList<>();
		Connection cn=DataBaseConnection.connect();
		
		String sql="SELECT * from sub_categories where status=?";
	    PreparedStatement st=cn.prepareStatement(sql);
	    st.setString(1, "Y");
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			list.add(rs.getString("sc_name"));
		}
		rs.close();
		st.close();
		cn.close();
		return list;
		
	}
	
	
	
	
	/*public static void main(String[] args) {
		ArrayList<String> list=new ArrayList<>();
		try{
		list=MenuDAO.getMenuItems();
			list=MenuDAO.getSubMenuItems("bus");
		int i=0;
		while(i<list.size()){                                  //OK TESTED
		System.out.println("it is"+list.get(i));
		i++;
	
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/

}
