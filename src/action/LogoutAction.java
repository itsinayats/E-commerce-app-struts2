package action;


import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport {
String msg="!!!Logged Out Successfully!";

	public String getMsg() {
	return msg;
}

	@Override
	public String execute() throws Exception {
		SessionMap ses=(SessionMap) ActionContext.getContext().getSession();
		ses.invalidate();
		return SUCCESS;
	}

	
	
	
}
