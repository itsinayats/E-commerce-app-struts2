package action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import com.dao.MenuDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

import xtra.Usertype;

@SuppressWarnings("serial")
public class RegisterPreAction extends ActionSupport implements Preparable {
	private String registertype;
	ArrayList<String> categoryList;
	private String chosenCategoryList;
	
	
	@Override
	public void validate() {
		if(registertype.equals("-1"))
		addFieldError("registertype","please select Registration type");
	
	
	}
	public String getRegistertype() {
		return registertype;
	}


	public void setRegistertype(String registertype) {
		this.registertype = registertype;
	}
	
	
	public ArrayList<String> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(ArrayList<String> categoryList) {
		this.categoryList = categoryList;
	}
	
	
	public String getChosenCategoryList() {
		return chosenCategoryList;
	}
	public void setChosenCategoryList(String chosenCategoryList) {
		this.chosenCategoryList = chosenCategoryList;
	}
	//PREPARE METHOD UNDER PREPARABLE INTERFACE
	@Override
	public void prepare() throws Exception {
		categoryList=MenuDAO.getAllSubMenuItems();
		Collections.sort(categoryList);
		
	}
	

	public String execute() throws ClassNotFoundException, SQLException{
		Usertype.setRegisterAs(registertype);
		
		 return SUCCESS;
      }
	
	
	
	
	
	
	
	
	
	
}
