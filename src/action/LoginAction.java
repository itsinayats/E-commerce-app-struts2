package action;


import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.dao.LoginDAO;
import com.opensymphony.xwork2.ActionSupport;

import xtra.UserLoginAs;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	private HttpServletResponse response;
	private String password;
	private static String usertype;
	SessionMap<String, String> sessionMap;
	public static String username;
	Boolean status=false,status2=false;
	
	public void  validate() {
		if(username.length()<1){
		addFieldError("username","UserName/email can't be blank");  
		}
		 if(password.length()<5)  
		 addFieldError("password","Password must be greater than 5");  
		 
		 if(usertype.equals("-1")){
			 addFieldError("usertype","Please select Usertype first");
		 }
		}

	public void setPassword(String password) {
		this.password = password;
	}
	

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}  
	
	public String execute(){  
	status=LoginDAO.validateUser(username, password, usertype);
	if(status==true){
		HttpSession session=ServletActionContext.getRequest().getSession(true);
		HttpSession session1=ServletActionContext.getRequest().getSession(true);  
		session.setAttribute("user", username);
		session1.setAttribute("usertype", usertype);
		/* SET LOGIN AS*/	
		UserLoginAs.setLoginAs(usertype);
		System.out.println("ok set");
		UserLoginAs.setUsername(username);
		System.out.println("under login action:usertype="+UserLoginAs.getLoginAs()+",username="+username);
		return SUCCESS;
	}
	   else {
		   addFieldError("username","INVALID USERNAME OR PASSWORD");
	   return INPUT;
	}
		
	}
	
	//SETTING SESSION
/*	@Override
	public void setSession(Map session) {
	sessionMap=(SessionMap) session;
	System.out.println(this.username);
	status2=LoginDAO.validateUser(this.username, this.password, this.usertype);
	if(status2!=null)
    sessionMap.put("username",LoginAction.username);
	sessionMap.put("usertype",LoginAction.usertype);
		
	}

*/
	public String logout(){
	    sessionMap.invalidate();     //when no custom validation 
		return SUCCESS;
		
	}
	

}