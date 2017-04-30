package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.oreilly.servlet.MultipartRequest;
@SuppressWarnings("serial")
public class UploadAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		 
	HttpServletRequest request=	ServletActionContext.getRequest();
		try {
			MultipartRequest m = new MultipartRequest(request, "d:/new");
			System.out.println("ok");
		} catch (IOException e) {
			System.out.println(e.toString());
		}
return SUCCESS;
	}

}
