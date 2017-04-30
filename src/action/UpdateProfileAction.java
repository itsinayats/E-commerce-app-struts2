package action;

import com.dto.UpdateProfileDTO;
import com.opensymphony.xwork2.ActionSupport;

import bean.Objects.ObjectFactory;
import bean.Objects.Parent;
import xtra.UserLoginAs;

@SuppressWarnings("serial")
public class UpdateProfileAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		 String  obj;
	String user=UserLoginAs.getLoginAs().toLowerCase();
	obj=user;
	if(user.equalsIgnoreCase("ServiceProvider"))
    obj="Provider";
Parent object=	new ObjectFactory().getObject(obj);
	return SUCCESS;
	}
	
	
	
}
