package action;

import java.sql.Connection;
import java.sql.Statement;

import com.database.DataBaseConnection;
import com.opensymphony.xwork2.ActionSupport;

import bean.Objects.ObjectFactory;
import bean.Objects.Parent;
import xtra.UserLoginAs;

@SuppressWarnings("serial")
public class DeactivationAction extends ActionSupport {
private String msg1;

	


	public String getMsg1() {
	return msg1;
}

public void setMsg1(String msg1) {
	this.msg1 = msg1;
}

	@Override
	public String execute() throws Exception {
		String x;
			Connection cn=DataBaseConnection.connect();
			String usertype=UserLoginAs.getLoginAs().toLowerCase();
			if(usertype.equalsIgnoreCase("serviceprovider")){
				x="provider";
			}else x="customer";
			String usernametype=UserLoginAs.getUsernametype();
			String username=UserLoginAs.getUsername();
			//System.out.println("usertype is="+usertype);
		Parent p=new ObjectFactory().getObject(x);
		String statusofuser =p.getStatus();
		System.out.println("status of user::"+statusofuser);
		
		String sql;
			if(statusofuser.equals("Active")){
			sql="update "+usertype+" set status='Deactive'"+
			" where "+usernametype+"='"+username+"'";
		}else
		{
			sql="update "+usertype+" set status='Active'"+
					" where "+usernametype+"='"+username+"'";
		}
		
		System.out.println("under change password"+sql);
		Statement st=cn.createStatement();
		int status=st.executeUpdate(sql);
		if(status>0){
			msg1="!!Account deactivated!!!";
			return SUCCESS;
		}
		
		else{
			return ERROR;
		}
		
	}
}
