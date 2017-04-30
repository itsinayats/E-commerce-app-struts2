package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.MenuDAO;
import com.dto.RegisterDTO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.config.ServletContextAwareConfigurationProvider;

import xtra.Usertype;

@SuppressWarnings("serial")
public class RegisterProcessingAction extends ActionSupport implements Preparable{
	private String firstName,lastName,email,password;
	private ArrayList<String> categoryList;
	private String chosenCategoryList="";
	public String info;
	
	@Override
	public void validate() {
		if(firstName.length()<2){
			addFieldError("firstName","first name must be greater than 2 ");
		}
		if(lastName.length()<2){
			addFieldError("lastName", "last name must be greater than 2"); 
		}
		if(password.length()<5){
			addFieldError("password", "password must be greater than 5");
		}
		if(!email.contains("@")&&(!email.contains("."))){
			addFieldError("email", "please provide valid email id");
		}
		if(chosenCategoryList.equals("-1")){
			addFieldError("chosenCategoryList", "please select your specialisation");
		}
	}
	
	
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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



	@Override
	public void prepare() throws Exception {
		categoryList=MenuDAO.getAllSubMenuItems();
		Collections.sort(categoryList);
	}

	@Override
	public String execute() throws Exception {
		boolean status = false;
		String registerAs=Usertype.getRegisterAs();//from class exra package
		
		if(registerAs.equalsIgnoreCase("customer")){
		status=RegisterDTO.doRegisterCustomer(firstName,lastName,email,password);
		if(status==true){
		HttpSession session=ServletActionContext.getRequest().getSession(true);
		/*session.setAttribute("usertype","customer");
		session.setAttribute("user", email);*/
		}
		}
		
		else if(registerAs.equalsIgnoreCase("service-provider")){
			status=RegisterDTO.doRegisterProvider(firstName,lastName,email,password,chosenCategoryList);
			if(status==true){
			HttpSession session=ServletActionContext.getRequest().getSession(true);
			/*session.setAttribute("usertype","provider");
			session.setAttribute("user", email);*/
		}
		}
		
		if(status==true){
			info=RegisterDTO.getMessage();
			return SUCCESS;
		}
		return ERROR;
		
		
	}
	
	
	}
   
