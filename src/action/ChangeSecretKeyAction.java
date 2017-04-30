package action;

import java.sql.Connection;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import xtra.UserLoginAs;

@SuppressWarnings("serial")
public class ChangeSecretKeyAction extends ActionSupport {
	String newkey,secretmsg="";


public String getNewkey() {
	return newkey;
}

public void setNewkey(String newkey) {
	this.newkey = newkey;
}

public String getSecretmsg() {
	return secretmsg;
}

public void setSecretmsg(String secretmsg) {
	this.secretmsg = secretmsg;
}

@Override
	public void validate() {
	
	
	if(newkey.length()!=5){
		addFieldError("newkey", "key must be of 5 digit");
	}
}



@Override
	public String execute() throws Exception {
	Connection cn=DataBaseConnection.connect();
	String usertype=UserLoginAs.getLoginAs();
	String usernametype=UserLoginAs.getUsernametype();
	String username=UserLoginAs.getUsername();
	String sql="update "+usertype+" set secretkey="+newkey+
			" where "+usernametype+"='"+username+"'";
	//System.out.println("under key"+sql);
Statement st=cn.createStatement();
int status=st.executeUpdate(sql);
if(status>0){
	secretmsg="Secret key changed!!!";
	return SUCCESS;
}

else{
	return INPUT;
}
}

	}







