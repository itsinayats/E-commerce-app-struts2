package xtra;

public class UserLoginAs {
	
	private static String loginAs,username,usernametype;

	public static String getUsernametype() {
		return usernametype;
	}

	public static void setUsernametype(String usernametype) {
		UserLoginAs.usernametype = usernametype;
	}

	public static String getLoginAs() {
		return loginAs;
	}

	public static void setLoginAs(String loginAs) {
		UserLoginAs.loginAs = loginAs;
	}

	public static String getUsername() {
		return username;
	}

	public static void setUsername(String username) {
		UserLoginAs.username = username;
	}

	public static void main(String[] args) {
		System.out.println(UserLoginAs.getLoginAs());
	}

}
