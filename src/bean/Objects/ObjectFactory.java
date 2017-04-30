package bean.Objects;

import java.sql.SQLException;

import com.dao.ProfileDAO;

public class ObjectFactory {
	
	public Parent getObject(String classname) throws ClassNotFoundException, SQLException{
	
		if(classname.equalsIgnoreCase("customer")){
			ProfileDAO dao=new ProfileDAO();
			Customer cs=dao.getCustomerProfile();
			return cs;
			
			
		}
		else if(classname.equalsIgnoreCase("provider")){
			ProfileDAO dao=new ProfileDAO();
			Provider pf=dao.getProviderProfile();
			return pf;
		}
		else return null;
		
		}
	
public static void main(String[] args) throws ClassNotFoundException, SQLException {
	ObjectFactory f=new ObjectFactory();
Parent p=f.getObject("customer");
	/*Parent p=f.getObject("customer");
	p=new ProfileDAO().getCustomerProfile();*/
	System.out.println(p.getEmail_id());
	
	

}
}
