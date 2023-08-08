package login;

public class Logincheck {

	public static void main(String[] args) {
		String id = "test@test.ka";
		String pw = "zxc123!!";
		
		LoginDAO loginDAO = new LoginDAO();
		
		int result = loginDAO.login(id, pw);
		
		System.out.println(result);

	}

}
