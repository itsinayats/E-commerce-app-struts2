package action;

import com.dao.LoginDAO;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ForgetPasswordAction extends ActionSupport {
	private String usertype,username,secretkey,passwordmessage;
	
	@Override
	public void validate() {
	 
		if(username.length()<3){
			addFieldError("username","Please enter valid email or username");
		}
		if(usertype.length()<5){
			addFieldError("usertype","please select usertype first");
		}
		if(secretkey.length()!=5){
			addFieldError("secretkey","Secret key must be of 5 digit");
		}
		
	}
	
	public  String getPasswordmessage() {
		return passwordmessage;
	}

	public  void setPasswordmessage(String passwordmessage) {
		this.passwordmessage = passwordmessage;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setSecretkey(String secretkey) {
		this.secretkey = secretkey;
	}


	
	@Override
	public String execute() throws Exception {
		String password=LoginDAO.getPassword(usertype, username, secretkey);
		if(password==null)
			addFieldError("passwordmessage", "ERROR!!WRONG CREDENTIALS ENTERED!!!");
			
		else
		addFieldError("passwordmessage", "YOUR PASSSWORD IS: "+password);
		
	  return INPUT;
	}
	
}
