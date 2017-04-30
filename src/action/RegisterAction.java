package action;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport {
	private String registertype;
	
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



	
	public String execute(){
return SUCCESS;


	
}
	}
