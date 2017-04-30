package action;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import bean.Objects.ObjectFactory;
import bean.Objects.Parent;
import xtra.UserLoginAs;

@SuppressWarnings("serial")
public class ChangePasswordAction extends ActionSupport{
private String old_password,new_password,repeat_password,msg;
	


public String getMsg() {
	return msg;
}

public void setMsg(String msg) {
	this.msg = msg;
}

public String getOld_password() {
	return old_password;
}

public void setOld_password(String old_password) {
	this.old_password = old_password;
}

public String getNew_password() {
	return new_password;
}


public void setNew_password(String new_password) {
	this.new_password = new_password;
}

public String getRepeat_password() {
	return repeat_password;
}

public void setRepeat_password(String repeat_password) {
	this.repeat_password = repeat_password;
}

@Override
	public void validate() {
	String password = null,x;
	String userType=UserLoginAs.getLoginAs().toLowerCase();
	if(userType.equalsIgnoreCase("serviceprovider")){
		x="provider";
	}else x="customer";
	try{

		
	Parent data=new ObjectFactory().getObject(x);
     password=data.getPassword();
     System.out.println("password is:"+password);
	}catch(Exception e){
		System.out.println(e.toString());
	}
	
	if(old_password.length()<5){
	    addFieldError("old_password","!!must be greater than 5");
	}
	if(new_password.length()<5){
	    addFieldError("new_password","!!must be greater than 5");
	}
	if(repeat_password.length()<5){
	    addFieldError("repeat_password","!!must be greater than 5");
	}
	if((old_password!=null||!old_password.equals(""))){
	if(!old_password.equals(password)){
			addFieldError("old_password","!!wrong old password Entered!");
	}
	}
	if(!new_password.equals(repeat_password)){
		addFieldError("repeat_password","!!repeat password not match");
	}
	System.out.println("old password is:"+old_password+"and new is"+password+"usertype is"+userType);
	
}


	@Override
	public String execute() throws Exception {
		
		
	    System.out.println("repeatpassword is:"+repeat_password);
		Connection cn=DataBaseConnection.connect();
		String usertype=UserLoginAs.getLoginAs();
		String usernametype=UserLoginAs.getUsernametype();
		String username=UserLoginAs.getUsername();
		System.out.println("change passwordr::::usertype"+usernametype);
		String sql="update "+usertype+" set password="+new_password+
				" where "+usernametype+"='"+username+"'";
		System.out.println("under change password"+sql);
	Statement st=cn.createStatement();
	int status=st.executeUpdate(sql);
	if(status>0){
		msg="Password Changed!!!";
		return SUCCESS;
	}
	
	else{
		msg="Password not changed!!";
		return INPUT;
	}
	}
	
	}
	
